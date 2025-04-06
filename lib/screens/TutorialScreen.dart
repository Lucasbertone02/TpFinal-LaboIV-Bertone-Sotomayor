import 'package:flutter/material.dart';
import 'package:flutter_application_base/screens/home_screen.dart'; 

class TutorialScreen extends StatelessWidget {
  // Lista de textos que describen cada paso del tutorial.
  final List<String> tutorialTexts = [
    "En el inicio de nuestra aplicación encontrarás información y datos sobre algunas de las ciudades más importantes del mundo.",
    "En nuestra función llamada 'Buscar Clima' podrás buscar la ciudad que quieras y saber cuál es su temperatura actual.",
    "En la lista de contaminación del aire encontrarás ciudades elegidas por nosotros para ver su estado de aire actualmente. En cada una tendrás la opción de completar un formulario si deseas.",
    "En la lista de clima podrás encontrar ciudades elegidas por nosotros en las que podrás ver su temperatura actual. En cada una podrás ver más datos.",
    "En el formulario de agregar ciudad podrás realizar un formulario para decirnos qué ciudad te gustaría que agreguemos en la lista. Nosotros la veremos y nos decidiremos por si hacerlo o no.",
    "En nuestro objetivo encontrarás datos e información sobre el clima y la contaminación para concientizar y cuidar más nuestro planeta.",
    "Por último, en los ajustes podrás elegir si usar la aplicación en modo oscuro o claro.",
    "Esperamos que disfrutes nuestra aplicación. ¡Gracias por llegar hasta aquí! Ahora para volver al principio aprieta este botón.",
  ];

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = colorScheme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.white,
      
      // PageView para desplazarse verticalmente entre los pasos del tutorial.
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: tutorialTexts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Paso ${index + 1}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white : Colors.black),
                  ),
                ),
                const SizedBox(height: 20),

                Text(
                  tutorialTexts[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: isDarkMode ? Colors.white : Colors.black),
                ),

                // Flecha hacia abajo en los pasos intermedios.
                if (index != tutorialTexts.length - 1)
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Icon(Icons.arrow_downward, size: 40, color: Colors.blueAccent),
                  ),

                // Botón para volver al inicio en el último paso.
                if (index == tutorialTexts.length - 1)
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
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
                        'Volver al Inicio',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}