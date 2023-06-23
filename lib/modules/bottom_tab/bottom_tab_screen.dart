import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/fearures/screens/reservation_screen.dart';
import 'package:flutter_hotel_booking_ui/map/view.dart';
import 'package:flutter_hotel_booking_ui/modules/explore/home_explore_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/myTrips/my_trips_screen.dart';
import 'package:flutter_hotel_booking_ui/modules/profile/profile_screen.dart';
import 'package:flutter_hotel_booking_ui/providers/general_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_hotel_booking_ui/utils/themes.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/providers/theme_provider.dart';
import 'package:flutter_hotel_booking_ui/modules/bottom_tab/components/tab_button_UI.dart';
import 'package:flutter_hotel_booking_ui/widgets/common_card.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class BottomTabScreen extends StatefulWidget {
  @override
  _BottomTabScreenState createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isFirstTime = true;
  Widget _indexView = Container();
  BottomBarType bottomBarType = BottomBarType.Home;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 400), vsync: this);
    _indexView = Container();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _startLoadScreen());
    super.initState();
  }

  Future _startLoadScreen() async {
    await Future.delayed(const Duration(milliseconds: 480));
    setState(() {
      _isFirstTime = false;
      _indexView = HomeExploreScreen(
        animationController: _animationController,
      );
    });
    _animationController..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_, provider, child) => Container(
        child: Scaffold(
          bottomNavigationBar: Container(
              height: 60 + MediaQuery.of(context).padding.bottom,
              child: getBottomBarUI(bottomBarType)),
          body: _isFirstTime
              ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
              : _indexView,
        ),
      ),
    );
  }

  void tabClick(BottomBarType tabType) {
    if (tabType != bottomBarType) {
      bottomBarType = tabType;
      _animationController.reverse().then((f) {
        if (tabType == BottomBarType.Home) {
          setState(() {
            _indexView = HomeExploreScreen(
              animationController: _animationController,
            );
          });
        } else if (tabType == BottomBarType.Trips) {
          setState(() {
            _indexView = MyTripsScreen(
              animationController: _animationController,
            );
          });
        } else if (tabType == BottomBarType.Reservation) {
          setState(() {
            _indexView = ReservationScreen();
            // context.read<GeneralProvider>().getReservation();
          });
        } else if (tabType == BottomBarType.Profile) {
          setState(() {
            _indexView = ProfileScreen(
              animationController: _animationController,
            );
          });
        } else if (tabType == BottomBarType.Map) {
          setState(() {
            _indexView = MyMap();
          });
        }
      });
    }
  }

  Widget getBottomBarUI(BottomBarType tabType) {
    return CommonCard(
      color: AppTheme.backgroundColor,
      radius: 0,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              TabButtonUI(
                icon: FontAwesomeIcons.heart,
                isSelected: tabType == BottomBarType.Trips,
                text: AppLocalizations(context).of("trips"),
                onTap: () {
                  tabClick(BottomBarType.Trips);
                },
              ),
              TabButtonUI(
                icon: FontAwesomeIcons.map,
                isSelected: tabType == BottomBarType.Map,
                text: "Map",
                onTap: () => tabClick(BottomBarType.Map),
              ),
              TabButtonUI(
                icon: Icons.home,
                isSelected: tabType == BottomBarType.Home,
                text: "Home",
                onTap: () {
                  tabClick(BottomBarType.Home);
                },
              ),
              TabButtonUI(
                icon: FontAwesomeIcons.save,
                isSelected: tabType == BottomBarType.Reservation,
                text: "Reservation",
                onTap: () {
                  tabClick(BottomBarType.Reservation);
                },
              ),
              TabButtonUI(
                icon: FontAwesomeIcons.user,
                isSelected: tabType == BottomBarType.Profile,
                text: AppLocalizations(context).of("profile"),
                onTap: () {
                  tabClick(BottomBarType.Profile);
                },
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}

enum BottomBarType { Home, Trips, Map, Profile, Reservation }
