import 'package:flutter/material.dart';

class ClimaCiudadesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> ciudadesClima = [
    {
      'ciudad': 'Buenos Aires',
      'clima': [
        {'day': 'Lunes', 'image': 'assets/images/sol.png', 'weather': 'Soleado', 'temp': '22°C / 15°C'},
        {'day': 'Martes', 'image': 'assets/images/nublado.png', 'weather': 'Nublado', 'temp': '20°C / 14°C'},
        {'day': 'Miércoles', 'image': 'assets/images/lluvia.png', 'weather': 'Lluvioso', 'temp': '18°C / 13°C'},
        {'day': 'Jueves', 'image': 'assets/images/tormenta.png', 'weather': 'Tormenta', 'temp': '17°C / 12°C'},
        {'day': 'Viernes', 'image': 'assets/images/sol_nubes.png', 'weather': 'Soleado/Nublado', 'temp': '21°C / 14°C'},
        {'day': 'Sábado', 'image': 'assets/images/sol.png', 'weather': 'Soleado', 'temp': '25°C / 16°C'},
        {'day': 'Domingo', 'image': 'assets/images/nublado.png', 'weather': 'Nublado', 'temp': '19°C / 13°C'},
      ]
    },
    {
      'ciudad': 'Londres',
      'clima': [
        {'day': 'Lunes', 'image': 'assets/images/lluvia.png', 'weather': 'Lluvioso', 'temp': '8°C / 4°C'},
        {'day': 'Martes', 'image': 'assets/images/nublado.png', 'weather': 'Mayormente nublado', 'temp': '9°C / 5°C'},
        {'day': 'Miércoles', 'image': 'assets/images/lluvia.png', 'weather': 'Lluvia ligera', 'temp': '7°C / 3°C'},
        {'day': 'Jueves', 'image': 'assets/images/sol_nubes.png', 'weather': 'Parcialmente soleado', 'temp': '10°C / 6°C'},
        {'day': 'Viernes', 'image': 'assets/images/lluvia.png', 'weather': 'Lluvia', 'temp': '8°C / 4°C'},
        {'day': 'Sábado', 'image': 'assets/images/nublado.png', 'weather': 'Nublado', 'temp': '6°C / 2°C'},
        {'day': 'Domingo', 'image': 'assets/images/lluvia.png', 'weather': 'Lluvia', 'temp': '5°C / 1°C'},
      ]
    },
    {
      'ciudad': 'Lima',
      'clima': [
        {'day': 'Lunes', 'image': 'assets/images/nublado.png', 'weather': 'Nublado', 'temp': '21°C / 18°C'},
        {'day': 'Martes', 'image': 'assets/images/nublado.png', 'weather': 'Mayormente nublado', 'temp': '22°C / 19°C'},
        {'day': 'Miércoles', 'image': 'assets/images/sol_nubes.png', 'weather': 'Parcialmente soleado', 'temp': '23°C / 20°C'},
        {'day': 'Jueves', 'image': 'assets/images/sol.png', 'weather': 'Soleado', 'temp': '24°C / 21°C'},
        {'day': 'Viernes', 'image': 'assets/images/nublado.png', 'weather': 'Nublado', 'temp': '22°C / 19°C'},
        {'day': 'Sábado', 'image': 'assets/images/sol_nubes.png', 'weather': 'Parcialmente soleado', 'temp': '23°C / 20°C'},
        {'day': 'Domingo', 'image': 'assets/images/nublado.png', 'weather': 'Nublado', 'temp': '21°C / 18°C'},
      ]
    },
    {
      'ciudad': 'Bogotá',
      'clima': [
        {'day': 'Lunes', 'image': 'assets/images/sol.png', 'weather': 'Soleado', 'temp': '20°C / 10°C'},
        {'day': 'Martes', 'image': 'assets/images/nublado.png', 'weather': 'Nublado', 'temp': '18°C / 9°C'},
        {'day': 'Miércoles', 'image': 'assets/images/lluvia.png', 'weather': 'Lluvioso', 'temp': '16°C / 8°C'},
        {'day': 'Jueves', 'image': 'assets/images/tormenta.png', 'weather': 'Tormenta', 'temp': '15°C / 7°C'},
        {'day': 'Viernes', 'image': 'assets/images/sol_nubes.png', 'weather': 'Soleado/Nublado', 'temp': '19°C / 10°C'},
        {'day': 'Sábado', 'image': 'assets/images/sol.png', 'weather': 'Soleado', 'temp': '22°C / 12°C'},
        {'day': 'Domingo', 'image': 'assets/images/nublado.png', 'weather': 'Nublado', 'temp': '17°C / 8°C'},
      ]
    },
    {
      'ciudad': 'Montevideo',
      'clima': [
        {'day': 'Lunes', 'image': 'assets/images/sol.png', 'weather': 'Soleado', 'temp': '20°C / 13°C'},
        {'day': 'Martes', 'image': 'assets/images/nublado.png', 'weather': 'Nublado', 'temp': '18°C / 12°C'},
        {'day': 'Miércoles', 'image': 'assets/images/lluvia.png', 'weather': 'Lluvioso', 'temp': '16°C / 11°C'},
        {'day': 'Jueves', 'image': 'assets/images/tormenta.png', 'weather': 'Tormenta', 'temp': '14°C / 10°C'},
        {'day': 'Viernes', 'image': 'assets/images/sol_nubes.png', 'weather': 'Soleado/Nublado', 'temp': '19°C / 13°C'},
        {'day': 'Sábado', 'image': 'assets/images/sol.png', 'weather': 'Soleado', 'temp': '22°C / 15°C'},
        {'day': 'Domingo', 'image': 'assets/images/nublado.png', 'weather': 'Nublado', 'temp': '18°C / 12°C'},
      ]
    },
  ];

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
                              return Container(
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