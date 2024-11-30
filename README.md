# App Clima 

Una aplicación desarrollada en *Flutter* que permite consultar el pronóstico del clima semanal en distintas ciudades y el índice de contaminación en las mismas y mas. Además, incluye una sección de perfil con soporte para modo oscuro.

- *Versión de la API de Android*:  API 35 (Android 12).
- *Dimensiones*: 1080x2400.

---

## Funcionalidades

### *Pantalla de Inicio (HomeScreen)*
- *Clima Semanal:*
  - Muestra un carrusel horizontal con el pronóstico del clima actual en diversas ciudades.
  - Cada día incluye:
    - Nombre de la ciudad.
    - Icono representativo del clima (soleado, nublado, lluvia, etc.).
    - Descripción del clima.
    - Temperatura máxima y mínima.
- *Índice de Contaminación:*
  - Otro carrusel horizontal muestra la calidad del aire en varias ciudades.
  - Cada tarjeta incluye:
    - Nombre de la ciudad.
    - Icono que representa el nivel de contaminación.
    - Nivel de contaminación (bajo, moderado, alto).
    - Índice de calidad del aire (AQI).

### *Pantalla de Perfil (ProfileScreen)*
- *Modo Oscuro:*
  - Opción para alternar entre el modo claro y oscuro.
  - Persistencia de la configuración usando una clase de preferencias.

### Pantallas Individuales (Sotomayor)

### *Lista Contaminacion Aire*
- Muestra una lista de cards (Widget creado) en la cual se puede ver los mismos datos que en el carrusel de la home screen, solo que en esta pantalla hay mas numero de   ciudades.

### *Detalle Contaminacion Aire*
- Pantalla individual para la ciudad seleccionada en Lista Contaminacion Aire.
- Dentro de la misma hay un formulario para que el usuario pueda:
    - Indicar si es peligrosa o no.
    - Dar un comentario sobre la ciudad.
    - Y por ultimo el boton de Guardar Comentario, el cual al ser seleccionado se le notifica al usuario que guardado.

### *Lista de Comentarios*
- Pantalla en la cual se ve una lista de envios de formulario hechos en la screen anterior.
- En cada uno se ve:
    - Nombre de ciudad que recibio el comentario.
    - Comentario enviado.
    - Estado de la ciudad, depende cual eligio el usuario.

### *RegistroContaminacionCard*
- Widget utilizado (Card) para utilizar en la lista de Lista Contaminacion Aire*.

---

### Pantallas individuales (Bertone)

### *ClimaCiudadesScreen*
- Muestra el nombre de la ciudad como titulo.
-Cada card tiene:
    -Nombre de la ciudad.
    -Icono Representativo del clima.
    -Descripción.
    -Temperatura.
    -Muestra el clima semanal (simulado en los mocks.dart).

### *ClimaDetalleScreen*
-Cuando tocas una card muestra:
    -Tipo de clima.
    -Icono para cada tipo de clima.
    -Descripción sobre el dia .
    -Temperatura.
    -Esta hecho con la card recicable que se llama climadetalle.dar en la carpeta widgets para poder hacer cada card de la misma manera usando el constructor.

### *AgregarCiudadScreen*
-Un formulario con sus campos como nombre, apellido, ciudad que quieres agregar y una justificación del porque.
-Un switch botón que te hace marcar si es importante o no esa ciudad.
-Un botón donde podes "enviar" que cuando se oprime con todos los campos completos este te pone una alerta que te dice que pronto agregaremos ese clima.
-Manejo de errores para cada campo.

---

### *Dependencias Utilizadas*
- flutter/material.dart: Framework principal para el diseño de la interfaz.
- SharedPreferences: Para almacenar configuraciones como el estado del modo oscuro.

---