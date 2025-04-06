import 'package:flutter/foundation.dart';
import 'package:flutter_application_base/models/aire_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_base/models/list_aire_model.dart';
class AireProvider extends ChangeNotifier {
  List<Aire> listAire = [];

  Future<Map<String, int>> cargarDatosCiudades(List<Map<String, dynamic>> ciudades) async {
    Map<String, int> datosCiudades = {};

    for (var ciudad in ciudades) {
      final lat = ciudad['lat'];
      final lon = ciudad['lon'];
  
      try {
        final baseurl = dotenv.env['API_URL_RENDER'];
        if (baseurl == null) {
        throw Exception("La variable URL no está definida en el archivo .env");
       }
        // Se usa latitud y longitud para hacer la consulta
        final url = Uri.http(
          baseurl, 
          '/api/v1/aire/polucion',
          {
            'lat': lat.toString(),
            'lon': lon.toString(),
          },
        );

        final response = await http.get(url);
        if (response.statusCode == 200) {
          final Aire aire = aireFromJson(response.body);
          datosCiudades[ciudad['nombre']] = aire.aqi; // se guarda el aqi con el nombre de la ciudad
        } else {
          datosCiudades[ciudad['nombre']] = 0; 
        }
      } catch (e) {
        print('Error al obtener datos para las coordenadas lat: $lat, lon: $lon: $e');
        datosCiudades[ciudad['nombre']] = 0; 
      }
    }

    return datosCiudades;
  }
}