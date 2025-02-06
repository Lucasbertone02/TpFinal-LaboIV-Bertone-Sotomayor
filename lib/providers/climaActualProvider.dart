import 'dart:convert' as convert;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_application_base/models/climaActual_model.dart';
import 'package:flutter_application_base/mocks/mocks.dart';
import 'package:http/http.dart' as http;

class ClimaActualProvider {
  // Método original para las ciudades predefinidas 
  Future<Map<String, climaActual>> fetchClimaActual() async {
    Map<String, climaActual> climas = {};

    try {
      print('Realizando peticiones a la API para obtener el clima actual');
      final baseUrl = dotenv.env['API_URL_ANDROID'];
      if (baseUrl == null) {
        throw Exception("La variable URL no está definida en el archivo .env");
      }

      for (String ciudad in ciudadesProvider) {
        final url = Uri.http(baseUrl, '/api/v1/clima/ciudad/$ciudad');

        final response = await http.get(url);
        if (response.statusCode == 200) {
          climaActual climaCiudad = climaActual.fromJson(convert.jsonDecode(response.body));
          climas[ciudad] = climaCiudad;
        } else {
          print('Error en la petición para $ciudad: ${response.statusCode}');
        }
      }
    } catch (e) {
      print('Error en la petición: $e');
    }

    return climas;
  }

  // Nuevo método para buscar una ciudad específica por nombre
  Future<climaActual> fetchClimaPorCiudad(String ciudad) async {
    try {
      print('Realizando petición a la API para obtener el clima de $ciudad');
      final baseUrl = dotenv.env['API_URL_ANDROID'];
      if (baseUrl == null) {
        throw Exception("La variable URL no está definida en el archivo .env");
      }

      final url = Uri.http(baseUrl, '/api/v1/clima/ciudad/$ciudad');

      final response = await http.get(url);
      if (response.statusCode == 200) {
        return climaActual.fromJson(convert.jsonDecode(response.body));
      } else {
        throw Exception('Error en la petición: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al obtener el clima: $e');
    }
  }
}