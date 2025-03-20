import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InformacionScreen extends StatelessWidget {
  final List<Map<String, String>> pages = [
   {
      "title": "¿Qué es el Clima?",
      "content":
          "El clima es el conjunto de condiciones atmosféricas promedio en un lugar durante un período de tiempo prolongado. Incluye factores como la temperatura, la humedad, la precipitación y el viento.",
      "animation": "assets/lottie/animacionClima.json"
    },
    {
      "title": "El Clima en Nuestra Vida",
      "content":
          "El clima afecta todo en nuestra vida diaria: desde la ropa que usamos hasta la agricultura, el transporte y la economía. También influye en el bienestar de los ecosistemas y la biodiversidad.",
      "animation": "assets/lottie/animacionClimaDia.json"
    },
    {
      "title": "¿Qué es la Contaminación?",
      "content":
          "La contaminación es la introducción de sustancias o energía en el medio ambiente que causan efectos negativos en los ecosistemas y en la salud de los seres vivos.",
      "animation": "assets/lottie/animacionContaminacion.json"
    },
    {
      "title": "Impacto de la Contaminación",
      "content":
          "La contaminación afecta el clima al aumentar los gases de efecto invernadero, lo que provoca cambios en los patrones de temperatura y fenómenos climáticos extremos.",
      "animation": "assets/lottie/animacionFabrica.json"
    },
    {
      "title": "El Calentamiento Global",
      "content":
          "El calentamiento global es el aumento sostenido de la temperatura media del planeta debido a la acumulación de gases como el CO₂. Sus consecuencias incluyen deshielo, aumento del nivel del mar y cambios en los ecosistemas.",
      "animation": "assets/lottie/animacionCalentamientoGlobal.json"
    },
    {
      "title": "Reflexión Final",
      "content":
          "Cuidar el planeta es una responsabilidad de todos. Pequeñas acciones como reciclar, usar transporte sostenible y reducir el consumo de energía pueden marcar la diferencia para un futuro mejor.",
      "animation": "assets/lottie/animacionReflexion.json"
    }
  ];
  

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = colorScheme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Informacion Ambiental',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? Color.fromARGB(255, 60, 60, 100) : Colors.blue,
      ),
      body: PageView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return Container(
            color: isDarkMode ? Color.fromARGB(255, 30, 30, 50) : Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  pages[index]["animation"]!,
                  height: 200,
                ),
                SizedBox(height: 20),
                Text(
                  pages[index]["title"]!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  pages[index]["content"]!,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                if (index != pages.length - 1) // No mostrar la flecha en la última pantalla
                  Align(
                    alignment: Alignment.centerRight,
                    child: Lottie.asset(
                      "assets/lottie/animacionFlecha.json",
                      height: 50,
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