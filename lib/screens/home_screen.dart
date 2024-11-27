import 'package:flutter/material.dart';
import 'package:flutter_application_base/widgets/drawer_menu.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> climaSemanal = [
    {'day': 'Lunes', 'image': 'assets/images/sol.png', 'weather': 'Soleado', 'temp': '22°C / 15°C'},
    {'day': 'Martes', 'image': 'assets/images/nublado.png', 'weather': 'Nublado', 'temp': '20°C / 14°C'},
    {'day': 'Miércoles', 'image': 'assets/images/lluvia.png', 'weather': 'Lluvioso', 'temp': '18°C / 13°C'},
    {'day': 'Jueves', 'image': 'assets/images/tormenta.png', 'weather': 'Tormenta', 'temp': '17°C / 12°C'},
    {'day': 'Viernes', 'image': 'assets/images/sol_nubes.png', 'weather': 'Soleado/Nublado', 'temp': '21°C / 14°C'},
    {'day': 'Sábado', 'image': 'assets/images/sol.png', 'weather': 'Soleado', 'temp': '25°C / 16°C'},
    {'day': 'Domingo', 'image': 'assets/images/nublado.png', 'weather': 'Nublado', 'temp': '19°C / 13°C'},
  ];

  final List<Map<String, String>> contaminacionCiudades = [
    {'ciudad': 'Buenos Aires','image':'assets/images/cont_moderado.png','nivel': 'Moderado', 'indice': '52'},
    {'ciudad': 'Londres','image':'assets/images/cont_avanzada.png' ,'nivel':'Alto', 'indice': '89'},
    {'ciudad': 'Lima','image':'assets/images/cont_baja.png','nivel':'Bajo', 'indice': '31'},
    {'ciudad': 'Bogotá','image':'assets/images/cont_moderado.png', 'nivel':'Moderado', 'indice': '45'},
    {'ciudad': 'Montevideo','image':'assets/images/cont_baja.png', 'nivel':'Bajo', 'indice': '28'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            text: 'App Clima',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 20,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 95, 182, 233),
      ),
      drawer: DrawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            // Banner principal
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/banner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 36),
            // Nuevo slogan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Consulta el pronóstico del clima para planificar tu semana de la mejor manera. ¡No dejes que el clima te tome por sorpresa!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Theme.of(context).textTheme.bodyLarge?.color,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            // Carrusel del clima semanal
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'El Clima en 7 Días',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 250,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: climaSemanal.length,
                itemBuilder: (context, index) {
                  final diaClima = climaSemanal[index];
                  return Container(
                    width: 160,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[800]
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          diaClima['day']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Image.asset(
                          diaClima['image']!,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          diaClima['weather']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          diaClima['temp']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            // Carrusel de contaminación
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Contaminación en Ciudades',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 250,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contaminacionCiudades.length,
                itemBuilder: (context, index) {
                  final ciudad = contaminacionCiudades[index];
                  return Container(
                    width: 160,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[800]
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ciudad['ciudad']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Image.asset(
                          ciudad['image']!,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          ciudad['nivel']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                        'Índice: ${ciudad['indice']}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black87,
                        ),
                      ),

                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            // Texto final
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Text(
                '¡Por cualquier cosa no dudes en consultarnos! Te contestaremos lo antes posible por nuestro Mail, climas@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
            // Footer
            Container(
              padding: const EdgeInsets.all(16.0),
              color: const Color.fromARGB(255, 95, 182, 233),
              width: double.infinity,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    '¡Gracias por usar nuestra aplicación!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
