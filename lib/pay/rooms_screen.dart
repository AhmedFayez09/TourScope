import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/fearures/screens/rooms_details.dart';
import 'package:flutter_hotel_booking_ui/model/search_list_model.dart';
import 'package:flutter_hotel_booking_ui/pay/room_details.dart';

class RoomsScreen extends StatelessWidget {
  RoomsScreen({
    Key? key,
    required this.rooms,
    required this.images,
    required this.feature,
  }) : super(key: key);
  List<Rooms> rooms;
  List<String> images;
  List<String> feature;

  @override
  Widget build(BuildContext context) {
    print(images.length);
    return Scaffold(
      appBar: AppBar(
        title: Text("Rooms"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(height: 50),
            Image.network(images.first),
            SizedBox(height: 50),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: images.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // var room = rooms[index];
                  var image = images[index];
                  var room = rooms[index].roomAvailability![index];
               
                  return Stack(
                    children: [
                      Image.network(
                        image ??
                            "https://cf.bstatic.com/xdata/images/hotel/max1024x768/3491260.jpg?k=3cf17300eff06a8f9a36cbd0689cb7741d6400e2583d3f9af42739ad34e98d66&o=&hp=1",
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => RoomSearchDetails(
                                  feature: feature,
                                  image: image,
                                  price: room.number,
                                ),
                              ));
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(5),
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Text(room.unavailableDates.toString()),
                              Text(room.number.toString()),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            // SizedBox(
            //   height: 80,
            //   child: ListView.builder(
            //     itemCount: rooms.length,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) {
            //       // var room = rooms[index];
            //       var room = rooms[index].roomAvailability![index];
            //       return Container(
            //         padding: EdgeInsets.all(5),
            //         margin: EdgeInsets.all(5),
            //         decoration: BoxDecoration(
            //             border: Border.all(color: Colors.white),
            //             borderRadius: BorderRadius.circular(10)),
            //         child: Column(
            //           children: [
            //             Text(room.unavailableDates.toString()),
            //             Text(room.number.toString()),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
