import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:flutter_application_base/models/climaActual_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_application_base/mocks/mocks.dart'; // Importamos el mock con las ciudades
import 'package:http/http.dart' as http;

class ClimaActualProvider extends ChangeNotifier {
  Map<String, climaActual> climas = {}; // Almacena el clima de cada ciudad

  ClimaActualProvider() {
    print('Clima Actual Provider inicializado...');
    getClimaActual();
  }

  getClimaActual() async {
    try {
      print('Realizando peticiones a la API para obtener el clima actual');

      final baseUrl = dotenv.env['URL']; // Esto devuelve "192.168.0.23:3000"
      if (baseUrl == null) {
        throw Exception("La variable URL no está definida en el archivo .env");
      }

      for (String ciudad in ciudadesProvider) {
        final url = Uri.http(baseUrl, '/api/v1/clima/ciudad/$ciudad');

        final response = await http.get(url);

        if (response.statusCode == 200) {
          // Decodifica la respuesta y guarda los datos en el mapa
          climaActual climaCiudad = climaActual.fromJson(convert.jsonDecode(response.body));
          climas[ciudad] = climaCiudad; // Guarda el clima de la ciudad en el mapa
          print('Clima actual obtenido para $ciudad: ${climaCiudad.data.descripcion}');
        } else {
          print('Error en la petición para $ciudad: ${response.statusCode}');
        }
      }
    } catch (e) {
      print('Error en la petición: $e');
    }
    notifyListeners(); // Notifica a los listeners para actualizar la UI
  }
}
