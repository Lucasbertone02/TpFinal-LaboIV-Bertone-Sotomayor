import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_base/screens/product_details.dart';
import 'package:flutter_application_base/widgets/drawer_menu.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> camisetas = [
    {'name': 'Argentina Negra', 'image': 'assets/images/argentina_negra.jpg', 'price': '50'},
    {'name': 'Brasil Retro 2006', 'image': 'assets/images/brasil_06.jpg', 'price': '55'},
    {'name': 'Inter Retro 2008', 'image': 'assets/images/inter_08.jpg', 'price': '60'},
  ];

  final List<Map<String, String>> shorts = [
    {'name': 'Argentina 2024', 'image': 'assets/images/short_arg_blanco.jpg', 'price': '40'},
    {'name': 'Argentina 1994', 'image': 'assets/images/short_arg94.jpg', 'price': '45'},
    {'name': 'Juventus Short', 'image': 'assets/images/short_juventus.jpg', 'price': '50'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text.rich(
          TextSpan(
            text: 'Bahía Camisetas⚽',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Texto en negrita
              fontSize: 25,               // Tamaño de la fuente
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            // Banner principal (solo la imagen, ocupa todo el ancho)
            Container(
              width: double.infinity,  // Asegura que ocupe todo el ancho de la pantalla
              height: 250,             // Ajusta la altura del banner a lo que desees
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/banner.jpg'), // Ruta de tu imagen
                  fit: BoxFit.cover, // La imagen cubre todo el contenedor
                ),
              ),
            ),
            const SizedBox(height: 36),
            // Slogan o texto introductorio
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'En Bahía Camietas tenemos los mejores conjuntos de la ciudad. Encontra las camisetas y shorts que se ajustan a tu estilo y personalidad. ¡Tenemos todo lo que buscas!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),

            // Carrusel de camisetas envuelto en un Container
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Camisetas Destacadas..',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 340, // Altura del contenedor para el carrusel
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Espaciado alrededor
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), // Bordes redondeados
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: camisetas.length,
                itemBuilder: (context, index) {
                  final camiseta = camisetas[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            name: camiseta['name']!,
                            image: camiseta['image']!,
                            price: camiseta['price']!,
                          ),
                        ),
                      );
                    },
                    child: ProductCard(
                      name: camiseta['name']!,
                      image: camiseta['image']!,
                      price: camiseta['price']!,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Carrusel de shorts envuelto en un Container
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Shorts Destacados..',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 340, // Altura del contenedor para el carrusel de shorts
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Espaciado alrededor
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), // Bordes redondeados
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: shorts.length,
                itemBuilder: (context, index) {
                  final short = shorts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            name: short['name']!,
                            image: short['image']!,
                            price: short['price']!,
                          ),
                        ),
                      );
                    },
                    child: ProductCard(
                      name: short['name']!,
                      image: short['image']!,
                      price: short['price']!,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32), // Espacio entre carrusel y contenedor de contacto
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
            const SizedBox(height: 50),
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

class ProductCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  ProductCard({required this.name, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 195,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          // Ajuste de la posición del precio
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0), // Espacio superior para mover el precio hacia arriba
            child: Text(
              '\$ $price',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}