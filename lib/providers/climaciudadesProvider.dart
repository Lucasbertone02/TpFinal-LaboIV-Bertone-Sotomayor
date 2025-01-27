import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:flutter_application_base/models/clima_model.dart';
import 'package:http/http.dart' as http;

class Climaciudadesprovider extends ChangeNotifier {
  Clima? clima;

  Climaciudadesprovider() {
    print('Clima Provider inicializado...');
    getClima();
  }

  getClima() async {
    try {
      print('Realizando petición a la API');
      final url = Uri.http(
        'localhost:3000',
        '/api/v1/clima/ciudad',
        {'ciudad': 'ciudad'}, // Cambia la ciudad si es necesario
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Decodifica la respuesta
        clima = Clima.fromJson(convert.jsonDecode(response.body));
        print('Clima obtenido: ${clima!.status}');
      } else {
        print('Error en la petición: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en la petición: $e');
    }
    notifyListeners();
  }
}