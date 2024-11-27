import 'package:flutter/material.dart';
import 'package:flutter_application_base/helpers/preferences.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback onThemeChanged; // Callback para notificar cambios de tema

  const ProfileScreen({
    super.key,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            text: 'Profile Screen',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Texto en negrita
              fontSize: 25,               // Tamaño de la fuente
              color: Colors.white,        // Color del texto
            ),
          ),
        ),
        elevation: 20,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 95, 182, 233), // Color de fondo (#0e8961),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderProfile(size: size),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SwitchListTile.adaptive(
                title: const Text('Dark Mode'),
                value: Preferences.darkmode,
                onChanged: (bool value) {
                  Preferences.darkmode = value;
                  onThemeChanged(); // Notificar a la app que el tema cambió
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.30,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/cielo.jpg'), // Ruta de tu imagen
          fit: BoxFit.cover, // Ajusta la imagen para cubrir todo el contenedor
        ),
      ),
      child: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundColor: Colors.transparent, // Fondo transparente para el avatar
          child: ClipOval(
            child: SizedBox(
              width: 170,
              height: 170, 
            child: Image.asset(
              'assets/avatars/avatar6.png', // Imagen del avatar
              fit: BoxFit.cover,
            ),
          ),
          ),
        ),
      ),
    );
  }
}
