import 'dart:io';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/model/search_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_hotel_booking_ui/dio/dio_helper.dart';
import 'package:flutter_hotel_booking_ui/model/planner_model.dart';
import 'package:flutter_hotel_booking_ui/model/res_model.dart';
import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';
import 'package:flutter_hotel_booking_ui/models/room_details_model.dart';
import 'package:flutter_hotel_booking_ui/models/rooms_model.dart';
import 'package:flutter_hotel_booking_ui/routes/route_names.dart';

class GeneralProvider extends ChangeNotifier {
  var responsebodyRooms;
  List<HotelModel>? listHotelModel;
  List<RoomsModel>? listRoomsModel;
  DioHelper dio = DioHelper();
  void getHotals() async {
    try {
      Uri uri = Uri.parse(   baseUrl + 'api/hotel/h');
      var response = await http.get(uri);
      var responsebodyHotal = jsonDecode(response.body);
      listHotelModel = [];
      responsebodyHotal.forEach((hotel) {
        listHotelModel!.add(HotelModel.fromJson(hotel));
      });
      notifyListeners();
      print(listHotelModel![1].name);
      print("Seccess Get Hotels Data");
    } on HttpException catch (e) {
      print("not get Data For Hotels");
      print(e.message);
    }
  }

  void getRooms({required String id}) async {
    try {
      Uri uri = Uri.parse(baseUrl + 'api/room/finds/$id');
      var response = await http.get(uri);
      responsebodyRooms = jsonDecode(response.body);
      listRoomsModel = [];
      responsebodyRooms.forEach((rooms) {
        listRoomsModel!.add(RoomsModel.fromJson(rooms));
      });
      print(responsebodyRooms);
      print("Success To Get Rooms");
      notifyListeners();
    } on HttpException catch (e) {
      notifyListeners();
      print("not get Data For Rooms");
      print(e.message);
    }
  }

  void register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    dio.postData(
      endPoint: "api/auth/signup",
      body: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password
      },
    ).then((value) {
      NavigationServices(context).gotoTabScreen();
      notifyListeners();
      print("Success");
    }).catchError((e) {
      print(e);
      SnackBar snackBar =
          const SnackBar(content: Text("Email Or Password Not Correct"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("Error in Register");
      // print(e.response!.statusCode);
      log(e.toString());
    });
  }

  bool isLogin = false;
  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    dio.postData(
      endPoint: 'api/auth/signin',
      body: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      NavigationServices(context).gotoTabScreen();
      notifyListeners();
      print("Success");
    }).catchError((e) {
      SnackBar snackBar =
          SnackBar(content: Text("Error Login Please Try again"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print("Error in Login");
      print(e.response!.statusCode);
      log(e.toString());
    });
  }

//http://localhost:8800/api/room/find/643af6e310a61c109435e8be
  RoomDetailsModel? roomDetails;
  void getRoomDetails({required String roomId}) async {
    dio.getData(endPoint: "api/room/find/$roomId").then((value) {
      roomDetails = RoomDetailsModel.fromJson(value.data);
      notifyListeners();
    }).catchError((e) {
      print("in Rooms Details Error is $e");
      notifyListeners();
    });
  }

// http://localhost:8800/api/user/addOrRemove/64515e360898d22121d8df73
  bool isFavorite = false;
  void addToFav({required String hotelID}) async {
    dio.putData(
        endPoint: "api/user/addOrRemove/64515e360898d22121d8df73",
        body: {"hotelId": hotelID}).then((value) {
      print("done Add To Favorite");
      notifyListeners();
      isFavorite = !isFavorite;
      print("is Fav $isFavorite");
    }).catchError((e) {
      notifyListeners();
      print("Error  Add To Favorite");
      print(e);
    });
  }

//http://localhost:5000/planner
  PlannerModelData? plannerModelData;
  void getPlannerFun({
    required String Budget,
    required String Season,
    required int Age_0,
    required int Age_20,
    required int Age_40,
    required int Age_60,
    required int Beach,
    required int Adventure,
    required int History,
    required int Culture,
    required int Nightlife,
    required int Shopping,
    required int Cuisine,
    required int Nature,
    required int Urban,
    required int Rural,
    required int Sea,
    required int Mountain,
    required int Lake,
    required int Desert,
    required int Plains,
    required int Jungle,
  }) async {
    dio.postDataWithoutUrl(endPoint: 'http://10.0.2.2:5000/planner', body: {
      "Budget": Budget,
      "Season": Season,
      "Age_0": Age_0,
      "Age_20": Age_20,
      "Age_40": Age_40,
      "Age_60": Age_60,
      "Beach": Beach,
      "Adventure": Adventure,
      "History": History,
      "Culture": Culture,
      "Nightlife": Nightlife,
      "Shopping": Shopping,
      "Cuisine": Cuisine,
      "Nature": Nature,
      "Urban": Urban,
      "Rural": Rural,
      "Sea": Sea,
      "Mountain": Mountain,
      "Lake": Lake,
      "Desert": Desert,
      "Plains": Plains,
      "Jungle": Jungle
    }).then((value) {
      plannerModelData = PlannerModelData.fromJson(value.data);
      log("********************** Success Get Planner **********************");
      print(value.data);

      notifyListeners();
      print("Planner Success");
    }).catchError((e) {
      log("Planner Error");
      print(e);
      notifyListeners();
    });
  }

//http://localhost:8800/api/reservation/make_reservation
  void addReservationList({required String roomId}) {
    dio.postData(
      endPoint: "api/reservation/make_reservation",
      body: {
        "rooms_id": [roomId],
        "check_in_out": {"in": "2023/04/01", "out": "2023/04/5"},
        "guests": {"adults": 3, "child": 9},
        "user_id": "6435dd6ae2fa466994279de1"
      },
    ).then((value) {
      print("Success  Add in ReservationList");
      notifyListeners();
    }).catchError((e) {
      print("Error Add  in ReservationList");
      notifyListeners();
    });
  }

// http://localhost:8800/api/reservation/my_reservation
  List<ResModel> reservationList = [];
  void getReservation() {
    dio.getData(
        endPoint: "api/reservation/my_reservation",
        body: {"user_id": "6435dd6ae2fa466994279de1"}).then(
      (value) {
        log("Success get in ReservationList");
        print(value);
        value.data.forEach((res) {
          reservationList.add(ResModel.fromJson(res));
        });
        notifyListeners();
      },
    ).catchError((e) {
      log("Error get  in ReservationList");
      print(e);
      notifyListeners();
    });
  }
SearchListModel? searchListModel;
//http://localhost:8800/
  
  void getSearchedList({
    required String city,
    required String startdate,
    required String endDate,
    required String roomsoption,
  }) {
    dio
        .getData(
            endPoint:
                'api/hotel?city=$city&startdate=$startdate&enddate=$endDate&min=50&max=9999&limit=20&roomsoption=$roomsoption')
        .then((value) {
          searchListModel = SearchListModel.fromJson(value.data);
      notifyListeners();
    }).catchError((e) {
      log('Error in Searched List $e');
      notifyListeners();
    });
  }















}
