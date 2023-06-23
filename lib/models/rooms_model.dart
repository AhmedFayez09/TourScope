class RoomsModel {
  String? sId;
  String? name;
  var price;
  List<String>? images;
  var size;

  RoomsModel({this.sId, this.name, this.price, this.images, this.size});

  RoomsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    images = json['images'].cast<String>();
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['price'] = this.price;
    data['images'] = this.images;
    data['size'] = this.size;
    return data;
  }
}
