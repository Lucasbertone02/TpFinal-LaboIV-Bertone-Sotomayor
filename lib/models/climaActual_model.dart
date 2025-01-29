class climaActual {
  String status;
  Data data;

  climaActual({
    required this.status,
    required this.data,
  });

  factory climaActual.fromJson(Map<String, dynamic> json) => climaActual(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  String nombreCiudad;
  String descripcion;
  double temperatura;
  double tempMinima;
  double tempMaxima;
  double sensacionTermica;
  int humedad;
  double viento;
  String icono;  // Se agrega el campo 'icono'

  Data({
    required this.nombreCiudad,
    required this.descripcion,
    required this.temperatura,
    required this.tempMinima,
    required this.tempMaxima,
    required this.sensacionTermica,
    required this.humedad,
    required this.viento,
    required this.icono,  // Se añade en el constructor
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    nombreCiudad: json["nombre_ciudad"],
    descripcion: json["descripcion"],
    temperatura: json["temperatura"]?.toDouble(),
    tempMinima: json["temp_minima"]?.toDouble(),
    tempMaxima: json["temp_maxima"]?.toDouble(),
    sensacionTermica: json["sensacion_termica"]?.toDouble(),
    humedad: json["humedad"],
    viento: json["viento"]?.toDouble(),
    icono: json["icono"] ?? "",  // Se asegura que si no existe el campo, se le asigne un valor vacío
  );

  Map<String, dynamic> toJson() => {
    "nombre_ciudad": nombreCiudad,
    "descripcion": descripcion,
    "temperatura": temperatura,
    "temp_minima": tempMinima,
    "temp_maxima": tempMaxima,
    "sensacion_termica": sensacionTermica,
    "humedad": humedad,
    "viento": viento,
    "icono": icono,  // Se agrega el campo 'icono' en el método toJson
  };
}
