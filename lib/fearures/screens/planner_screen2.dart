import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/fearures/screens/planer_screen1.dart';
import 'package:flutter_hotel_booking_ui/fearures/screens/planner_screen3.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';


List<int> lookingExperience = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
];



class PlannerScreen2 extends StatefulWidget {
  const PlannerScreen2({Key? key}) : super(key: key);

  @override
  State<PlannerScreen2> createState() => _PlannerScreen2State();
}

class _PlannerScreen2State extends State<PlannerScreen2> {
  List<bool> isActiveList = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      MaterialPageRoute(builder: (c) => PlannerScreen3()));
                },
                child: Text("Next"),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          Text(
            "What are you looking to experience ?",
            style: TextStyles(context).getRegularStyle().copyWith(
              color: AppTheme.backColor,
              fontSize: 25,
            ),
          ),
          SizedBox(height: 15),
          Expanded(
            child: GridView.builder(
              itemCount: PlannerModel.planners.length,
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 1.2,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 9.0,
                maxCrossAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    setState(() {
                      isActiveList[index] = !isActiveList[index];
                      if(lookingExperience[index] == 0){
                        lookingExperience[index] = 1;
                      }else{
                        lookingExperience[index] = 0;
                      }    print(lookingExperience);

                    });

                  },
                  child: PlannerItem(
                    isActive: isActiveList[index],
                    image: PlannerModel2.planners[index].image,
                    text: PlannerModel2.planners[index].text,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PlannerModel2 {
  String image;
  String text;

  PlannerModel2({required this.image, required this.text});
  static List<PlannerModel> planners = [
    PlannerModel(image: "assets/images/11.jpg", text: "Beach"),
    PlannerModel(image: "assets/images/22.jpeg", text: "Adventure"),
    PlannerModel(image: "assets/images/33.jpeg", text: "History"),
    PlannerModel(image: "assets/images/44.jpeg", text: "Culture"),
    PlannerModel(image: "assets/images/55.jpeg", text: "Nightlife"),
    PlannerModel(image: "assets/images/66.jpeg", text: "Shopping"),
    PlannerModel(image: "assets/images/77.jpeg", text: "Cuisine"),
    PlannerModel(image: "assets/images/88.jpeg", text: "Nature"),
  ];
}
