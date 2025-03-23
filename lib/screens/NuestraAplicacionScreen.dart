import 'package:flutter/material.dart';
import 'package:flutter_application_base/screens/TutorialScreen.dart';

class NuestraAplicacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = colorScheme.brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDarkMode ? const Color.fromARGB(255, 30, 30, 50) : Colors.white,
      appBar: AppBar(
        title: Text(
          'Nuestra Aplicación',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: isDarkMode ? Colors.white : Colors.black, 
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.blue,
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Image.asset(
              'assets/images/Pasos.png',  
              height: 200,  
              width: 200,   
              fit: BoxFit.cover, 
            ),
            const SizedBox(height: 20),
          
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '¿Quieres ver qué puedes hacer en nuestra aplicación y cómo hacerlo? ¡Aprieta acá!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20), 

            // Botón para navegar a la pantalla de tutorial.
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TutorialScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), 
                ),
                backgroundColor: Colors.blueAccent, 
              ),
              child: const Text(
                'Ir al Tutorial',
                style: TextStyle(fontSize: 16, color: Colors.black), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}