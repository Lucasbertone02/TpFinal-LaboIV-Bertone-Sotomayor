final List<Map<String, String>> climaSemanal = [
  {'day': 'Lunes', 'image': 'assets/images/sol.png', 'weather': 'Soleado', 'temp': '22°C / 15°C'},
  {'day': 'Martes', 'image': 'assets/images/nublado.png', 'weather': 'Nublado', 'temp': '20°C / 14°C'},
  {'day': 'Miércoles', 'image': 'assets/images/lluvia.png', 'weather': 'Lluvioso', 'temp': '18°C / 13°C'},
  {'day': 'Jueves', 'image': 'assets/images/tormenta.png', 'weather': 'Tormenta', 'temp': '17°C / 12°C'},
  {'day': 'Viernes', 'image': 'assets/images/sol_nubes.png', 'weather': 'Soleado/Nublado', 'temp': '21°C / 14°C'},
  {'day': 'Sábado', 'image': 'assets/images/sol.png', 'weather': 'Soleado', 'temp': '25°C / 16°C'},
  {'day': 'Domingo', 'image': 'assets/images/nublado.png', 'weather': 'Nublado', 'temp': '19°C / 13°C'},
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
    {'nombre': 'Paris', 'imagen': 'assets/images/cont_moderado.png', 'indice': '90', 'nivel': 'Alto'},
    {'nombre': 'Londres', 'imagen': 'assets/images/cont_moderado.png', 'indice': '89', 'nivel': 'Alto'},
    {'nombre': 'Tokyo', 'imagen': 'assets/images/cont_avanzada.png', 'indice': '110', 'nivel': 'Alto'},
    {'nombre': 'Los Angeles', 'imagen': 'assets/images/cont_moderado.png', 'indice': '75', 'nivel': 'Moderado'},
    {'nombre': 'Berlin', 'imagen': 'assets/images/cont_baja.png', 'indice': '40', 'nivel': 'Bajo'},
    {'nombre': 'Buenos Aires','imagen':'assets/images/cont_moderado.png','nivel': 'Moderado', 'indice': '52'},
    {'nombre': 'Lima','imagen':'assets/images/cont_baja.png','nivel':'Bajo', 'indice': '31'},
    {'nombre': 'Bogotá','imagen':'assets/images/cont_moderado.png', 'nivel':'Moderado', 'indice': '45'},
    {'nombre': 'Montevideo','imagen':'assets/images/cont_baja.png', 'nivel':'Bajo', 'indice': '28'},
    {'nombre': 'Caracas','imagen':'assets/images/cont_avanzada.png', 'nivel':'Alto', 'indice': '132'},
  ];

