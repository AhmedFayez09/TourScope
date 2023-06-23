class RoomDetailsModel {
  String? sId;
  String? name;
  int? price;
  int? maxpeople;
  List<String>? facilities;
  List<String>? images;
  String? description;
  int? size;
  List<String>? beds;
  String? hotelName;
  String? vitrualTour;
  List<dynamic>? unavialableDates;
  String? hotelId;

  RoomDetailsModel(
      {this.sId,
      this.name,
      this.price,
      this.maxpeople,
      this.facilities,
      this.images,
      this.description,
      this.size,
      this.beds,
      this.hotelName,
      this.vitrualTour,
      this.unavialableDates,
      this.hotelId});

  RoomDetailsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    maxpeople = json['maxpeople'];
    facilities = json['facilities'].cast<String>();
    images = json['images'].cast<String>();
    description = json['description'];
    size = json['size'];
    beds = json['beds'].cast<String>();
    hotelName = json['hotel_name'];
    vitrualTour = json['vitrual_tour'];
    if (json['unavialable_dates'] != null) {
      unavialableDates = <Null>[];
      json['unavialable_dates'].forEach((v) {
        unavialableDates!.add( v);
      });
    }
    hotelId = json['hotel_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['_id'] = sId;
    data['name'] = name;
    data['price'] = price;
    data['maxpeople'] = maxpeople;
    data['facilities'] = facilities;
    data['images'] = images;
    data['description'] = description;
    data['size'] = size;
    data['beds'] = beds;
    data['hotel_name'] = hotelName;
    data['vitrual_tour'] = vitrualTour;
    if (unavialableDates != null) {
      data['unavialable_dates'] =
          unavialableDates!.map((v) => v.toJson()).toList();
    }
    data['hotel_id'] = hotelId;
    return data;
  }
}
