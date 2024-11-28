import 'package:flutter/material.dart';
import 'package:flutter_application_base/screens/screens.dart';
import 'package:flutter_application_base/widgets/card.dart';
import '../mocks/mocks.dart';

class ListaRegistrosAireScreen extends StatelessWidget {

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
