import 'package:flutter/material.dart';

class VisualizacionRegistroAireScreen extends StatefulWidget {
  final Map<String, String> ciudad;

  VisualizacionRegistroAireScreen({required this.ciudad});

  @override
  _VisualizacionRegistroScreenState createState() =>
      _VisualizacionRegistroScreenState();
}

class _VisualizacionRegistroScreenState
    extends State<VisualizacionRegistroAireScreen> {
  bool _isContaminado = false;

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ciudad = widget.ciudad;
    return Scaffold(
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            text: 'Detalles por ciudad',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 20,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 95, 182, 233),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Índice de contaminación: ${ciudad['indice']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Switch para contaminación
            Row(
              children: [
                Text('¿Es peligroso?'),
                Switch(
                  value: _isContaminado,
                  onChanged: (value) {
                    setState(() {
                      _isContaminado = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            // Campo de texto para comentarios
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Comentario sobre la ciudad',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Imagen principal
           Center(
              child: Image.asset('assets/images/list_item.png', height: 200),
            ),
           SizedBox(height: 20),
            // Botón de acción
            ElevatedButton(
              onPressed: () {
                // Acción que se debe tomar con el comentario
                // Aquí puedes guardar o mostrar el comentario
              },
              child: Text('Guardar Comentario'),
            ),
          ],
        ),
      ),
    );
  }
}
