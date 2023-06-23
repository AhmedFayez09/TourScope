import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/fearures/screens/planer_screen1.dart';
import 'package:flutter_hotel_booking_ui/fearures/widgets/booking_widget.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/models/hotel_list_data.dart';
import 'package:flutter_hotel_booking_ui/modules/explore/home_explore_slider_view.dart';
import 'package:flutter_hotel_booking_ui/modules/explore/hotel_list_view_page.dart';
import 'package:flutter_hotel_booking_ui/modules/explore/popular_list_view.dart';
import 'package:flutter_hotel_booking_ui/modules/explore/title_view.dart';
import 'package:flutter_hotel_booking_ui/pay/search_result.dart';
import 'package:flutter_hotel_booking_ui/providers/general_provider.dart';
import 'package:flutter_hotel_booking_ui/providers/theme_provider.dart';
import 'package:flutter_hotel_booking_ui/routes/route_names.dart';
import 'package:flutter_hotel_booking_ui/utils/cache.dart';
import 'package:flutter_hotel_booking_ui/utils/enum.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/widgets/bottom_top_move_animation_view.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_button.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_search_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class HomeExploreScreen extends StatefulWidget {
  final AnimationController animationController;

  const HomeExploreScreen({Key? key, required this.animationController})
      : super(key: key);
  @override
  _HomeExploreScreenState createState() => _HomeExploreScreenState();
}

