import 'package:flutter/material.dart';

class ClimaDetalleScreen extends StatelessWidget {
  final String clima; // Tipo de clima (soleado, nublado, etc.)
  final String descripcion; // Descripción del clima
  final String imagen; // Imagen asociada al clima
  final String temp; // Temperatura

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
        title: Text(
          'Detalles del Clima',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? Colors.deepPurple : Colors.blueAccent,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Título de tipo de clima con sombra y estilo moderno
              Text(
                clima,
                style: TextStyle(
                  fontSize: 30, // Reducido el tamaño
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black38,
                      offset: Offset(4.0, 4.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Imagen del clima sin sombras
              Image.asset(
                imagen,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              // Descripción del clima con fondo sutil
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[850] : Colors.blueGrey[50],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  descripcion,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16, // Reducido el tamaño de la letra
                    fontStyle: FontStyle.italic,
                    color: isDarkMode ? Colors.white70 : Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Temperatura con tamaño de letra ajustado
              AnimatedDefaultTextStyle(
                style: TextStyle(
                  fontSize: 24, // Reducido el tamaño
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.orangeAccent : Colors.red,
                ),
                duration: Duration(milliseconds: 300),
                child: Text(
                  'Temperatura: $temp',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
