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
        centerTitle: true,
        title: const Text('Profile Screen'),
        elevation: 10,
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
      height: size.height * 0.40,
      color: const Color(0xff2d3e4f),
      child: Center(
        child: CircleAvatar(
          radius: 100,
          child: Image.asset('assets/images/avatar.png'),
        ),
      ),
    );
  }
}
