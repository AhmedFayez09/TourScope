import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_hotel_booking_ui/fearures/screens/hotels_planners.dart';
import 'package:flutter_hotel_booking_ui/fearures/screens/planer_screen1.dart';
import 'package:flutter_hotel_booking_ui/fearures/screens/planner_screen2.dart';
import 'package:flutter_hotel_booking_ui/providers/general_provider.dart';
import 'package:provider/provider.dart';

class PlannerScreen3 extends StatefulWidget {
  PlannerScreen3({Key? key}) : super(key: key);

  @override
  State<PlannerScreen3> createState() => _PlannerScreen3State();
}

class _PlannerScreen3State extends State<PlannerScreen3> {
  var choessenSeason = '';
  String Budget = '';

  List<String> list1 = [
    "Summer",
    "Spring",
    "Autumn",
    "Winter",
  ];
  List<String> list2 = [
    "6-19",
    "20-39",
    "40-59",
    "60+",
  ];
  List<String> list3 = [
    "0-49",
    "50-99",
    "100-299",
    "300+",
  ];
  List<int> ages = [0, 0, 0, 0];
  List<bool> listQ1 = [
    true,
    true,
    true,
    true,
  ];
  List<bool> listQ2 = [
    true,
    true,
    true,
    true,
  ];
  List<bool> listQ3 = [
    true,
    true,
    true,
    true,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Previous"),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => const HotelsPlanner()));

                  Provider.of<GeneralProvider>(context,listen: false).getPlannerFun(
                    Budget: Budget,
                    Season: choessenSeason,
                    Age_0: ages[0],
                    Age_20: ages[1],
                    Age_40: ages[2],
                    Age_60: ages[3],
                    Beach: lookingExperience[0],
                    Adventure: lookingExperience[1],
                    History: lookingExperience[2],
                    Culture: lookingExperience[3],
                    Nightlife: lookingExperience[4],
                    Shopping: lookingExperience[5],
                    Cuisine: lookingExperience[6],
                    Nature: lookingExperience[7],
                    Urban: secenery[0],
                    Rural: secenery[1],
                    Sea: secenery[2],
                    Mountain: secenery[3],
                    Lake: secenery[4],
                    Desert: secenery[5],
                    Plains: secenery[6],
                    Jungle: secenery[7],
                  );
                },
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text(
                "What season are you planning to travel ?",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                    const SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: list1.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            listQ1[index] = !listQ1[index];
                            choessenSeason = list1[index];
                            print(choessenSeason);
                          });
                        },
                        child: planner3Item(
                          isActive: listQ1[index],
                          text: list1[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "What is the age range of your group",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: list2.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            listQ2[index] = !listQ2[index];
                            if (ages[index] == 0) {
                              ages[index] = 1;
                            } else {
                              ages[index] = 0;
                            }

                            print(ages);

                          });
                          print(listQ2[index]);
                        },
                        child: planner3Item(
                          isActive: listQ2[index],
                          text: list2[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "What's your budget (per day):",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: list3.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            listQ3[index] = !listQ3[index];
                            Budget = list3[index];
                          });
                        },
                        child: planner3Item(
                          isActive: listQ3[index],
                          text: list3[index],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class planner3Item extends StatelessWidget {
  planner3Item({Key? key, required this.text, required this.isActive})
      : super(key: key);
  String text;
  bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isActive == true
              ? Colors.transparent
              : Color.fromARGB(255, 33, 61, 243),
          border: Border.all(
            color: Color.fromARGB(255, 33, 61, 243),
          )),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}