final List<Map<String, dynamic>> ciudadesClima = [
    {
      'ciudad': 'Buenos Aires',
      'clima': [
        {
          'day': 'Lunes', 
          'image': 'assets/images/sol.png', 
          'weather': 'Soleado', 
          'temp': '22°C / 15°C',
          'descripcion': 'Día luminoso y cálido con cielo despejado. Temperaturas entre 15°C y 22°C permiten disfrutar de actividades al aire libre. Perfecto para pasear, hacer ejercicio o simplemente relajarse bajo el sol.'
        },
        {
          'day': 'Martes', 
          'image': 'assets/images/nublado.png', 
          'weather': 'Nublado', 
          'temp': '20°C / 14°C',
          'descripcion': 'Jornada gris con cielo cubierto de nubes. Temperaturas moderadas entre 14°C y 20°C sugieren un día tranquilo. Ideal para actividades interiores o para usar una chaqueta ligera si sales.'
        },
        {
          'day': 'Miércoles', 
          'image': 'assets/images/lluvia.png', 
          'weather': 'Lluvioso', 
          'temp': '18°C / 13°C',
          'descripcion': 'Día lluvioso con precipitaciones constantes. Temperaturas descendiendo entre 13°C y 18°C. Necesario llevar paraguas, impermeable y ropa abrigada. Perfecta jornada para quedarse en casa o disfrutar de una bebida caliente.'
        },
        {
          'day': 'Jueves', 
          'image': 'assets/images/tormenta.png', 
          'weather': 'Tormenta', 
          'temp': '17°C / 12°C',
          'descripcion': 'Día de tormenta intensa con posibles rayos y fuertes lluvias. Temperaturas bajando a rango de 12°C a 17°C. Se recomienda permanecer en interiores, alejarse de ventanas y tomar precauciones de seguridad.'
        },
        {
          'day': 'Viernes', 
          'image': 'assets/images/sol_nubes.png', 
          'weather': 'Soleado/Nublado', 
          'temp': '21°C / 14°C',
          'descripcion': 'Día variable con alternancia entre sol y nubes. Temperaturas entre 14°C y 21°C ofrecen un clima agradable. Recomendable llevar una chaqueta ligera para los momentos más frescos.'
        },
        {
          'day': 'Sábado', 
          'image': 'assets/images/sol.png', 
          'weather': 'Soleado', 
          'temp': '25°C / 16°C',
          'descripcion': 'Día espléndido y soleado con temperaturas cálidas entre 16°C y 25°C. Perfecto para salidas al aire libre, picnics, deportes o simplemente disfrutar del día. Recordar usar protector solar.'
        },
        {
          'day': 'Domingo', 
          'image': 'assets/images/nublado.png', 
          'weather': 'Nublado', 
          'temp': '19°C / 13°C',
          'descripcion': 'Último día de la semana con cielo cubierto de nubes. Temperaturas entre 13°C y 19°C invitan a un día tranquilo. Bueno para planes relajados o actividades que no dependan del sol.'
        },
      ]
    },
    {
      'ciudad': 'Londres',
      'clima': [
        {
          'day': 'Lunes', 
          'image': 'assets/images/lluvia.png', 
          'weather': 'Lluvioso', 
          'temp': '8°C / 4°C',
          'descripcion': 'Día frío y lluvioso típico de Londres. Temperaturas entre 4°C y 8°C requieren abrigo grueso. Lluvia constante aconseja llevar paraguas y ropa impermeable.'
        },
        {
          'day': 'Martes', 
          'image': 'assets/images/nublado.png', 
          'weather': 'Mayormente nublado', 
          'temp': '9°C / 5°C',
          'descripcion': 'Cielo completamente gris con nubes densas. Temperaturas entre 5°C y 9°C sugieren un día fresco. Perfecto para usar varias capas de ropa y disfrutar de un té caliente.'
        },
        {
          'day': 'Miércoles', 
          'image': 'assets/images/lluvia.png', 
          'weather': 'Lluvia ligera', 
          'temp': '7°C / 3°C',
          'descripcion': 'Día con lluvia suave y temperaturas bajando entre 3°C y 7°C. Ambiente húmedo y frío que invita a permanecer en interiores o a usar impermeable y botas.'
        },
        {
          'day': 'Jueves', 
          'image': 'assets/images/sol_nubes.png', 
          'weather': 'Parcialmente soleado', 
          'temp': '10°C / 6°C',
          'descripcion': 'Jornada con intervalos de sol entre nubes. Temperaturas subiendo levemente entre 6°C y 10°C. Oportunidad para una corta salida aprovechando los momentos de claridad.'
        },
        {
          'day': 'Viernes', 
          'image': 'assets/images/lluvia.png', 
          'weather': 'Lluvia', 
          'temp': '8°C / 4°C',
          'descripcion': 'Día lluvioso con temperaturas entre 4°C y 8°C. Ambiente típicamente británico con precipitaciones constantes. Recomendable llevar paraguas y ropa impermeable.'
        },
        {
          'day': 'Sábado', 
          'image': 'assets/images/nublado.png', 
          'weather': 'Nublado', 
          'temp': '6°C / 2°C',
          'descripcion': 'Cielo completamente cubierto con temperaturas muy bajas entre 2°C y 6°C. Día ideal para actividades en interiores o para abrigarse con una buena chaqueta.'
        },
        {
          'day': 'Domingo', 
          'image': 'assets/images/lluvia.png', 
          'weather': 'Lluvia', 
          'temp': '5°C / 1°C',
          'descripcion': 'Último día de la semana con lluvia intensa y temperaturas mínimas entre 1°C y 5°C. Clima frío y húmedo que aconseja quedarse en casa o prepararse con ropa térmica.'
        },
      ]
    },
    {
      'ciudad': 'Lima',
      'clima': [
        {
          'day': 'Lunes', 
          'image': 'assets/images/nublado.png', 
          'weather': 'Nublado', 
          'temp': '21°C / 18°C',
          'descripcion': 'Día nublado con temperaturas estables entre 18°C y 21°C. Ambiente ligeramente fresco pero agradable. Perfecto para usar ropa ligera y disfrutar de un clima suave.'
        },
        {
          'day': 'Martes', 
          'image': 'assets/images/nublado.png', 
          'weather': 'Mayormente nublado', 
          'temp': '22°C / 19°C',
          'descripcion': 'Cielo completamente cubierto con nubes densas. Temperaturas entre 19°C y 22°C ofrecen un clima templado. Ideal para actividades que no requieran sol directo.'
        },
        {
          'day': 'Miércoles', 
          'image': 'assets/images/sol_nubes.png', 
          'weather': 'Parcialmente soleado', 
          'temp': '23°C / 20°C',
          'descripcion': 'Día con alternancia de sol y nubes. Temperaturas subiendo entre 20°C y 23°C. Buena oportunidad para salidas al aire libre aprovechando los momentos soleados.'
        },
        {
          'day': 'Jueves', 
          'image': 'assets/images/sol.png', 
          'weather': 'Soleado', 
          'temp': '24°C / 21°C',
          'descripcion': 'Día completamente soleado con cielo despejado. Temperaturas cálidas entre 21°C y 24°C son ideales para actividades exteriores. Recordar usar protector solar.'
        },
        {
          'day': 'Viernes', 
          'image': 'assets/images/nublado.png', 
          'weather': 'Nublado', 
          'temp': '22°C / 19°C',
          'descripcion': 'Retorno de la nubosidad con temperaturas entre 19°C y 22°C. Día tranquilo que invita a planes relajados o actividades sin exposición directa al sol.'
        },
        {
          'day': 'Sábado', 
          'image': 'assets/images/sol_nubes.png', 
          'weather': 'Parcialmente soleado', 
          'temp': '23°C / 20°C',
          'descripcion': 'Día con intervalos de sol entre nubes. Temperaturas entre 20°C y 23°C ofrecen un clima agradable. Perfecto para combinar actividades al aire libre y momentos de sombra.'
        },
        {
          'day': 'Domingo', 
          'image': 'assets/images/nublado.png', 
          'weather': 'Nublado', 
          'temp': '21°C / 18°C',
          'descripcion': 'Cierre de semana con cielo nublado y temperaturas entre 18°C y 21°C. Día tranquilo ideal para descansar o realizar actividades que no dependan del clima.'
        },
      ]
    },
    {
      'ciudad': 'Bogotá',
      'clima': [
        {
          'day': 'Lunes', 
          'image': 'assets/images/sol.png', 
          'weather': 'Soleado', 
          'temp': '20°C / 10°C',
          'descripcion': 'Día soleado con temperaturas entre 10°C y 20°C. Mañanas frescas que se calientan con la luz solar. Perfecto para usar ropa en capas y disfrutar del día.'
        },
        {
          'day': 'Martes', 
          'image': 'assets/images/nublado.png', 
          'weather': 'Nublado', 
          'temp': '18°C / 9°C',
          'descripcion': 'Cielo cubierto de nubes con temperaturas entre 9°C y 18°C. Ambiente fresco que invita a usar chaqueta y disfrutar de la tranquilidad bogotana.'
        },
        {
          'day': 'Miércoles', 
          'image': 'assets/images/lluvia.png', 
          'weather': 'Lluvioso', 
          'temp': '16°C / 8°C',
          'descripcion': 'Día de lluvia con temperaturas descendiendo entre 8°C y 16°C. Necesario llevar paraguas e impermeable. Perfecto para un día de descanso o actividades en interiores.'
        },
        {
          'day': 'Jueves', 
          'image': 'assets/images/tormenta.png', 
          'weather': 'Tormenta', 
          'temp': '15°C / 7°C',
          'descripcion': 'Día de tormenta intensa con temperaturas entre 7°C y 15°C. Fuertes lluvias y posibles rayos aconsejan permanecer en interiores y tomar precauciones de seguridad.'
        },
        {
          'day': 'Viernes', 
          'image': 'assets/images/sol_nubes.png', 
          'weather': 'Soleado/Nublado', 
          'temp': '19°C / 10°C',
          'descripcion': 'Día variable con alternancia de sol y nubes. Temperaturas entre 10°C y 19°C ofrecen un clima cambiante. Recomendable llevar chaqueta para los momentos más frescos.'
        },
        {
          'day': 'Sábado', 
          'image': 'assets/images/sol.png', 
          'weather': 'Soleado', 
          'temp': '22°C / 12°C',
          'descripcion': 'Día soleado con temperaturas subiendo entre 12°C y 22°C. Perfecto para actividades al aire libre, paseos y disfrutar del clima bogotano.'
        },
        {
          'day': 'Domingo', 
          'image': 'assets/images/nublado.png', 
          'weather': 'Nublado', 
          'temp': '17°C / 8°C',
          'descripcion': 'Cierre de semana con cielo nublado y temperaturas entre 8°C y 17°C. Día tranquilo ideal para descansar o realizar actividades sin mucha exposición solar.'
        },
      ]
    },
    {
      'ciudad': 'Montevideo',
      'clima': [
        {
          'day': 'Lunes', 
          'image': 'assets/images/sol.png', 
          'weather': 'Soleado', 
          'temp': '20°C / 13°C',
          'descripcion': 'Día soleado con temperaturas entre 13°C y 20°C. Clima agradable para actividades al aire libre, paseos por la ciudad o disfrutar de la costa montevideana.'
        },
        {
          'day': 'Martes', 
          'image': 'assets/images/nublado.png', 
          'weather': 'Nublado', 
          'temp': '18°C / 12°C',
          'descripcion': 'Cielo cubierto de nubes con temperaturas entre 12°C y 18°C. Día fresco que invita a usar una chaqueta ligera y disfrutar de la tranquilidad urbana.'
        },
        {
          'day': 'Miércoles', 
          'image': 'assets/images/lluvia.png', 
          'weather': 'Lluvioso', 
          'temp': '16°C / 11°C',
          'descripcion': 'Día de lluvia con temperaturas descendiendo entre 11°C y 16°C. Necesario llevar paraguas e impermeable. Perfecto para un día de descanso o actividades en casa'
        },
        {
          'day': 'Jueves', 
          'image': 'assets/images/tormenta.png', 
          'weather': 'Tormenta', 
          'temp': '14°C / 10°C',
          'descripcion': 'Día de tormenta intensa con temperaturas entre 10°C y 14°C. Fuertes lluvias y posibles rayos aconsejan permanecer en interiores y tomar precauciones de seguridad.'
        },
        {
          'day': 'Viernes', 
          'image': 'assets/images/sol_nubes.png', 
          'weather': 'Soleado/nublado', 
          'temp': '19°C / 13°C',
          'descripcion': 'Día variable con alternancia de sol y nubes. Temperaturas entre 10°C y 19°C ofrecen un clima cambiante. Recomendable llevar chaqueta para los momentos más frescos.'
        },
        {
          'day': 'Sabado', 
          'image': 'assets/images/sol.png', 
          'weather': 'Soleado', 
          'temp': '22°C / 15°C',
          'descripcion': 'Día soleado con temperaturas entre 13°C y 20°C. Clima agradable para actividades al aire libre, paseos por la ciudad o disfrutar de la costa montevideana.'
        },
        {
          'day': 'Domingo', 
          'image': 'assets/images/nublado.png', 
          'weather': 'Nublado', 
          'temp': '18°C / 12°C',
          'descripcion': 'Cielo cubierto de nubes con temperaturas entre 12°C y 18°C. Día fresco que invita a usar una chaqueta ligera y disfrutar de la tranquilidad urbana.' 
        },
      ]
    },
];