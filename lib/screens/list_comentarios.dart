import 'package:flutter/material.dart';

class ListaComentariosScreen extends StatelessWidget {
  static final List<Map<String, String>> comentarios = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            text: 'Lista de Comentarios',
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
      body: comentarios.isEmpty
          ? Center(
              child: Text(
                'Aún no hay comentarios.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            )
          : ListView.builder(
              itemCount: comentarios.length,
              itemBuilder: (context, index) {
                final comentario = comentarios[index];
                final ciudad = comentario['ciudad']!;
                final comentarioTexto = comentario['comentario']!;
                final esPeligrosa = comentario['esPeligrosa'] == 'true'
                    ? 'Peligrosa'
                    : 'No peligrosa';

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ciudad: $ciudad',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          comentarioTexto,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Estado: $esPeligrosa',
                          style: TextStyle(
                            color: esPeligrosa == 'Peligrosa'
                                ? Colors.red
                                : Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
