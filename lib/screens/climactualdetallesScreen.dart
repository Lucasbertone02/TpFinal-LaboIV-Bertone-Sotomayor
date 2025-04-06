import 'package:flutter/material.dart';
import 'package:flutter_application_base/mocks/weather_icons.dart';

class ClimaDetailsScreen extends StatelessWidget {
  final String nombreCiudad;
  final String descripcion;
  final double temperatura;
  final double tempMinima;
  final double tempMaxima;
  final double sensacionTermica;
  final int humedad;
  final double viento;
  final String icono;

  const ClimaDetailsScreen({
    required this.nombreCiudad,
    required this.descripcion,
    required this.temperatura,
    required this.tempMinima,
    required this.tempMaxima,
    required this.sensacionTermica,
    required this.humedad,
    required this.viento,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
   final ColorScheme colorScheme = Theme.of(context).colorScheme;
     final bool isDarkMode = colorScheme.brightness == Brightness.dark;
     return Scaffold(
      backgroundColor: isDarkMode ? const Color.fromARGB(255, 30, 30, 50) : Colors.white,
      appBar: AppBar(
        title: Text(
          'Detalles de $nombreCiudad',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.blue,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              isDarkMode ? Colors.grey[800]! : Colors.blue[50]!,
              isDarkMode ? Colors.grey[900]! : Colors.blue[100]!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icono del clima con animación
                Center(
                  child: AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(seconds: 1),
                    child: Icon(
                      getWeatherIcon(icono),
                      size: 120,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Nombre de la ciudad y descripción
                Center(
                  child: Text(
                    nombreCiudad,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    descripcion,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Detalles del clima dentro de tarjetas redondeadas
                _buildDetailCard('Temperatura', '$temperatura°C', isDarkMode),
                _buildDetailCard('Temperatura Mínima', '$tempMinima°C', isDarkMode),
                _buildDetailCard('Temperatura Máxima', '$tempMaxima°C', isDarkMode),
                _buildDetailCard('Sensación Térmica', '$sensacionTermica°C', isDarkMode),
                _buildDetailCard('Humedad', '$humedad%', isDarkMode),
                _buildDetailCard('Viento', '$viento km/h', isDarkMode),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(String title, String value, bool isDarkMode) {
    // Colores dinámicos en los valores
    Color valueColor = _getTemperatureColor(value);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: isDarkMode ? Colors.grey[850] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  color: valueColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Función que determina el color basado en la temperatura
  Color _getTemperatureColor(String value) {
    double temp = double.tryParse(value.replaceAll('°C', '')) ?? 0.0;
    if (temp > 30) {
      return Colors.redAccent;
    } else if (temp > 15) {
      return Colors.orangeAccent;
    } else if (temp > 0) {
      return Colors.blueAccent;
    } else {
      return Colors.lightBlueAccent;
    }
  }
}
