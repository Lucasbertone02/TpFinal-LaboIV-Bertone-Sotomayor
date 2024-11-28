import 'package:flutter/material.dart';
import 'package:flutter_application_base/helpers/preferences.dart';
import 'package:flutter_application_base/screens/climaCiudadesScreen.dart';
import 'package:flutter_application_base/screens/screens.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initShared();
  runApp(const MyApp());
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
          'custom_list_aire': (context) => ListaRegistrosAireScreen(),
          'profile': (context) => ProfileScreen(onThemeChanged: _updateTheme),
          'custom_list_item_aire': (context) => VisualizacionRegistroAireScreen(
          ciudad: const {},
        onComentarioGuardado: (comentario, esPeligrosa) {
          print('Comentario guardado desde la ruta inicial: $comentario, es peligrosa: $esPeligrosa');
        },
      ),
      'clima_ciudades': (context) => ClimaCiudadesScreen(), // Ruta de HEAD
      'list_comentarios': (context) => ListaComentariosScreen(), // Ruta de branch-sotomayor
},

    );
  }

  void _updateTheme() {
    setState(() {}); 
  }
}
