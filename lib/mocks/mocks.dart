
//Mocks utilizados para simular datos de la aplicación

final List<Map<String, String>> climaCiudades = [
  {'city': 'Buenos Aires', 'image': 'assets/images/sol.png', 'temp': '24°C', 'weather': 'Soleado'},
  {'city': 'Lima', 'image': 'assets/images/nublado.png', 'temp': '19°C', 'weather': 'Nublado'},
  {'city': 'Bogotá', 'image': 'assets/images/lluvia.png', 'temp': '15°C', 'weather': 'Lluvia'},
  {'city': 'Montevideo', 'image': 'assets/images/sol_nubes.png', 'temp': '22°C', 'weather': 'Sol con nubes'},
  {'city': 'Londres', 'image': 'assets/images/tormenta.png', 'temp': '10°C', 'weather': 'Tormenta'},
];


final List<Map<String, String>> contaminacionCiudades = [
  {'ciudad': 'Buenos Aires', 'image': 'assets/images/cont_moderado.png', 'nivel': 'Moderado', 'indice': '52'},
  {'ciudad': 'Londres', 'image': 'assets/images/cont_avanzada.png', 'nivel': 'Alto', 'indice': '89'},
  {'ciudad': 'Lima', 'image': 'assets/images/cont_baja.png', 'nivel': 'Bajo', 'indice': '31'},
  {'ciudad': 'Bogotá', 'image': 'assets/images/cont_moderado.png', 'nivel': 'Moderado', 'indice': '45'},
  {'ciudad': 'Montevideo', 'image': 'assets/images/cont_baja.png', 'nivel': 'Bajo', 'indice': '28'},
];

final List<Map<String, String>> ciudades = [
    {'nombre': 'Moscu', 'imagen': 'assets/images/cont_moderado.png', 'indice': '50', 'nivel': 'Moderado'},
    {'nombre': 'Rio de Janeiro', 'imagen': 'assets/images/cont_avanzada.png', 'indice': '120', 'nivel': 'Alto'},
    {'nombre': 'Ciudad de Mexico', 'imagen': 'assets/images/cont_moderado.png', 'indice': '80', 'nivel': 'Moderado'},
    {'nombre': 'Nueva York', 'imagen': 'assets/images/cont_avanzada.png', 'indice': '130', 'nivel': 'Alto'},
    {'nombre': 'Madrid', 'imagen': 'assets/images/cont_baja.png', 'indice': '30', 'nivel': 'Bajo'},
    {'nombre': 'Paris', 'imagen': 'assets/images/cont_avanzada.png', 'indice': '90', 'nivel': 'Alto'},
    {'nombre': 'Londres', 'imagen': 'assets/images/cont_avanzada.png', 'indice': '89', 'nivel': 'Alto'},
    {'nombre': 'Tokyo', 'imagen': 'assets/images/cont_avanzada.png', 'indice': '110', 'nivel': 'Alto'},
    {'nombre': 'Los Angeles', 'imagen': 'assets/images/cont_moderado.png', 'indice': '75', 'nivel': 'Moderado'},
    {'nombre': 'Berlin', 'imagen': 'assets/images/cont_baja.png', 'indice': '40', 'nivel': 'Bajo'},
    {'nombre': 'Buenos Aires','imagen':'assets/images/cont_moderado.png','nivel': 'Moderado', 'indice': '52'},
    {'nombre': 'Lima','imagen':'assets/images/cont_baja.png','nivel':'Bajo', 'indice': '31'},
    {'nombre': 'Bogotá','imagen':'assets/images/cont_moderado.png', 'nivel':'Moderado', 'indice': '45'},
    {'nombre': 'Montevideo','imagen':'assets/images/cont_baja.png', 'nivel':'Bajo', 'indice': '28'},
    {'nombre': 'Caracas','imagen':'assets/images/cont_avanzada.png', 'nivel':'Alto', 'indice': '132'},
  ];

  // Listado de ciudades que deseas consultar
  List<String> ciudadesProvider = ['Bahia Blanca', 'Buenos Aires', 'Montevideo', 'Lima', 'Bogota'];