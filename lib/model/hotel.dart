import 'dart:ffi';

class Hotel {
  final String imagePath;
  final String titleTxt;
  final String dist;
  final double reviews;
  final double rating;
  final double perNight;
  final RoomData roomData;
  final bool isSelected;
  final DataText date;
  final LatLng location;

  Hotel({required this.imagePath, required this.titleTxt, required this.dist, required this.reviews, required this.rating, required this.perNight, required this.roomData, required this.isSelected, required this.date, required this.location});
  factory Hotel.fromJson(Map<String, dynamic> json) =>
      Hotel(
        imagePath: json['_id'],
        titleTxt: json['name'],
        dist: json['desc'],
        reviews: json['typeId'],
        rating: json['categoryId'],
        perNight: json['productUrl'],
        roomData: json['ratingsAverage'].toDouble(),
        isSelected: json['ratingsQuantity'],
        date: json['price'].toDouble(),
        location: json['createdAt'],
      );



}
class RoomData{
 final int x;
 final int y;

  RoomData(this.x, this.y);

}
class DataText{
  final int x;
  final int y;

  DataText(this.x, this.y);

}

class LatLng{
  final Double  x;
  final Double y;

  LatLng(this.x, this.y);

}
