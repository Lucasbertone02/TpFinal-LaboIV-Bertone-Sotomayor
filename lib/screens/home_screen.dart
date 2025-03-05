import 'package:flutter/material.dart';
import 'package:flutter_application_base/mocks/weather_icons.dart';
import 'package:flutter_application_base/models/climaActual_model.dart';
import 'package:flutter_application_base/providers/climaActualProvider.dart';
import 'package:flutter_application_base/screens/climactualdetallesScreen.dart';
import 'package:flutter_application_base/providers/aireProvider.dart';
import 'package:flutter_application_base/widgets/drawer_menu.dart';
import 'package:provider/provider.dart';

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
    final aireProvider = Provider.of<AireProvider>(context);

    // Lista de ciudades con sus latitudes y longitudes para realizar la solicitud
    final ciudades = [
      {'nombre': 'Buenos Aires', 'lat': -34.6037, 'lon': -58.3816},
      {'nombre': 'New York', 'lat': 40.7128, 'lon': -74.0060},
      {'nombre': 'London', 'lat': 51.5074, 'lon': -0.1278},
      {'nombre': 'Barcelona', 'lat': 41.3784, 'lon': 2.1915},
      {'nombre': 'Tokyo', 'lat': 35.6895, 'lon': 139.6917},
    ];

     final ColorScheme colorScheme = Theme.of(context).colorScheme;
     final bool isDarkMode = colorScheme.brightness == Brightness.dark;
     return Scaffold(
      backgroundColor: isDarkMode ? Color.fromARGB(255, 30, 30, 50) : Colors.white,
      appBar: AppBar(
        title: Text(
          'App Clima',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? Color.fromARGB(255, 60, 60, 100) : Colors.blue,
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
                    color: isDarkMode ? Colors.white : Colors.black87,
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
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8), // Correcto
                  Icon(
                    getWeatherIcon(clima.data.icono),
                    size: 60,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  const SizedBox(height: 8), // Correcto
                  Text(
                    clima.data.descripcion,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8), // Correcto
                  Text(
                    '${clima.data.temperatura}°C',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode ? Colors.white : Colors.black87,

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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Contaminación en Ciudades',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            FutureBuilder<Map<String, int>>(
              future: aireProvider.cargarDatosCiudades(ciudades),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error al cargar los datos.'));
                }

                final datosCiudades = snapshot.data ?? {};

                return Container(
                  height: 250,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: datosCiudades.length,
                    itemBuilder: (context, index) {
                      final ciudad = datosCiudades.keys.elementAt(index);
                      final aqi = datosCiudades[ciudad] ?? 0;

                     // determinar imagen según el aqi
                      String imageAsset;
                      switch (aqi) {
                        case 1:
                          imageAsset = 'assets/images/cont_baja.png';
                          break;
                        case 2:
                          imageAsset = 'assets/images/cont_justa.png';
                          break;
                        case 3:
                          imageAsset = 'assets/images/cont_moderado.png';
                          break;
                        case 4:
                          imageAsset = 'assets/images/cont_alta.png';
                          break;
                        case 5:
                          imageAsset = 'assets/images/cont_avanzada.png';
                          break;
                        default:
                          imageAsset = 'assets/images/no_encontrado.png';
                      }

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
                              ciudad,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Image.asset(
                              imageAsset,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Índice de contaminacion: $aqi',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: isDarkMode ? Colors.white : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            // Texto final
            
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
                    color:  Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              // Footer
              Container(
                padding: const EdgeInsets.all(16.0),
                color: isDarkMode ? Color.fromARGB(255, 60, 60, 100) : Colors.blue,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      '¡Gracias por usar nuestra aplicación!',
                      style: TextStyle(
                        fontSize: 16,
                        color: isDarkMode ? Colors.white : Colors.black87,
                        
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