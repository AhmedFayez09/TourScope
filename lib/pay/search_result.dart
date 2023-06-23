import 'package:flutter/material.dart';
import 'package:flutter_hotel_booking_ui/model/search_list_model.dart';
import 'package:flutter_hotel_booking_ui/pay/rooms_screen.dart';
import 'package:flutter_hotel_booking_ui/providers/general_provider.dart';
import 'package:provider/provider.dart';

class SearchReslutScreen extends StatelessWidget {
  const SearchReslutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.read<GeneralProvider>();
    return Scaffold(
        appBar: AppBar(),
        body: Consumer<GeneralProvider>(
          builder: (context, value, child) {
            return provider.searchListModel == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: provider.searchListModel!.data!.length,
                    itemBuilder: (context, index) {
                      var item = provider.searchListModel!.data![index];
                      // List<Rooms>? rooms = item.rooms;
                      List<String>? feature = item.amenities;
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => RoomsScreen(
                                  rooms: item.rooms ?? [],
                                  images: item.images ?? [],
                                  feature: feature ?? [],
                                ),
                              ),
                            );
                          },
                          child: SearchedItem(item: item));
                    },
                  );
          },
        ));
  }
}

class SearchedItem extends StatelessWidget {
  SearchedItem({Key? key, required this.item}) : super(key: key);
  SearchListModelData item;
  @override
  Widget build(BuildContext context) {
     int splitIndex = item.amenities!.length ~/ 2;
    List<String> firstList = item.amenities!.sublist(0, splitIndex);

    List<String> secondList = item.amenities!.sublist(splitIndex);
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            Image.network(
              item.images![0] ??
                  "https://cf.bstatic.com/xdata/images/hotel/max1024x768/3491260.jpg?k=3cf17300eff06a8f9a36cbd0689cb7741d6400e2583d3f9af42739ad34e98d66&o=&hp=1",
              height: 150,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  item.name ?? '..',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Distance From City Center :  ${item.distanceFromCityCenter}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 15),
                Text(
                  'Price',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),

             Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border : Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child:   Text("${item.price.toString()} Egp")),
                SizedBox(height: 10),

                Text(
                  "Feature",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),


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
           

                // for (int i = 0; i < item.amenities!.length ; i++)
                //   Container(
                //     padding: EdgeInsets.all(5),
                //     margin: EdgeInsets.all(5),
                //     decoration: BoxDecoration(
                //       border : Border.all(color: Colors.white),
                //       borderRadius: BorderRadius.circular(10)
                //     ),
                //     child: Text(item.amenities![i])),
              ],
            )
          ],
        ),
      ),
    );
  }
}
