import 'package:flutter/material.dart';
import 'package:flutter_application_base/screens/InformacionScreen.dart';
import 'package:lottie/lottie.dart';

class NuestroObjetivoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = colorScheme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? Color.fromARGB(255, 30, 30, 50) : Colors.white,
      appBar: AppBar(
        title: Text(
          'Nuestro Objetivo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? Color.fromARGB(255, 60, 60, 100) : Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Lottie.asset(
              'assets/lottie/animacionPlaneta.json',
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              "Conciencia sobre el Clima y la Contaminación",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Nuestra aplicación te permite conocer el clima y la calidad del aire en ciudades de todo el mundo. Queremos generar conciencia sobre los niveles de contaminación y su impacto en el planeta.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: Text("Volver", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InformacionScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      "Ver más",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


