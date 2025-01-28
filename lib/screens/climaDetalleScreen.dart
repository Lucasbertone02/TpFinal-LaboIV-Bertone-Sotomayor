import 'package:flutter/material.dart';
import 'package:flutter_application_base/widgets/ClimaDetalleCard.dart';
import 'package:weather_icons/weather_icons.dart'; // Importamos para iconos del clima

class ClimaDetalleScreen extends StatelessWidget {
  final String clima; 
  final String descripcion;
  final String temp;
  final String viento;
  final String humedad;
  final IconData icono; // Recibimos el ícono del clima

  ClimaDetalleScreen({
    required this.clima,
    required this.descripcion,
    required this.temp,
    required this.viento,
    required this.humedad,
    required this.icono, // Recibimos el ícono del clima
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
        backgroundColor: isDarkMode ? const Color.fromARGB(255, 29, 24, 99) : Colors.blueAccent,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Titulo y el ícono del clima
              ClimaDetalleCard(
                title: clima,
                description: descripcion,
                temperature: temp,
                isDarkMode: isDarkMode,
                icon: icono,
              ),
              
              // Datos de viento y humedad
              const SizedBox(height: 20),
              _buildAdditionalInfo(isDarkMode),
            ],
          ),
        ),
      ),
    );
  }

  // Función para construir la sección de viento y humedad
  Widget _buildAdditionalInfo(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow('Viento', viento, isDarkMode),
        const SizedBox(height: 10),
        _buildInfoRow('Humedad', humedad, isDarkMode),
      ],
    );
  }

  // Widget para mostrar la fila de información de viento y humedad
  Widget _buildInfoRow(String label, String value, bool isDarkMode) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: isDarkMode ? Colors.white70 : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Función para obtener el ícono correspondiente a la descripción del clima
  IconData _getWeatherIcon(String descripcion) {
    switch (descripcion.toLowerCase()) {
      case 'cielo claro':
        return WeatherIcons.day_sunny;
      case 'nubes dispersas':
        return WeatherIcons.day_cloudy;
      case 'muy nuboso':
        return WeatherIcons.cloudy;
      case 'nubes':
        return WeatherIcons.cloudy;
      case 'lluvioso':
        return WeatherIcons.rain;
      case 'tormenta':
        return WeatherIcons.storm_showers;
      default:
        return WeatherIcons.na; // Si no se encuentra una descripción, mostramos un ícono genérico
    }
  }
}
