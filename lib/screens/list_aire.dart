import 'package:flutter/material.dart';
import 'package:flutter_application_base/screens/list_aire_item.dart';
import 'package:flutter_application_base/screens/list_comentarios.dart';
import 'package:flutter_application_base/widgets/card.dart';

class ListaRegistrosAireScreen extends StatelessWidget {
  final List<Map<String, String>> ciudades = [
    {'nombre': 'Moscu', 'imagen': 'assets/images/cont_moderado.png', 'indice': '50', 'nivel': 'Moderado'},
    {'nombre': 'Rio de Janeiro', 'imagen': 'assets/images/cont_avanzada.png', 'indice': '120', 'nivel': 'Alto'},
    {'nombre': 'Ciudad de Mexico', 'imagen': 'assets/images/cont_moderado.png', 'indice': '80', 'nivel': 'Moderado'},
    {'nombre': 'Nueva York', 'imagen': 'assets/images/cont_avanzada.png', 'indice': '130', 'nivel': 'Alto'},
    {'nombre': 'Madrid', 'imagen': 'assets/images/cont_baja.png', 'indice': '30', 'nivel': 'Bajo'},
    {'nombre': 'Paris', 'imagen': 'assets/images/cont_moderado.png', 'indice': '90', 'nivel': 'Alto'},
    {'nombre': 'Londres', 'imagen': 'assets/images/cont_moderado.png', 'indice': '89', 'nivel': 'Alto'},
    {'nombre': 'Tokyo', 'imagen': 'assets/images/cont_avanzada.png', 'indice': '110', 'nivel': 'Alto'},
    {'nombre': 'Los Angeles', 'imagen': 'assets/images/cont_moderado.png', 'indice': '75', 'nivel': 'Moderado'},
    {'nombre': 'Berlin', 'imagen': 'assets/images/cont_baja.png', 'indice': '40', 'nivel': 'Bajo'},
    {'nombre': 'Buenos Aires','imagen':'assets/images/cont_moderado.png','nivel': 'Moderado', 'indice': '52'},
    {'nombre': 'Lima','imagen':'assets/images/cont_baja.png','nivel':'Bajo', 'indice': '31'},
    {'nombre': 'Bogotá','imagen':'assets/images/cont_moderado.png', 'nivel':'Moderado', 'indice': '45'},
    {'nombre': 'Montevideo','imagen':'assets/images/cont_baja.png', 'nivel':'Bajo', 'indice': '28'},
    {'nombre': 'Caracas','imagen':'assets/images/cont_avanzada.png', 'nivel':'Alto', 'indice': '132'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            text: 'Lista de registros de contaminación',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 20,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 95, 182, 233),
      ),
      body: ListView.builder(
        itemCount: ciudades.length,
        itemBuilder: (context, index) {
          final ciudad = ciudades[index];
          final bool isContaminado = int.parse(ciudad['indice']!) > 100;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VisualizacionRegistroAireScreen(
                    ciudad: ciudad, // Pasar los datos de la ciudad
                    onComentarioGuardado: (comentario, esPeligrosa) {
                      print('Comentario guardado: $comentario');
                      // Agregar el comentario junto con la ciudad y la peligrosidad
                      ListaComentariosScreen.comentarios.add({
                        'ciudad': ciudad['nombre']!,
                        'comentario': comentario,
                        'esPeligrosa': esPeligrosa.toString(),
                      });
                    },
                  ),
                ),
              );
            },
            child: RegistroContaminacionCard(
              ciudad: ciudad['nombre']!,
              indiceContaminacion: ciudad['indice']!,
              isContaminado: isContaminado,
              imagenUrl: ciudad['imagen']!,
            ),
          );
        },
      ),
    );
  }
}
