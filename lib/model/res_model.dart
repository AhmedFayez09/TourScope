class ResModel {
	CheckInOut? checkInOut;
	Guests? guests;
	String? sId;
	HotelId? hotelId;
	List<String>? roomId;
	int? totalPrice;
	String? status;
	String? userId;
	int? iV;

	ResModel({this.checkInOut, this.guests, this.sId, this.hotelId, this.roomId, this.totalPrice, this.status, this.userId, this.iV});

	ResModel.fromJson(Map<String, dynamic> json) {
		checkInOut = json['check_in_out'] != null ?  CheckInOut.fromJson(json['check_in_out']) : null;
		guests = json['guests'] != null ?  Guests.fromJson(json['guests']) : null;
		sId = json['_id'];
		hotelId = json['hotel_id'] != null ?  HotelId.fromJson(json['hotel_id']) : null;
		roomId = json['room_id'].cast<String>();
		totalPrice = json['total_price'];
		status = json['status'];
		userId = json['user_id'];
		iV = json['__v'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data =  Map<String, dynamic>();
		if (checkInOut != null) {
      data['check_in_out'] = checkInOut!.toJson();
    }
		if (guests != null) {
      data['guests'] = guests!.toJson();
    }
		data['_id'] = sId;
		if (hotelId != null) {
      data['hotel_id'] = hotelId!.toJson();
    }
		data['room_id'] = roomId;
		data['total_price'] = totalPrice;
		data['status'] = status;
		data['user_id'] = userId;
		data['__v'] = iV;
		return data;
	}
}

class CheckInOut {
	String? inn;
	String? out;

	CheckInOut({this.inn, this.out});

	CheckInOut.fromJson(Map<String, dynamic> json) {
		inn = json['in'];
		out = json['out'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['in'] = inn;
		data['out'] = out;
		return data;
	}
}

class Guests {
	int? adults;
	int? child;

	Guests({this.adults, this.child});

	Guests.fromJson(Map<String, dynamic> json) {
		adults = json['adults'];
		child = json['child'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['adults'] = adults;
		data['child'] = child;
		return data;
	}
}

class HotelId {
	String? sId;
	String? name;
	List<String>? images;

	HotelId({this.sId, this.name, this.images});

	HotelId.fromJson(Map<String, dynamic> json) {
		sId = json['_id'];
		name = json['name'];
		images = json['images'].cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['_id'] = sId;
		data['name'] = name;
		data['images'] = images;
		return data;
	}
}
