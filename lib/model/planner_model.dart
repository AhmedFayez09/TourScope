class PlannerModelData {
  List<Cities>? cities;

  PlannerModelData({this.cities});

  PlannerModelData.fromJson(Map<String, dynamic> json) {
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  String? city;
  String? photo;

  Cities({this.city, this.photo});

  Cities.fromJson(Map<String, dynamic> json) {
    city = json['City'];
    photo = json['Photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['City'] = this.city;
    data['Photo'] = this.photo;
    return data;
  }
}
