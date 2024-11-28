import 'package:flutter/material.dart';

class VisualizacionRegistroAireScreen extends StatefulWidget {
  final Map<String, String> ciudad;
  final Function(String, bool) onComentarioGuardado;

  VisualizacionRegistroAireScreen({
    required this.ciudad,
    required this.onComentarioGuardado,
  });

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
              'Ciudad: ${ciudad['nombre']}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Índice de contaminación: ${ciudad['indice']}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('¿Es peligroso?'),
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
            const SizedBox(height: 20),
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Comentario sobre la ciudad',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Image.asset('assets/images/list_item.png', height: 200),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final comentario = _controller.text;
                if (comentario.isNotEmpty) {
                  // Llamar a la función de callback con el comentario y el estado de peligrosidad
                  widget.onComentarioGuardado(comentario, _isContaminado);
                  _controller.clear(); // Limpiar el campo
                  setState(() {
                    _isContaminado = false; // Limpiar el switch
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Comentario Guardado')),
                  );
                }
              },
              child: const Text('Guardar Comentario'),
            ),
          ],
        ),
      ),
    );
  }
}
