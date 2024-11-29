import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final List<Map<String, String>> _menuItems = <Map<String, String>>[
    {'route': 'home', 'title': 'Home', 'subtitle': 'By Bertone-Sotomayor'},
    {'route': 'custom_list_aire', 'title': 'Lista Contaminacion Aire', 'subtitle': 'By Sotomayor'},
    {'route': 'list_comentarios', 'title': 'Lista de Comentarios', 'subtitle': 'By Sotomayor'},
    {'route': 'profile', 'title': 'Perfil usuario', 'subtitle': 'By Bertone-Sotomayor'},
  ];

  DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeaderWithImage(), // Cambié el header a una versión con imagen
          ...ListTile.divideTiles(
            context: context,
            tiles: _menuItems
                .map((item) => ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      dense: true,
                      minLeadingWidth: 25,
                      iconColor: Colors.blueGrey,
                      title: Text(item['title']!,
                          style: const TextStyle(fontFamily: 'FuzzyBubbles')),
                      subtitle: Text(item['subtitle'] ?? '',
                          style: const TextStyle(
                              fontFamily: 'RobotoMono', fontSize: 11)),
                      leading: const Icon(Icons.arrow_right),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, item['route']!);
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _DrawerHeaderWithImage extends StatelessWidget {
  const _DrawerHeaderWithImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/drawer_baner.jpg'), 
            fit: BoxFit.cover, 
          ),
        ),
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: const Text(
          '[  Menu  ]',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
