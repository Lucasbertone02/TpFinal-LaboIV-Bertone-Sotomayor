class Clima {
    String msg;
    List<Datum> data;

    Clima({
        required this.msg,
        required this.data,
    });

    factory Clima.fromJson(Map<String, dynamic> json) => Clima(
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String nombreCiudad;
    DateTime fecha;
    double temperatura;
    String descripcion;
    String icono;
    int humedad;
    double viento;
    double sensacionTermica;

    Datum({
        required this.nombreCiudad,
        required this.fecha,
        required this.temperatura,
        required this.descripcion,
        required this.icono,
        required this.humedad,
        required this.viento,
        required this.sensacionTermica,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        nombreCiudad: json["nombre_ciudad"],
        fecha: DateTime.parse(json["fecha"]),
        temperatura: json["temperatura"]?.toDouble(),
        descripcion: json["descripcion"],
        icono: json["icono"],
        humedad: json["humedad"],
        viento: json["viento"]?.toDouble(),
        sensacionTermica: json["sensacion_termica"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "nombre_ciudad": nombreCiudad,
        "fecha": "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "temperatura": temperatura,
        "descripcion": descripcion,
        "icono": icono,
        "humedad": humedad,
        "viento": viento,
        "sensacion_termica": sensacionTermica,
    };
}