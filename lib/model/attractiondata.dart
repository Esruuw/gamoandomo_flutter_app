class AttractionData {
  late List<Attraction> attractionList;
  late List<Attraction> restaurantList;

  AttractionData({required this.attractionList, required this.restaurantList});

  AttractionData.fromJson(Map<String, dynamic> json) {
    attractionList = [];
    if (json['attractionList'] != null) {
      json['attractionList'].forEach((v) {
        attractionList.add(Attraction.fromJson(v));
      });
    }
    restaurantList = [];
    if (json['restaurantList'] != null) {
      json['restaurantList'].forEach((v) {
        restaurantList.add(Attraction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attractionList'] =
        attractionList.map((v) => v.toJson()).toList();
    data['restaurantList'] =
        restaurantList.map((v) => v.toJson()).toList();
    return data;
  }
}

class NearbyData {
  late List<Attraction> attractionList;

  NearbyData({required this.attractionList});

  NearbyData.fromJson(Map<String, dynamic> json) {
    attractionList = [];
    if (json['attractionByProvince'] != null) {
      json['attractionByProvince'].forEach((v) {
        attractionList.add(Attraction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attractionByProvince'] =
        attractionList.map((v) => v.toJson()).toList();
    return data;
  }
}

class Attraction {
  String id, name, image, district;
  int province;
  List<String> description, img;
  double latitude;
  double longitude;

  Attraction(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      required this.latitude,
      required this.longitude,
      required this.img,
      required this.district,
      required this.province});

  Attraction.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        description = List<String>.from(json['description']),
        latitude = json['latitude'],
        longitude = json['longitude'],
        img = List<String>.from(json['img']),
        district = json['district'],
        province = json['province'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['img'] = img;
    data['district'] = district;
    data['province'] = province;
    return data;
  }
}
