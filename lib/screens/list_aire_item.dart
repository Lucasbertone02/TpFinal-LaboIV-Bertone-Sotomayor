import 'package:flutter/material.dart';


//Pantalla para visualizar y registrar detalles sobre la contaminación del aire en una ciudad
class VisualizacionRegistroAireScreen extends StatefulWidget {
  final Map<String, String> ciudad; 
  final Function(String, bool) onComentarioGuardado; 
  final int indiceContaminacion; 
  final String nivelContaminacion; 
  final String imagenUrl; 

  VisualizacionRegistroAireScreen({
    required this.ciudad,
    required this.onComentarioGuardado,
    required this.indiceContaminacion,
    required this.nivelContaminacion,
    required this.imagenUrl,
  });

  @override
  _VisualizacionRegistroScreenState createState() =>
      _VisualizacionRegistroScreenState();
}

class _VisualizacionRegistroScreenState
    extends State<VisualizacionRegistroAireScreen> {
  bool _isContaminado = false; // Estado para indicar si la contaminación es peligrosa
  final _controller = TextEditingController(); // Controlador para manejar el texto del campo de comentarios

  @override
  Widget build(BuildContext context) {
    final ciudad = widget.ciudad; // Referencia a los datos de la ciudad
    final indiceContaminacion = widget.indiceContaminacion;
    final nivelContaminacion = widget.nivelContaminacion;
    final imagenUrl = widget.imagenUrl;

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
              'Índice de contaminación: $indiceContaminacion',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Nivel de contaminación: $nivelContaminacion',
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
                      _isContaminado = value; // Actualiza el estado del switch
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
              child: Image.asset(imagenUrl, height: 200), 
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final comentario = _controller.text; // Obtiene el texto del campo
                if (comentario.isNotEmpty) {
                  // Llama al callback para guardar el comentario y el estado del switch
                  widget.onComentarioGuardado(comentario, _isContaminado);
                  _controller.clear(); // Limpia el campo de texto
                  setState(() {
                    _isContaminado = false; // Resetea el switch
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
