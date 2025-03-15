class PlaceLocationModel {
  int? placeId;
  String? licence;
  String? osmType;
  int? osmId;
  String? lat;
  String? lon;
  String? classType;
  String? type;
  int? placeRank;
  double? importance;
  String? addresstype;
  String? name;
  String? displayName;
  Address? address;
  List<String>? boundingbox;

  PlaceLocationModel(
      {this.placeId,
      this.licence,
      this.osmType,
      this.osmId,
      this.lat,
      this.lon,
      this.classType,
      this.type,
      this.placeRank,
      this.importance,
      this.addresstype,
      this.name,
      this.displayName,
      this.address,
      this.boundingbox});

  PlaceLocationModel.fromJson(Map<String, dynamic> json) {
    placeId = json['place_id'];
    licence = json['licence'];
    osmType = json['osm_type'];
    osmId = json['osm_id'];
    lat = json['lat'];
    lon = json['lon'];
    classType = json['class'];
    type = json['type'];
    placeRank = json['place_rank'];
    importance = json['importance'];
    addresstype = json['addresstype'];
    name = json['name'];
    displayName = json['display_name'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    boundingbox = json['boundingbox'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['place_id'] = placeId;
    data['licence'] = licence;
    data['osm_type'] = osmType;
    data['osm_id'] = osmId;
    data['lat'] = lat;
    data['lon'] = lon;
    data['class'] = classType;
    data['type'] = type;
    data['place_rank'] = placeRank;
    data['importance'] = importance;
    data['addresstype'] = addresstype;
    data['name'] = name;
    data['display_name'] = displayName;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['boundingbox'] = boundingbox;
    return data;
  }
}

class Address {
  String? city;
  String? subdistrict;
  String? district;
  String? state;
  String? iSO31662Lvl4;
  String? country;
  String? countryCode;

  Address(
      {this.city,
      this.subdistrict,
      this.district,
      this.state,
      this.iSO31662Lvl4,
      this.country,
      this.countryCode});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    subdistrict = json['subdistrict'];
    district = json['district'];
    state = json['state'];
    iSO31662Lvl4 = json['ISO3166-2-lvl4'];
    country = json['country'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['city'] = city;
    data['subdistrict'] = subdistrict;
    data['district'] = district;
    data['state'] = state;
    data['ISO3166-2-lvl4'] = iSO31662Lvl4;
    data['country'] = country;
    data['country_code'] = countryCode;
    return data;
  }
}
