import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/language/appLocalizations.dart';
import 'package:flutter_hotel_booking_ui/models/room_data.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_booking/components/calendar_pop_up_view.dart';
import 'package:flutter_hotel_booking_ui/modules/hotel_booking/components/room_pop_up_view.dart';
import 'package:flutter_hotel_booking_ui/motel_app.dart';
import 'package:flutter_hotel_booking_ui/providers/theme_provider.dart';
import 'package:flutter_hotel_booking_ui/utils/cache.dart';
import 'package:flutter_hotel_booking_ui/utils/enum.dart';
import 'package:flutter_hotel_booking_ui/utils/helper.dart';
import 'package:flutter_hotel_booking_ui/utils/text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookingWidget extends StatefulWidget {
  @override
  _BookingWidgetState createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget> {
  RoomData _roomData = RoomData(1, 2);
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  // String startDateString = '';
  // String endDateString = '';
  final LanguageType _languageType = applicationcontext == null
      ? LanguageType.en
      : applicationcontext!.read<ThemeProvider>().languageType;
  @override
  Widget build(BuildContext context) {
    String start = DateFormat('yyyy-M-d').format(startDate);
    String end = DateFormat('yyyy-M-d').format(endDate);
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getDateRoomUi(
              title: AppLocalizations(context).of("choose_date"),
              subtitle:
                  "${DateFormat("dd, MMMM", _languageType.toString().split(".")[1]).format(startDate)} - ${DateFormat("dd, MMMM", _languageType.toString().split(".")[1]).format(endDate)}",
              onTap: () {
                showDialog(
                  context: context,
                  //custome calendar view
                  builder: (BuildContext context) => CalendarPopupView(
                    barrierDismissible: true,
                    minimumDate: DateTime.now(),
                    maximumDate: DateTime(DateTime.now().year,
                        DateTime.now().month, DateTime.now().day + 10),
                    initialEndDate: endDate,
                    initialStartDate: startDate,
                    onApplyClick:
                        (DateTime pressStartData, DateTime pressEndData) {
                      setState(() {
                        startDate = pressStartData;
                        endDate = pressEndData;
                      });
                      CacheHelper.saveData(
                          key: MyCacheMy.startDate, value: start);
                      CacheHelper.saveData(key: MyCacheMy.endDate, value: end);
                    },
                    onCancelClick: () {},
                  ),
                );
              }),
          // Divider
          Container(
            width: 1,
            height: 42,
            color: Colors.grey.withOpacity(0.8),
          ),

          ///
          _getDateRoomUi(
              title: AppLocalizations(context).of("number_room"),
              subtitle: Helper.getRoomText(_roomData),
              onTap: () {
                _showPopUp();
              }),
        ],
      ),
    );
  }

  Widget _getDateRoomUi(
      {required String title,
      required String subtitle,
      required VoidCallback onTap}) {
    return Expanded(
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              onTap: onTap,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 4, left: 8, right: 8, bottom: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyles(context)
                          .getDescriptionStyle()
                          .copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      // "${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}",
                      style: TextStyles(context).getRegularStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPopUp() {
    showDialog(
      context: context,
      builder: (BuildContext context) => RoomPopupView(
        roomData: _roomData,
        barrierDismissible: true,
        onChnage: (data) {
          setState(() {
            _roomData = data;
            CacheHelper.saveData(key:MyCacheMy.room ,value:data.numberRoom ,);
           
          });
        },
      ),
    );
  }
}
