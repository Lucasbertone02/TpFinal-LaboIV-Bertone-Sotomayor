class Aire {
    String msg;
    Data data;

    Aire({
      required this.msg,
      required this.data
    });

    factory Aire.fromJson(Map<String, dynamic> json) => Aire(
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": data.toJson(),
    };
}

class Data {
  Coord coord;
  List<ListElement> list;

  Data({
    required this.coord,
    required this.list,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    coord: Coord.fromJson(json["coord"]),
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "coord": coord.toJson(),
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class Coord {
  double lon;
  double lat;

  Coord({
    required this.lon,
    required this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lon: json["lon"].toDouble(),
    lat: json["lat"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lon": lon,
    "lat": lat,
  };
}

class ListElement {
  Main main;
  Map<String,double> components;
  int dt;

  ListElement({
    required this.main,
    required this.components,
    required this.dt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    main: Main.fromJson(json["main"]),
    components: Map.from(json["components"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    dt: json["dt"],
  );

  Map<String, dynamic> toJson() => {
    "main": main.toJson(),
    "components": Map.from(components).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "dt": dt,
  };
}

class Main {
  int aqi;

  Main({
    required this.aqi,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    aqi: json["aqi"],
  );

  Map<String, dynamic> toJson() => {
    "aqi": aqi,
  };
}
