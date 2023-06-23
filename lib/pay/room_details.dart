import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_hotel_booking_ui/pay/pay1.dart';

class RoomSearchDetails extends StatelessWidget {
  RoomSearchDetails({
    Key? key,
    required this.image,
    required this.feature,
    required this.price,
  }) : super(key: key);
  String image;
  List<String> feature;
  var price;
  @override
  Widget build(BuildContext context) {
    int splitIndex = feature.length ~/ 2;
    List<String> firstList = feature.sublist(0, splitIndex);

    List<String> secondList = feature.sublist(splitIndex);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(image),
            SizedBox(height: 15),
            Text(
              'Price',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: Text("$price Egp / Per Night")),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    for (int i = 0; i < firstList.length; i++)
                      Container(
                          width: 150,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(firstList[i])),
                  ],
                ),
                Column(
                  children: [
                    for (int i = 0; i < secondList.length; i++)
                      Container(
                          width: 150,
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(secondList[i])),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => Pay1(
                                total: price,
                                image: image,
                              )));
                },
                child: Text('Book Now'))
          ],
        ),
      ),
    );
  }
}
