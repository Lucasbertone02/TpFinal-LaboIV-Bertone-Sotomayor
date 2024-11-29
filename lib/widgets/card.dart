import 'package:flutter/material.dart';

//Widget reutilizable que representa un registro de contaminación
class RegistroContaminacionCard extends StatelessWidget {
  final String ciudad; 
  final String indiceContaminacion; 
  final String nivelContaminacion; 
  final String imagenUrl; 


  const RegistroContaminacionCard({
    Key? key,
    required this.ciudad,
    required this.indiceContaminacion,
    required this.nivelContaminacion,
    required this.imagenUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determinar el color basado en el nivel de contaminación.
    Color colorTexto;
    switch (nivelContaminacion.toLowerCase()) {
      case 'alta':
        colorTexto = Colors.red;
        break;
      case 'moderada':
        colorTexto = Colors.orange;
        break;
      case 'baja':
        colorTexto = Colors.green;
        break;
      default:
        colorTexto = Colors.grey; // Por si se introduce un nivel no esperado.
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagenUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              ciudad,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text('Índice de Contaminación: $indiceContaminacion'),
            const SizedBox(height: 5),
            Row(
              children: [
                const Text(
                  'Contaminación: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  nivelContaminacion,
                  style: TextStyle(
                    color: colorTexto,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
