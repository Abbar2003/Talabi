
class DirwctionModel {
    String? code;
    List<Routes>? routes;
    List<Waypoints>? waypoints;

    DirwctionModel({this.code, this.routes, this.waypoints});

    DirwctionModel.fromJson(Map<String, dynamic> json) {
        code = json["code"];
        routes = json["routes"] == null ? null : (json["routes"] as List).map((e) => Routes.fromJson(e)).toList();
        waypoints = json["waypoints"] == null ? null : (json["waypoints"] as List).map((e) => Waypoints.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["code"] = code;
        if(routes != null) {
            _data["routes"] = routes?.map((e) => e.toJson()).toList();
        }
        if(waypoints != null) {
            _data["waypoints"] = waypoints?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Waypoints {
    String? hint;
    double? distance;
    String? name;
    List<double>? location;

    Waypoints({this.hint, this.distance, this.name, this.location});

    Waypoints.fromJson(Map<String, dynamic> json) {
        hint = json["hint"];
        distance = json["distance"];
        name = json["name"];
        location = json["location"] == null ? null : List<double>.from(json["location"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["hint"] = hint;
        _data["distance"] = distance;
        _data["name"] = name;
        if(location != null) {
            _data["location"] = location;
        }
        return _data;
    }
}

class Routes {
    String? geometry;
    List<Legs>? legs;
    String? weightName;
    double? weight;
    double? duration;
    double? distance;

    Routes({this.geometry, this.legs, this.weightName, this.weight, this.duration, this.distance});

    Routes.fromJson(Map<String, dynamic> json) {
        geometry = json["geometry"];
        legs = json["legs"] == null ? null : (json["legs"] as List).map((e) => Legs.fromJson(e)).toList();
        weightName = json["weight_name"];
        weight = json["weight"];
        duration = json["duration"];
        distance = json["distance"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["geometry"] = geometry;
        if(legs != null) {
            _data["legs"] = legs?.map((e) => e.toJson()).toList();
        }
        _data["weight_name"] = weightName;
        _data["weight"] = weight;
        _data["duration"] = duration;
        _data["distance"] = distance;
        return _data;
    }
}

class Legs {
    List<Steps>? steps;
    String? summary;
    double? weight;
    double? duration;
    double? distance;

    Legs({this.steps, this.summary, this.weight, this.duration, this.distance});

    Legs.fromJson(Map<String, dynamic> json) {
        steps = json["steps"] == null ? null : (json["steps"] as List).map((e) => Steps.fromJson(e)).toList();
        summary = json["summary"];
        weight = json["weight"];
        duration = json["duration"];
        distance = json["distance"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(steps != null) {
            _data["steps"] = steps?.map((e) => e.toJson()).toList();
        }
        _data["summary"] = summary;
        _data["weight"] = weight;
        _data["duration"] = duration;
        _data["distance"] = distance;
        return _data;
    }
}

class Steps {
    String? geometry;
    Maneuver? maneuver;
    String? mode;
    String? drivingSide;
    String? name;
    List<Intersections>? intersections;
    double? weight;
    double? duration;
    double? distance;

    Steps({this.geometry, this.maneuver, this.mode, this.drivingSide, this.name, this.intersections, this.weight, this.duration, this.distance});

    Steps.fromJson(Map<String, dynamic> json) {
        geometry = json["geometry"];
        maneuver = json["maneuver"] == null ? null : Maneuver.fromJson(json["maneuver"]);
        mode = json["mode"];
        drivingSide = json["driving_side"];
        name = json["name"];
        intersections = json["intersections"] == null ? null : (json["intersections"] as List).map((e) => Intersections.fromJson(e)).toList();
        weight = json["weight"];
        duration = json["duration"];
        distance = json["distance"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["geometry"] = geometry;
        if(maneuver != null) {
            _data["maneuver"] = maneuver?.toJson();
        }
        _data["mode"] = mode;
        _data["driving_side"] = drivingSide;
        _data["name"] = name;
        if(intersections != null) {
            _data["intersections"] = intersections?.map((e) => e.toJson()).toList();
        }
        _data["weight"] = weight;
        _data["duration"] = duration;
        _data["distance"] = distance;
        return _data;
    }
}

class Intersections {
    int? out;
    List<bool>? entry;
    List<int>? bearings;
    List<double>? location;

    Intersections({this.out, this.entry, this.bearings, this.location});

    Intersections.fromJson(Map<String, dynamic> json) {
        out = json["out"];
        entry = json["entry"] == null ? null : List<bool>.from(json["entry"]);
        bearings = json["bearings"] == null ? null : List<int>.from(json["bearings"]);
        location = json["location"] == null ? null : List<double>.from(json["location"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["out"] = out;
        if(entry != null) {
            _data["entry"] = entry;
        }
        if(bearings != null) {
            _data["bearings"] = bearings;
        }
        if(location != null) {
            _data["location"] = location;
        }
        return _data;
    }
}

class Maneuver {
    int? bearingAfter;
    int? bearingBefore;
    List<double>? location;
    String? type;

    Maneuver({this.bearingAfter, this.bearingBefore, this.location, this.type});

    Maneuver.fromJson(Map<String, dynamic> json) {
        bearingAfter = json["bearing_after"];
        bearingBefore = json["bearing_before"];
        location = json["location"] == null ? null : List<double>.from(json["location"]);
        type = json["type"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["bearing_after"] = bearingAfter;
        _data["bearing_before"] = bearingBefore;
        if(location != null) {
            _data["location"] = location;
        }
        _data["type"] = type;
        return _data;
    }
}