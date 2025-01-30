import 'package:flutter/material.dart';
import 'package:flutter_application_base/mocks/weather_icons.dart';
import 'package:flutter_application_base/models/climaActual_model.dart';
import 'package:flutter_application_base/providers/climaActualProvider.dart';
import 'package:flutter_application_base/screens/climactualdetallesScreen.dart';
import 'package:flutter_application_base/widgets/drawer_menu.dart';
import 'package:flutter_application_base/mocks/mocks.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ClimaActualProvider _climaProvider = ClimaActualProvider();
  late Future<Map<String, climaActual>> _climaFuture;

  @override
  void initState() {
    super.initState();
    _climaFuture = _climaProvider.fetchClimaActual();
  }

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
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _climaFuture = _climaProvider.fetchClimaActual();
          });
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
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
              // Slogan
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
                  'El Clima Actual en las ciudades',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 250,
                child: FutureBuilder<Map<String, climaActual>>(
                  future: _climaFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No hay datos disponibles'),
                      );
                    }

                    final climas = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: climas.length,
                      itemBuilder: (context, index) {
                        final ciudad = climas.keys.elementAt(index);
                        final clima = climas[ciudad]!;
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ClimaDetailsScreen(
                                  nombreCiudad: ciudad,
                                  descripcion: clima.data.descripcion,
                                  temperatura: clima.data.temperatura,
                                  tempMinima: clima.data.tempMinima,
                                  tempMaxima: clima.data.tempMaxima,
                                  sensacionTermica: clima.data.sensacionTermica,
                                  humedad: clima.data.humedad,
                                  viento: clima.data.viento,
                                  icono: clima.data.icono,
                                ),
                              ),
                            );
                          },
                          child: Container(
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
                                  ciudad,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Icon(
                                  getWeatherIcon(clima.data.icono),
                                  size: 60,
                                  color: Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  clima.data.descripcion,
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
                                  '${clima.data.temperatura}°C',
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
                          ),
                        );
                      },
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
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
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
      ),
    );
  }
}