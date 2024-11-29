import 'package:flutter/material.dart';

class ClimaDetalleCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final String temperature;
  final bool isDarkMode;

  ClimaDetalleCard({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.temperature,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black38,
                offset: Offset(4.0, 4.0),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Image.asset(
          imagePath,
          height: 200,
          width: 200,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[850] : Colors.blueGrey[50],
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: isDarkMode ? Colors.white70 : Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 30),
        AnimatedDefaultTextStyle(
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.orangeAccent : Colors.red,
          ),
          duration: Duration(milliseconds: 300),
          child: Text(
            'Temperatura: $temperature',
          ),
        ),
      ],
    );
  }
}
