import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';
import 'package:flutter_hotel_booking_ui/models/room_details_model.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_detailes/rating_view.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_detailes/review_data_view.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_detailes/room_booking_screen.dart';
import 'package:flutter_hotel_booking_ui/providers/general_provider.dart';
import 'package:flutter_hotel_booking_ui/routes/route_names.dart';
import 'package:flutter_hotel_booking_ui/utils/localfiles.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RoomDetails extends StatefulWidget {
  RoomDetails({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  State<RoomDetails> createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  var pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    RoomDetailsModel? model = context.watch<GeneralProvider>().roomDetails;
    return Scaffold(
      body: Column(
        children: [
          getAppBarUI(
            title: widget.title,
          ),
          model != null
              ? Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        AspectRatio(
                          aspectRatio: 1.5,
                          child: PageView(
                            controller: pageController,
                            pageSnapping: true,
                            scrollDirection: Axis.horizontal,
                            children: [
                              for (var image in model.images!)
                                Image.network(
                                  image,
                                  fit: BoxFit.cover,
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SmoothPageIndicator(
                            controller: pageController,
                            count: 3,
                            effect: WormEffect(
                                activeDotColor: Theme.of(context).primaryColor,
                                dotColor: Theme.of(context).backgroundColor,
                                dotHeight: 10.0,
                                dotWidth: 10.0,
                                spacing: 5.0),
                            onDotClicked: (index) {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 200),
                    Center(
                      child: Container(
                        color: Colors.grey,
                        child: Column(
                          children: [
                            Text(
                              "Name: ${model.name!}",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              "Price ${model.price.toString()}",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              "Size ${model.size.toString()}",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              "Hotel Name ${model.hotelName!}",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : CircularProgressIndicator()
        ],
      ),
    );
  }
}
