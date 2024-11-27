import 'package:flutter/material.dart';

// Este es el widget reutilizable, que es una "Card" que representa un registro de contaminación
class RegistroContaminacionCard extends StatelessWidget {
  final String ciudad;
  final String indiceContaminacion;
  final bool isContaminado;
  final String imagenUrl; // La imagen ahora siempre se espera que esté presente

  const RegistroContaminacionCard({
    Key? key,
    required this.ciudad,
    required this.indiceContaminacion,
    required this.isContaminado,
    required this.imagenUrl, // Ya no es nullable
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            // La imagen siempre se mostrará, y ahora tiene tamaño definido
            Image.asset(
              imagenUrl,
              height: 100, // Ajusta el tamaño de la imagen según tus necesidades
              width: double.infinity, // Esto hace que la imagen ocupe todo el ancho disponible
              fit: BoxFit.cover, // Esto asegura que la imagen se recorte correctamente si es necesario
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
                Text(isContaminado ? 'Alta' : 'Baja'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
