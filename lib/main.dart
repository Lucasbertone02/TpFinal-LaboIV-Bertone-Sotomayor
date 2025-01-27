import 'package:flutter/material.dart';
import 'package:flutter_application_base/helpers/preferences.dart';
import 'package:flutter_application_base/providers/aireProvider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_application_base/screens/AgregarCiudadScreen.dart';
import 'package:flutter_application_base/screens/climaCiudadesScreen.dart';
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
                'custom_list_aire': (context) => ListaRegistrosAireScreen(),
                'profile': (context) => ProfileScreen(onThemeChanged: _updateTheme),
                'custom_list_item_aire': (context) => VisualizacionRegistroAireScreen(
                      ciudad: const {},
                      onComentarioGuardado: (comentario, esPeligrosa) {
                print('Comentario guardado desde la ruta inicial: $comentario, es peligrosa: $esPeligrosa');
              },
              ),
              'clima_ciudades': (context) => ClimaCiudadesScreen(),
              'list_comentarios': (context) => ListaComentariosScreen(),
              'formulario_screen': (context) => AgregarCiudadScreen(), // Nueva ruta
      },
    );
  }

  void _updateTheme() {
    setState(() {}); // Actualiza la interfaz al cambiar el tema.
  }
}
