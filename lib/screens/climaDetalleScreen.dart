import 'package:flutter/material.dart';
import 'package:flutter_application_base/widgets/ClimaDetalleCard.dart';

class ClimaDetalleScreen extends StatelessWidget {
  final String clima; 
  final String descripcion;
  final String imagen;
  final String temp;

  ClimaDetalleScreen({
    required this.clima,
    required this.descripcion,
    required this.imagen,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = colorScheme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Color.fromARGB(255, 30, 30, 50) : Colors.white,
      appBar: AppBar(
        title: const Text('Detalles del Clima'),
        centerTitle: true,
        backgroundColor: isDarkMode ? Colors.deepPurple : Colors.blueAccent,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClimaDetalleCard(
            title: clima,
            description: descripcion,
            imagePath: imagen,
            temperature: temp,
            isDarkMode: isDarkMode,
          ),
        ),
      ),
    );
  }
}
