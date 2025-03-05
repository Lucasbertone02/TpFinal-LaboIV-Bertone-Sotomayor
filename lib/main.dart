import 'package:flutter/material.dart';
import 'package:flutter_application_base/helpers/preferences.dart';
import 'package:flutter_application_base/providers/aireProvider.dart';
import 'package:flutter_application_base/providers/climaciudadesProvider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_application_base/screens/screens.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initShared();
  await dotenv.load();
  runApp(
    MultiProvider(
      providers: [
         ChangeNotifierProvider<AireProvider>(
           create: (_) => AireProvider(),
           lazy: false,
         ),
        ChangeNotifierProvider<Climaciudadesprovider>(
          create: (_) => Climaciudadesprovider(),
          lazy: false, 
        ),
        // Ya no necesitamos el ClimaActualProvider aquí porque ahora usa Future
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      theme: Preferences.darkmode
          ? ThemeData.dark().copyWith(
              textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Rubik'),
            )
          : ThemeData.light().copyWith(
              textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Rubik'),
            ),
routes: {
  'home': (context) => HomeScreen(),
  'custom_list_aire': (BuildContext context) {
    // Función para guardar datos
    void handleComentarioGuardado(String comentario, bool esPeligrosa) {
      print('Comentario guardado: $comentario, Es peligrosa: $esPeligrosa');
    }

    return ListaRegistrosAireScreen(
      ciudad: const {'nombre': 'Nueva York'},
      indiceContaminacion: 75,
      nivelContaminacion: 'Moderada',
      imagenUrl: 'assets/images/medium_aqi.png',
      onComentarioGuardado: handleComentarioGuardado,
    );
  },
  'profile': (context) => ProfileScreen(onThemeChanged: _updateTheme),
  'custom_list_item_aire': (BuildContext context) {
    // Función para guardar datos
    void handleComentarioGuardado(String comentario, bool esPeligrosa) {
      print('Comentario guardado: $comentario, Es peligrosa: $esPeligrosa');
    }

    return VisualizacionRegistroAireScreen(
      ciudad: const {'nombre': 'Nueva York'},
      indiceContaminacion: 75,
      nivelContaminacion: 'Moderada',
      imagenUrl: 'assets/images/medium_aqi.png',
      onComentarioGuardado: handleComentarioGuardado,
    );
  },
  'clima_ciudades': (context) => ClimaCiudadesScreen(),
  'formulario_screen': (context) => const AgregarCiudadScreen(),
  'buscar_clima': (context) => const BuscarClimaScreen(),
  'nuestro_objetivo': (context) => NuestroObjetivoScreen(),

},
);
}

  void _updateTheme() {
    setState(() {}); 
  }

}
