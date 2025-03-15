class PlaceSuggestionModel {
  List<Features>? features;
  String? type;

  PlaceSuggestionModel({this.features, this.type});

  factory PlaceSuggestionModel.fromJson(Map<String, dynamic> json) {
    return PlaceSuggestionModel(
      features: json['features'] != null
          ? (json['features'] as List).map((v) => Features.fromJson(v)).toList()
          : null,
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (features != null) {
      data['features'] = features!.map((v) => v.toJson()).toList();
    }
    data['type'] = type;
    return data;
  }
}

class Features {
  Geometry? geometry;
  String? type;
  Properties? properties;

  Features({this.geometry, this.type, this.properties});

  factory Features.fromJson(Map<String, dynamic> json) {
    return Features(
      geometry: json['geometry'] != null
          ? Geometry.fromJson(json['geometry'])
          : null,
      type: json['type'],
      properties: json['properties'] != null
          ? Properties.fromJson(json['properties'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (geometry != null) {
      data['geometry'] = geometry!.toJson();
    }
    data['type'] = type;
    if (properties != null) {
      data['properties'] = properties!.toJson();
    }
    return data;
  }
}

class Geometry {
  List<double>? coordinates;
  String? type;

  Geometry({this.coordinates, this.type});

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      coordinates: (json['coordinates'] as List).cast<double>(),
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['coordinates'] = coordinates;
    data['type'] = type;
    return data;
  }
}

class Properties {
  String? osmType;
  int? osmId;
  List<double>? extent;
  String? country;
  String? osmKey;
  String? city;
  String? countrycode;
  String? osmValue;
  String? name;
  String? county;
  String? state;
  String? type;

  Properties({
    this.osmType,
    this.osmId,
    this.extent,
    this.country,
    this.osmKey,
    this.city,
    this.countrycode,
    this.osmValue,
    this.name,
    this.county,
    this.state,
    this.type,
  });

  factory Properties.fromJson(Map<String, dynamic> json) {
    return Properties(
      osmType: json['osm_type'],
      osmId: json['osm_id'],
      extent: (json['extent'] as List?)?.cast<double>(),
      country: json['country'],
      osmKey: json['osm_key'],
      city: json['city'],
      countrycode: json['countrycode'],
      osmValue: json['osm_value'],
      name: json['name'],
      county: json['county'],
      state: json['state'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['osm_type'] = osmType;
    data['osm_id'] = osmId;
    data['extent'] = extent;
    data['country'] = country;
    data['osm_key'] = osmKey;
    data['city'] = city;
    data['countrycode'] = countrycode;
    data['osm_value'] = osmValue;
    data['name'] = name;
    data['county'] = county;
    data['state'] = state;
    data['type'] = type;
    return data;
  }
}
