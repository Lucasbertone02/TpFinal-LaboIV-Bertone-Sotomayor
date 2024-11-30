import 'package:flutter/material.dart';
import 'package:flutter_application_base/mocks/mocks.dart';
import 'package:flutter_application_base/screens/climaDetalleScreen.dart';

class ClimaCiudadesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = colorScheme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Color.fromARGB(255, 30, 30, 50) : Colors.white,
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
        backgroundColor: isDarkMode ? Color.fromARGB(255, 60, 60, 100) : Colors.blue,
      ),
      body: Column(
        children: [
          // Contenido desplazable
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Espacio para el texto "Pronóstico extendido"
                    Padding(
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
                    ),
                    // Lista de ciudades y clima
                    ...ciudadesClima.map((ciudad) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ciudad['ciudad'],
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 250,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: ciudad['clima'].length,
                              itemBuilder: (context, index) {
                                final diaClima = ciudad['clima'][index];
                                return GestureDetector(
                                  onTap: () {
                                    // Al tocar el clima, navegas a la pantalla de detalles
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ClimaDetalleScreen(
                                          clima: diaClima['weather'],
                                          descripcion: diaClima['descripcion'],
                                          imagen: diaClima['image'],
                                          temp: diaClima['temp'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 160,
                                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                      color: isDarkMode
                                          ? Color.fromARGB(255, 50, 50, 80)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(8.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: isDarkMode
                                              ? Colors.black26
                                              : Colors.grey.withOpacity(0.2),
                                          blurRadius: 10,
                                          offset: const Offset(0, 5),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          diaClima['day'],
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: isDarkMode ? Colors.white : Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Image.asset(
                                          diaClima['image'],
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          diaClima['weather'],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: isDarkMode ? Colors.white70 : Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          diaClima['temp'],
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: isDarkMode ? Colors.white70 : Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      );
                    }).toList(),
                    // Nuevo texto para agregar ciudad
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Para agregar una ciudad en específico, complete nuestro formulario',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: isDarkMode ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