class _HomeExploreScreenState extends State<HomeExploreScreen>
    with TickerProviderStateMixin {
  var hotelList = HotelListData.hotelList;
  late ScrollController controller;
  late AnimationController _animationController;
  var sliderImageHieght = 0.0;
  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 0), vsync: this);
    widget.animationController.forward();
    controller = ScrollController(initialScrollOffset: 0.0);
    controller
      ..addListener(() {
        if (mounted) {
          if (controller.offset < 0) {
            // we static set the just below half scrolling values
            _animationController.animateTo(0.0);
          } else if (controller.offset > 0.0 &&
              controller.offset < sliderImageHieght) {
            // we need around half scrolling values
            if (controller.offset < ((sliderImageHieght / 1.5))) {
              _animationController
                  .animateTo((controller.offset / sliderImageHieght));
            } else {
              // we static set the just above half scrolling values "around == 0.64"
              _animationController
                  .animateTo((sliderImageHieght / 1.5) / sliderImageHieght);
            }
          }
        }
      });
    super.initState();
  }

  var searchedController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    sliderImageHieght = MediaQuery.of(context).size.width * 1.3;
    return BottomTopMoveAnimationView(
      animationController: widget.animationController,
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) => Stack(
          children: <Widget>[
            Container(
              color: AppTheme.scaffoldBackgroundColor,
              child: ListView.builder(
                controller: controller,
                itemCount: 4,
                // padding on top is only for we need spec for sider
                padding:
                    EdgeInsets.only(top: sliderImageHieght + 32, bottom: 16),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var listHotel =
                      context.watch<GeneralProvider>().listHotelModel;
                  // some list UI
                  var count = 4;
                  var animation = Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: widget.animationController,
                      curve: Interval((1 / count) * index, 1.0,
                          curve: Curves.fastOutSlowIn),
                    ),
                  );
                  if (index == 0) {
                    return TitleView(
                      titleTxt:
                          AppLocalizations(context).of("popular_destination"),
                      subTxt: '',
                      animation: animation,
                      animationController: widget.animationController,
                      click: () {},
                    );
                  } else if (index == 1) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      //Popular Destinations animation view
                      child: PopularListView(
                        animationController: widget.animationController,
                        callBack: (index) {},
                      ),
                    );
                  } else if (index == 2) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.black12,
                          child: Column(
                            children: [
                              BookingWidget(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  controller: searchedController,
                                  decoration: const InputDecoration(
                                    hintText: "Where are you going",
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  context
                                      .read<GeneralProvider>()
                                      .getSearchedList(
                                        city: searchedController.text,
                                        startdate: CacheHelper.getData(
                                                key: MyCacheMy.startDate)
                                            .toString(),
                                        endDate: CacheHelper.getData(
                                                key: MyCacheMy.endDate)
                                            .toString(),
                                        roomsoption: CacheHelper.getData(
                                                key: MyCacheMy.room)
                                            .toString(),
                                      );

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) =>
                                              SearchReslutScreen()));
                                },
                                child: Text("Search"),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   width: 100,
                        //   height: 100,
                        //   color: Colors.amber,
                        // ),
                        // SizedBox(height: 10),
                        // Container(
                        //   width: 100,
                        //   height: 100,
                        //   color: Colors.amber,
                        // ),
                        // SizedBox(height: 10),
                        // Container(
                        //   width: 100,
                        //   height: 100,
                        //   color: Colors.amber,
                        // ),
                        // SizedBox(height: 10),
                      ],
                    );
                  } else {
                    // return getDealListView(index);
                  }
                },
              ),
            ),
            // sliderUI with 3 images are moving
            _sliderUI(),

            // viewHotels Button UI for click event
            _viewHotelsButton(_animationController),

            //just gradient for see the time and battry Icon on "TopBar"
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Theme.of(context).backgroundColor.withOpacity(0.4),
                    Theme.of(context).backgroundColor.withOpacity(0.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
              ),
            ),
            //   serachUI on Top  Positioned
            // Positioned(
            //   top: MediaQuery.of(context).padding.top,
            //   left: 0,
            //   right: 0,
            //   // child: serachUI(),
            // )
          ],
        ),
      ),
    );
  }

  Widget _viewHotelsButton(AnimationController _animationController) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        var opecity = 1.0 -
            (_animationController.value > 0.64
                ? 1.0
                : _animationController.value);
        return Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: sliderImageHieght * (1.0 - _animationController.value),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 32,
                left: context.read<ThemeProvider>().languageType ==
                        LanguageType.ar
                    ? null
                    : 24,
                right: context.read<ThemeProvider>().languageType ==
                        LanguageType.ar
                    ? 24
                    : null,
                child: Opacity(
                  opacity: opecity,
                  child: Row(
                    children: [
                      CommonButton(
                        onTap: () {
                          if (opecity != 0) {
                            NavigationServices(context).gotoHotelHomeScreen();
                          }
                        },
                        buttonTextWidget: Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 8, bottom: 8),
                          child: Text(
                            AppLocalizations(context).of("view_hotel"),
                            style: TextStyles(context)
                                .getRegularStyle()
                                .copyWith(color: AppTheme.whiteColor),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      CommonButton(
                        onTap: () {
                          if (opecity != 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => PlannerScreen1()));
                            // NavigationServices(context).gotoHotelHomeScreen();
                          }
                        },
                        buttonTextWidget: Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 8, bottom: 8),
                          child: Text(
                            "Planer",
                            // AppLocalizations(context).of("Planer"),
                            style: TextStyles(context)
                                .getRegularStyle()
                                .copyWith(color: AppTheme.whiteColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _sliderUI() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          // we calculate the opecity between 0.64 to 1.0
          var opecity = 1.0 -
              (_animationController.value > 0.64
                  ? 1.0
                  : _animationController.value);
          return SizedBox(
            height: sliderImageHieght * (1.0 - _animationController.value),
            child: HomeExploreSliderView(
              opValue: opecity,
              click: () {},
            ),
          );
        },
      ),
    );
  }

  Widget getDealListView(int index) {
    // var hotelList = HotelListData.hotelList;
    var listHotel = context.watch<GeneralProvider>().listHotelModel;
    List<Widget> list = [];
    listHotel != null
        ? listHotel.forEach((f) {
            var animation = Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: widget.animationController,
                curve: const Interval(0, 1.0, curve: Curves.fastOutSlowIn),
              ),
            );
            list.add(
              HotelListViewPage(
                callback: () {
                  context
                      .read<GeneralProvider>()
                      .getRooms(id: listHotel[index].sId!);
                  NavigationServices(context).gotoHotelDetailes(f);
                },
                hotelData: f,
                animation: animation,
                animationController: widget.animationController,
              ),
            );
          })
        : Center(
            child: CircularProgressIndicator(),
          );
    return listHotel != null
        ? Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              children: list,
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget serachUI() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
      child: CommonCard(
        radius: 36,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(38)),
          onTap: () {
            NavigationServices(context).gotoSearchScreen();
          },
          child: CommonSearchBar(
            iconData: FontAwesomeIcons.search,
            enabled: false,
            text: AppLocalizations(context).of("where_are_you_going"),
          ),
        ),
      ),
    );
  }
}
