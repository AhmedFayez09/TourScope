import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/model/planner_model.dart';
import 'package:flutter_hotel_booking_ui/pay/search_result.dart';
import 'package:flutter_hotel_booking_ui/providers/general_provider.dart';
import 'package:flutter_hotel_booking_ui/utils/cache.dart';
import 'package:provider/provider.dart';

class HotelsPlanner extends StatelessWidget {
  const HotelsPlanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlannerModelData? planner =
        Provider.of<GeneralProvider>(context).plannerModelData;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Expanded(
            child: planner != null
                ? ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemCount: planner.cities!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context
                                      .read<GeneralProvider>()
                                      .getSearchedList(
                                        city: planner.cities![index].city!,
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
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.grey,
                          child: Column(
                            children: [
                              Image.network(planner.cities![index].photo!),
                              Text(planner.cities![index].city!),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
