import 'package:flutter/material.dart';
import 'package:flutter_application_base/screens/screens.dart';
import 'package:flutter_application_base/widgets/card.dart';
import '../mocks/mocks.dart';

//Pantalla que muestra una lista de registros de contaminación del aire
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
          final ciudad = ciudades[index]; // Obtiene los datos de la ciudad actual
          return GestureDetector(
            onTap: () {
              // Navega a la pantalla de visualización de registro con los datos de la ciudad seleccionada
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VisualizacionRegistroAireScreen(
                    ciudad: ciudad, // Pasa los datos de la ciudad a la siguiente pantalla
                    onComentarioGuardado: (comentario, esPeligrosa) {
                      print('Comentario guardado: $comentario');
                      // Agrega el comentario junto con información sobre la peligrosidad a la lista global
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
            //LLama al widget RegistroContaminacionCard para mostrar la información de la ciudad
            child: RegistroContaminacionCard(
              ciudad: ciudad['nombre']!,
              indiceContaminacion: ciudad['indice']!, 
               nivelContaminacion: ciudad['nivel']!,
              imagenUrl: ciudad['imagen']!, 
            ),
          );
        },
      ),
    );
  }
}
