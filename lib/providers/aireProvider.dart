import 'dart:convert' as convert;
import 'package:flutter/foundation.dart';
import 'package:flutter_application_base/models/aire_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_base/models/list_aire_model.dart';
class AireProvider extends ChangeNotifier {
  List<ListElement> listAire = [];

  AireProvider() {
    print('AireProvider inicializado');
    getAire();
  }

  getAire() async {
    try {
      print('realizando petición a la API');
      final url = Uri.https(
        'localhost:3000',
        '/api/v1/aire/polucion',
        {'lat': '{lat}', 'lon': '{lon}'},
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Decodifica la respuesta
        final Aire aire = aireFromJson(response.body);

        // Asigna la lista de ListElement
        listAire = aire.data.list;
        } else {
        print('Error en la petición: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en la petición: $e');
    }
    notifyListeners();
  }
  
}