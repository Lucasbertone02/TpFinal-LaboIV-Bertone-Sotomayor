import 'package:flutter/material.dart';
import 'package:flutter_application_base/providers/aireProvider.dart';
import 'package:flutter_application_base/screens/screens.dart';
import 'package:flutter_application_base/widgets/card.dart';
import 'package:provider/provider.dart';

class ListaRegistrosAireScreen extends StatelessWidget {

 //atributos para recibir datos sobre el aire
 final Map<String, String> ciudad;
  final int indiceContaminacion;
  final String nivelContaminacion;
  final String imagenUrl;
  final Function(String, bool) onComentarioGuardado;

  const ListaRegistrosAireScreen({ 
    super.key,
    required this.ciudad,
    required this.indiceContaminacion,
    required this.nivelContaminacion,
    required this.imagenUrl,
    required this.onComentarioGuardado,
  });

  static List<Map<String, dynamic>> ciudades = [
  {'nombre': 'Nueva York', 'lat': 40.7128, 'lon': -74.0060},
  {'nombre': 'Londres', 'lat': 51.5074, 'lon': -0.1278},
  {'nombre': 'París', 'lat': 48.8566, 'lon': 2.3522},
  {'nombre': 'Tokio', 'lat': 35.6895, 'lon': 139.6917},
  {'nombre': 'Los Ángeles', 'lat': 34.0522, 'lon': -118.2437},
  {'nombre': 'Roma', 'lat': 41.9028, 'lon': 12.4964},
  {'nombre': 'Sídney', 'lat': -33.8688, 'lon': 151.2093},
  {'nombre': 'Madrid', 'lat': 40.4168, 'lon': -3.7038},
  {'nombre': 'Ámsterdam', 'lat': 52.3676, 'lon': 4.9041},
  {'nombre': 'Buenos Aires', 'lat': -34.6037, 'lon': -58.3816},
  {'nombre': 'Berlín', 'lat': 52.5200, 'lon': 13.4050},
  {'nombre': 'Moscú', 'lat': 55.7558, 'lon': 37.6173},
  {'nombre': 'Ciudad de México', 'lat': 19.4326, 'lon': -99.1332},
  {'nombre': 'Barcelona', 'lat': 41.3784, 'lon': 2.1915},
  {'nombre': 'Dubai', 'lat': 25.276987, 'lon': 55.296249},
  {'nombre': 'Seúl', 'lat': 37.5665, 'lon': 126.9780},
  {'nombre': 'Estambul', 'lat': 41.0082, 'lon': 28.9784},
  {'nombre': 'Chicago', 'lat': 41.8781, 'lon': -87.6298},
  {'nombre': 'Singapur', 'lat': 1.3521, 'lon': 103.8198},
  {'nombre': 'Kuala Lumpur', 'lat': 3.1390, 'lon': 101.6869},
  {'nombre': 'Hong Kong', 'lat': 22.3193, 'lon': 114.1694},
  {'nombre': 'Lagos', 'lat': 6.5244, 'lon': 3.3792},
  {'nombre': 'Lima', 'lat': -12.0464, 'lon': -77.0428},
  {'nombre': 'Cairo', 'lat': 30.0444, 'lon': 31.2357},
  {'nombre': 'Bangkok', 'lat': 13.7563, 'lon': 100.5018},
  {'nombre': 'São Paulo', 'lat': -23.5505, 'lon': -46.6333},
  {'nombre': 'Toronto', 'lat': 43.65107, 'lon': -79.347015},
  {'nombre': 'Río de Janeiro', 'lat': -22.9068, 'lon': -43.1729},
  {'nombre': 'Copenhague', 'lat': 55.6761, 'lon': 12.5683},
  {'nombre': 'Ciudad del Cabo', 'lat': -33.9249, 'lon': 18.4241},
  {'nombre': 'Montreal', 'lat': 45.5017, 'lon': -73.5673},
  {'nombre': 'Melbourne', 'lat': -37.8136, 'lon': 144.9631},
  {'nombre': 'Delhi', 'lat': 28.6139, 'lon': 77.2090},
  {'nombre': 'Yakarta', 'lat': -6.2088, 'lon': 106.8456},
  {'nombre': 'Santiago', 'lat': -33.4489, 'lon': -70.6693},
  {'nombre': 'Washington DC', 'lat': 38.9072, 'lon': -77.0369},
  {'nombre': 'San Francisco', 'lat': 37.7749, 'lon': -122.4194},
  {'nombre': 'Milan', 'lat': 45.4654, 'lon': 9.1859},
  {'nombre': 'Viena', 'lat': 48.2082, 'lon': 16.3738},
  {'nombre': 'Beijing', 'lat': 39.9042, 'lon': 116.4074}
];

// metodo para obtener el nivel de contaminación según el índice aqi
  String obtenerNivelContaminacion(int aqi) {
    switch (aqi) {
      case 1:
        return 'Bajo';
      case 2:
        return 'Justa';
      case 3:
        return 'Moderado';
      case 4:
        return 'Alto';
      case 5:
        return 'Muy alto';
      default:
        return 'Desconocido';
    }
  }
// metodo para obtener la imagen correspondiente al aqi
  String obtenerImagenAqi(int aqi) {
    switch (aqi) {
      case 1:
        return 'assets/images/cont_baja.png';
      case 2:
        return 'assets/images/cont_justa.png';
      case 3:
        return 'assets/images/cont_moderado.png';
      case 4:
        return 'assets/images/cont_alta.png';
      case 5:
        return 'assets/images/cont_avanzada.png';
      default:
        return 'assets/images/no_encontrado.png';
    }
  }

  @override

  Widget build(BuildContext context) {
    // obtiene el provider que maneja los datos de contaminación del aire
    final aireProvider = Provider.of<AireProvider>(context);

     final ColorScheme colorScheme = Theme.of(context).colorScheme;
     final bool isDarkMode = colorScheme.brightness == Brightness.dark;
     return Scaffold(
      backgroundColor: isDarkMode ? const Color.fromARGB(255, 30, 30, 50) : Colors.white,
      appBar: AppBar(
        title: Text(
          'Lista de Contaminación del Aire',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.blue,
      ),
      // carga los datos de contaminación de las ciudades
      body: FutureBuilder<Map<String, int>>(
        future: aireProvider.cargarDatosCiudades(ciudades),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay datos disponibles'));
          } else {
            final datosCiudades = snapshot.data!;

            return ListView.builder(
              itemCount: datosCiudades.length,
              itemBuilder: (context, index) {
                final ciudad = datosCiudades.keys.toList()[index];
                final aqi = datosCiudades[ciudad]!;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VisualizacionRegistroAireScreen(
                          ciudad: {'nombre': ciudad}, // Mostrar el nombre de la ciudad
                          indiceContaminacion: aqi, // aqi de la ciudad
                          nivelContaminacion: obtenerNivelContaminacion(aqi), // Nivel basado con el aqi
                          imagenUrl: obtenerImagenAqi(aqi), // Imagen según el aqi
                          onComentarioGuardado: (comentario, esPeligrosa) {
                          print('Comentario guardado: $comentario');
                          },
                        ),
                      ),
                    );
                  },
                  child: RegistroContaminacionCard(
                    ciudad: ciudad, 
                    indiceContaminacion: aqi.toString(),
                    nivelContaminacion: obtenerNivelContaminacion(aqi),
                    imagenUrl: obtenerImagenAqi(aqi),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
