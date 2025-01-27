class Clima {
    String status;
    Data data;

    Clima({
        required this.status,
        required this.data,
    });

    factory Clima.fromJson(Map<String, dynamic> json) => Clima(
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    String descripcion;
    double temperatura;
    double tempMinima;
    double tempMaxima;
    double sensacionTermica;
    int humedad;
    double viento;

    Data({
        required this.descripcion,
        required this.temperatura,
        required this.tempMinima,
        required this.tempMaxima,
        required this.sensacionTermica,
        required this.humedad,
        required this.viento,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        descripcion: json["descripcion"],
        temperatura: json["temperatura"]?.toDouble(),
        tempMinima: json["temp_minima"]?.toDouble(),
        tempMaxima: json["temp_maxima"]?.toDouble(),
        sensacionTermica: json["sensacion_termica"]?.toDouble(),
        humedad: json["humedad"],
        viento: json["viento"]?.toDouble(),
    );


    Map<String, dynamic> toJson() => {
        "descripcion": descripcion,
        "temperatura": temperatura,
        "temp_minima": tempMinima,
        "temp_maxima": tempMaxima,
        "sensacion_termica": sensacionTermica,
        "humedad": humedad,
        "viento": viento,
    };
}
