import 'package:flutter/material.dart';
import 'package:flutter_application_base/mocks/weather_icons.dart';
import 'package:flutter_application_base/providers/climaciudadesProvider.dart';
import 'package:flutter_application_base/screens/climaDetalleScreen.dart';
import 'package:provider/provider.dart';

class ClimaCiudadesScreen extends StatelessWidget {
  final List<String> ciudades = ['Bahia Blanca', 'Buenos Aires', 'Montevideo', 'Lima', 'Bogota'];

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = colorScheme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color.fromARGB(255, 30, 30, 50) : Colors.white,
      appBar: AppBar(
        title: Text(
          'Clima por Ciudad',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.blue,
      ),
      body: Consumer<Climaciudadesprovider>(
        builder: (context, climaProvider, child) {
          if (climaProvider.climas == null || climaProvider.climas!.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(isDarkMode),
                  ...ciudades.asMap().entries.map((entry) {
                    final int idx = entry.key;
                    final String ciudad = entry.value;

                    if (idx >= climaProvider.climas!.length) {
                      return Container();
                    }

                    return _buildCitySection(
                      ciudad: ciudad,
                      climaData: climaProvider.climas![idx],
                      isDarkMode: isDarkMode,
                      context: context,
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Pronóstico extendido',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Conoce el pronóstico extendido de las ciudades más importantes del mundo.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: isDarkMode ? Colors.white70 : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCitySection({
    required String ciudad,
    required dynamic climaData,
    required bool isDarkMode,
    required BuildContext context,
  }) {
    if (climaData == null || climaData.data == null) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            'Ciudad: $ciudad',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 250,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                climaData.data.length,
                (index) {
                  var datum = climaData.data[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: _buildWeatherCard(
                      context: context,
                      datum: datum,
                      isDarkMode: isDarkMode,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildWeatherCard({
    required BuildContext context,
    required dynamic datum,
    required bool isDarkMode,
  }) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ClimaDetalleScreen(
            datoClima: datum, // Pasas el objeto completo Datum
          ),
        ),
      ),
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color.fromARGB(255, 50, 50, 80) : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: isDarkMode ? Colors.black26 : Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatDate(datum.fecha),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Icon(
              getWeatherIcon(datum.icono), 
              size: 50,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            const SizedBox(height: 8),
            Text(
              datum.descripcion,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.white70 : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${datum.temperatura}°C',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: isDarkMode ? Colors.white70 : Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            // Barra de separación y temperaturas máxima y mínima
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime fecha) {
    return '${fecha.day}/${fecha.month}';
  }
}
