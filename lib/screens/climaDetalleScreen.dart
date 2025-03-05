import 'package:flutter/material.dart';
import 'package:flutter_application_base/mocks/weather_icons.dart';
import 'package:flutter_application_base/models/clima_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_base/widgets/ClimaDetalleCard.dart'; // Importamos la clase con la lógica de los iconos
// Importamos el modelo Clima y Datum

class ClimaDetalleScreen extends StatelessWidget {
  final Datum datoClima; // Recibimos un objeto Datum con todos los datos del clima

  ClimaDetalleScreen({
    required this.datoClima, // Recibimos el objeto completo de datos
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = colorScheme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Color.fromARGB(255, 30, 30, 50) : Colors.white,
      appBar: AppBar(
        title: Text('Detalles del Clima en ${datoClima.nombreCiudad}'), // Mostrar el nombre de la ciudad
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
                    title: datoClima.descripcion,
                    description: 'Día: ${DateFormat('dd/MM/yyyy').format(datoClima.fecha)}', // Formateamos la fecha aquí
                    temperature: '${datoClima.temperatura}°C',
                    isDarkMode: isDarkMode,
                    icon: getWeatherIcon(datoClima.icono),
                  ),
              
              const SizedBox(height: 30),

              // Datos adicionales de viento, humedad, etc.
              _buildAdditionalInfo(isDarkMode),
            ],
          ),
        ),
      ),
    );
  }

  // Función para construir la sección de viento, humedad, etc.
  Widget _buildAdditionalInfo(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow('Viento', '${datoClima.viento} km/h', isDarkMode),
        const SizedBox(height: 20),
        _buildInfoRow('Humedad', '${datoClima.humedad}%', isDarkMode),
        const SizedBox(height: 20),
        _buildInfoRow('Sensación Térmica', '${datoClima.sensacionTermica}°C', isDarkMode),
      ],
    );
  }

  // Widget para mostrar la fila de información de viento y humedad
  Widget _buildInfoRow(String label, String value, bool isDarkMode) {
    return Container(
      padding: EdgeInsets.all(18),
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
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
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              color: isDarkMode ? Colors.white70 : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
