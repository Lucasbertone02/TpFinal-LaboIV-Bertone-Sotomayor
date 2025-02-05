class Aire {
  int aqi;
  Map<String, double> components;

  Aire({
    required this.aqi,
    required this.components,
  });
  //modelo de aire con los datos que queremos que nos devuelva la api
  factory Aire.fromJson(Map<String, dynamic> json) {
    var list = json["data"]["list"] as List;
    var registroAire = list.isNotEmpty ? list[0] : null;

    if (registroAire != null) {
      return Aire(
        aqi: registroAire["main"]["aqi"],
        components: Map.from(registroAire["components"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );
    } else {
      throw Exception("La lista está vacía");
    }
  }

  get data => null;

  Map<String, dynamic> toJson() => {
        "aqi": aqi,
        "components": Map.from(components)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
