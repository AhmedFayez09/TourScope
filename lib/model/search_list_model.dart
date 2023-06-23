class SearchListModel {
  List<SearchListModelData>? data;

  SearchListModel({this.data});

  SearchListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SearchListModelData>[];
      json['data'].forEach((v) {
        data!.add(new SearchListModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchListModelData {
  String? sId;
  String? name;
  String? city;
  int? price;
  var rating;
  List<String>? images;
  List<String>? amenities;
  var distanceFromCityCenter;
  List<Rooms>? rooms;

  SearchListModelData(
      {this.sId,
      this.name,
      this.city,
      this.price,
      this.rating,
      this.images,
      this.amenities,
      this.distanceFromCityCenter,
      this.rooms});

  SearchListModelData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    city = json['city'];
    price = json['price'];
    rating = json['rating'];
    images = json['images'].cast<String>();
    amenities = json['amenities'].cast<String>();
    distanceFromCityCenter = json['distanceFromCityCenter'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['city'] = this.city;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['images'] = this.images;
    data['amenities'] = this.amenities;
    data['distanceFromCityCenter'] = this.distanceFromCityCenter;
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  List<RoomAvailability>? roomAvailability;
  String? sId;
  int? price;
  int? maxpeople;

  Rooms({this.roomAvailability, this.sId, this.price, this.maxpeople});

  Rooms.fromJson(Map<String, dynamic> json) {
    if (json['room_availability'] != null) {
      roomAvailability = <RoomAvailability>[];
      json['room_availability'].forEach((v) {
        roomAvailability!.add(new RoomAvailability.fromJson(v));
      });
    }
    sId = json['_id'];
    price = json['price'];
    maxpeople = json['maxpeople'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.roomAvailability != null) {
      data['room_availability'] =
          this.roomAvailability!.map((v) => v.toJson()).toList();
    }
    data['_id'] = this.sId;
    data['price'] = this.price;
    data['maxpeople'] = this.maxpeople;
    return data;
  }
}

class RoomAvailability {
  String? number;
  String? unavailableDates;

  RoomAvailability({this.number, this.unavailableDates});

  RoomAvailability.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    unavailableDates = json['unavailableDates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['unavailableDates'] = this.unavailableDates;
    return data;
  }
}
