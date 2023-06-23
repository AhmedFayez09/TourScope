import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_hotel_booking_ui/fearures/screens/planner_screen2.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';

List<int> secenery = [
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
class PlannerScreen1 extends StatefulWidget {
  PlannerScreen1({Key? key}) : super(key: key);

  @override
  State<PlannerScreen1> createState() => _PlannerScreen1State();
}

class _PlannerScreen1State extends State<PlannerScreen1> {
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
                      MaterialPageRoute(builder: (c) => PlannerScreen2()));
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
            "What scenery are you seeking?",
            style: TextStyles(context)
                .getRegularStyle()
                .copyWith(color: AppTheme.backColor, fontSize: 25),
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
                      if(secenery[index] == 0){
                        secenery[index] = 1;
                      }else{
                        secenery[index] = 0;
                      }
                    });

                  },
                  child: PlannerItem(
                    isActive: isActiveList[index],
                    image: PlannerModel.planners[index].image,
                    text: PlannerModel.planners[index].text,
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

class PlannerItem extends StatelessWidget {
  PlannerItem(
      {Key? key,
        required this.image,
        required this.text,
        required this.isActive})
      : super(key: key);
  String image;
  String text;
  bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              )),
          Text(
            text,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          isActive == false
              ? Positioned(
            bottom: 15,
            child: Icon(
              Icons.check_circle_outline_outlined,
              size: 54,
            ),
          )
              : SizedBox.shrink()
        ],
      ),
    );
  }
}

class PlannerModel {
  String image;
  String text;

  PlannerModel({required this.image, required this.text});
  static List<PlannerModel> planners = [
    PlannerModel(image: "assets/images/1.jpg", text: "Urban"),
    PlannerModel(image: "assets/images/2.jpg", text: "Rural"),
    PlannerModel(image: "assets/images/3.jpg", text: "Sea"),
    PlannerModel(image: "assets/images/4.jpg", text: "Mountain"),
    PlannerModel(image: "assets/images/5.jpg", text: "Lake"),
    PlannerModel(image: "assets/images/6.jpg", text: "Desert"),
    PlannerModel(image: "assets/images/7.jpg", text: "Plains"),
    PlannerModel(image: "assets/images/8.jpeg", text: "Jungle"),
  ];
}

