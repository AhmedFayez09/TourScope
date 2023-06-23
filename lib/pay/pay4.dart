import 'package:flutter/material.dart';

class Pay4 extends StatelessWidget {
   Pay4({Key? key,required this.image}) : super(key: key);
String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              
        
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Image.network(image,
                // "https://cf.bstatic.com/xdata/images/hotel/max1024x768/3491260.jpg?k=3cf17300eff06a8f9a36cbd0689cb7741d6400e2583d3f9af42739ad34e98d66&o=&hp=1",
              ),
              SizedBox(height: 20),
              Text(
                'Booling Details',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
        
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Check in '),
                      Text('Wed, May 17'),
                      Text('2023'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Check Out'),
                      Text('Wed, May 17'),
                      Text('2023'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Status'),
                      Text('Pending'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
        
              Text(
                'Payment Details',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
        
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Check in '),
                      Text('Wed, May 17'),
                      Text('2023'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Check Out'),
                      Text('Wed, May 17'),
                      Text('2023'),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Status'),
                      Text('Pending'),
                    ],
                  ),
                ],
              ),
           
                  ],
                ),
              )
           
           
            ],
          ),
        ),
      ),
    );
  }
}
