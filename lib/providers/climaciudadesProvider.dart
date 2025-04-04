import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:flutter_application_base/mocks/mocks.dart';
import 'package:flutter_application_base/models/clima_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Climaciudadesprovider extends ChangeNotifier {
  List<Clima>? climas;  // Cambié la variable a una lista para almacenar el clima de varias ciudades

  Climaciudadesprovider() {
    print('Clima Provider inicializado...');
    getClima();
  }

  getClima() async {
    try {
      print('Realizando petición a la API');
      // Almacenamos los climas obtenidos
      List<Clima> climasList = [];

      final baseUrl = dotenv.env['API_URL_CHROME']; // Esto devuelve "10.0.2.2:3000"
      if (baseUrl == null) {
        throw Exception("La variable URL no está definida en el archivo .env");
      }

      // Iteramos sobre el array de ciudades
      for (String ciudad in ciudadesProvider) {
        final url = Uri.http(
          baseUrl, '/api/v1/pronostico/extendidoPorCiudad/$ciudad', 
        );

        final response = await http.get(url);

        if (response.statusCode == 200) {
          // Decodifica la respuesta y agrega los datos a la lista de climas
          Clima climaCiudad = Clima.fromJson(convert.jsonDecode(response.body));
          climasList.add(climaCiudad); // Agregamos el clima de esta ciudad
          print('Clima obtenido para $ciudad: ${climaCiudad.msg}');
        } else {
          print('Error en la petición para $ciudad: ${response.statusCode}');
        }
      }

      // Asignamos los climas a la variable
      climas = climasList;

    } catch (e) {
      print('Error en la petición: $e');
    }
    notifyListeners(); // Notifica a los listeners para actualizar la UI
  }
}