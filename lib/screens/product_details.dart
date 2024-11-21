import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  ProductDetailScreen({
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            text: 'Detalles del Producto',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Texto en negrita
              fontSize: 20,               // Tamaño de la fuente
              color: Colors.white,        // Color del texto
            ),
          ),
        ),
        elevation: 20,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 14, 137, 97), // Color de fondo (#0e8961),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            // Imagen con borde redondeado y sombra
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), // Radio de los bordes
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                    offset: const Offset(0, 5), // Desplazamiento de la sombra
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0), // Aplicar radio a la imagen
                child: SizedBox(
                  height: 350, // Tamaño de la imagen aumentado
                  child: Image.asset(image, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '\$ $price',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Este, como todos, es un gran producto que te encantará. Es cómodo, de alta calidad y perfecto para ti.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 32), // Espacio entre la descripción y el mensaje de contacto

            // Contenedor con el mensaje de contacto
            
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: const Text(
                '¡Por cualquier cosa no dudes en consultarnos! Te contestaremos lo antes posible por WhatsApp al número 2917874523',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Footer
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(16.0),
              color: Color.fromARGB(255, 14, 137, 97), // Mismo color que el AppBar
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Nos podés encontrar en: Calle Brown 354, Bahía Blanca',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '¡Gracias por usar nuestra aplicación!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
