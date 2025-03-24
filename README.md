# Proyecto Clima y Calidad del Aire

## PPS

Este proyecto fue desarrollado con el objetivo de proporcionar información actualizada sobre el clima y la contaminación en diferentes ciudades del mundo. A lo largo del desarrollo, nos enfocamos en crear una aplicación funcional e intuitiva, pero consideramos que aún había margen para mejorar. Por ello, decidimos agregar nuevas funcionalidades, mejorar la organización de la información y optimizar la experiencia del usuario.

Estas mejoras no solo mejoraron el proyecto original, sino que también fortalecieron su propósito principal: generar conciencia sobre el impacto del clima y la contaminación en nuestro planeta. A continuación, detallamos las nuevas pantallas y funcionalidades añadidas.

---

## Screens Implementadas (Sotomayor)

### 1. Nuestro Objetivo
Esta pantalla explica de manera clara y concisa la razón de ser de la aplicación. Queremos que los usuarios comprendan la importancia del clima y la contaminación en nuestra vida diaria. 

- Se incluyó una **animación Lottie** para hacerlo más visual y atractivo.
- Se mejoró el diseño para que se adapte al **modo oscuro y claro**.
- Se agregó un botón de navegación para una mejor experiencia de usuario.

---

### 2. Información (Sistema de PageView)
Para mejorar la experiencia educativa dentro de la aplicación, implementamos una pantalla con un **sistema de PageView** que permite deslizar entre diferentes secciones informativas. Cada una aborda un tema clave sobre el clima y la contaminación:

1. **¿Qué es el clima?** - Definición y explicación básica.
2. **Influencia del clima** - Cómo afecta a nuestra vida cotidiana y al equilibrio del planeta.
3. **¿Qué es la contaminación?** - Definición y tipos principales de contaminación.
4. **Impacto de la contaminación en el clima** - Explicación de cómo la contaminación altera los ecosistemas.
5. **Calentamiento global** - Cómo se relaciona con la contaminación y sus consecuencias.
6. **Reflexión final** - Un mensaje de concientización sobre el cuidado del planeta.

####  Mejoras aplicadas en esta pantalla:
- Se añadieron **animaciones** para cada sección.
- Se incluyó una **flecha animada** en el lateral derecho para indicar el deslizamiento, excepto en la última sección.
- Se organizó el contenido de manera más clara y con buena información relevante.

---

### 3. Nuestra Aplicación (Bertone)
Esta pantalla tiene como objetivo ayudar al usuario a conocer las funciones principales de la aplicación. 

- Se presenta un mensaje invitando al usuario a descubrir las funcionalidades de la app.
- Se agregó un botón que redirige a un **tutorial interactivo**.

---

### 4. Tutorial (Sistema de PageView con deslizamiento vertical)
Para hacer más accesible la aplicación, incorporamos un **tutorial paso a paso** que guía al usuario en el uso de cada función. 

Cada página del tutorial explica un aspecto importante de la aplicación y cuenta con **un número en imagen representando la sección**. Además, el usuario puede deslizar hacia abajo para navegar entre los pasos, y se añadió una **flecha en la parte inferior** para indicar el movimiento, excepto en la última página.

Las secciones del tutorial incluyen:
1. **Inicio** - Información sobre ciudades principales.
2. **Buscar Clima** - Cómo buscar una ciudad y conocer su temperatura actual.
3. **Lista de contaminación del aire** - Ver ciudades seleccionadas y la posibilidad de llenar un formulario.
4. **Lista de clima** - Ciudades seleccionadas con detalles adicionales de temperatura.
5. **Formulario de agregar ciudad** - Cómo solicitar la inclusión de nuevas ciudades en la lista.
6. **Nuestro objetivo** - Sección de concientización sobre el clima y la contaminación.
7. **Ajustes** - Explicación sobre la opción de cambiar entre modo claro y oscuro.
8. **Mensaje final** - Agradecimiento y un botón para salir del tutorial.

---

## Mejoras y Optimización del Proyecto
Las mejoras realizadas no solo expandieron el contenido del proyecto original, sino que también lo hicieron más robusto y accesible. Algunas de las optimizaciones más importantes incluyen:

- **Diseño más intuitivo**: Se mejoró la estructura de navegación para una experiencia fluida.
- **Mayor cantidad de información**: Se agregaron secciones educativas y explicativas.
- **Uso de animaciones**: Se implementaron animaciones Lottie para mejorar la experiencia visual.
- **Modo oscuro y claro**: Se adaptó de mejor manera la interfaz para que sea agradable en ambos modos.
- **Mejoras en la organización del código**: Se reestructuraron archivos y se optimizaron funciones.

---

## Conclusión PPS
Con estas mejoras, logramos que la aplicación no solo sea una herramienta útil para conocer el clima y la contaminación, sino también una plataforma educativa que fomenta la conciencia ambiental. 

## Integrantes
- **Bertone Lucas**
- **Ignacio Sotomayor**

## Descripción del Proyecto
Este proyecto vincula una **API en Node.js** con una aplicación desarrollada en **Dart y Flutter**. La aplicación consume los endpoints del backend y muestra los datos en el frontend, permitiendo obtener información en tiempo real sobre el clima y la calidad del aire en distintas ciudades.

## Pantallas de la Aplicación en Flutter...

### **Home**
En la pantalla principal tenemos:
- Un carrusel con el clima actual de varias ciudades, que consume el endpoint:
  ```
  /api/v1/clima/ciudad?ciudad={nombre_ciudad}
  ```
- Un carrusel con la calidad del aire en distintas ciudades, que consume:
  ```
  /api/v1/aire/polucion?lat={lat}&lon={lon}
  ```
- Un mensaje de bienvenida y un mini footer.
- Las tarjetas de clima actual son clickeables y muestran información adicional como humedad, presión, etc.

### **Perfil de Usuario**
- Muestra una imagen del perfil del usuario.
- Opción para seleccionar el **modo oscuro**.

### **Lista de Contaminación del Aire**
- Muestra una lista de ciudades ordenadas según la contaminación del aire.
- Cada ciudad puede ser clickeada para ver más detalles y dejar un comentario.
- Consume el endpoint:
  ```
  /api/v1/aire/polucion
  ```

### **Clima Ciudades**
- Muestra el pronóstico extendido de cada ciudad, actualizado cada 3 horas.
- Consume el endpoint:
  ```
  /api/v1/pronostico/extendidoPorCiudad/:ciudad
  ```
- Las tarjetas son clickeables y muestran datos adicionales importantes.

### **Formulario Ciudades**
- Permite completar un formulario con los siguientes campos:
  - Nombre
  - Apellido
  - Nombre de la ciudad
  - Razón por la que se debe agregar la ciudad

### **Buscar Clima**
- Cuenta con un **buscador** donde se ingresa el nombre de una ciudad.
- Consume el endpoint:
  ```
  /api/v1/clima/ciudad/:ciudad
  ```
- Muestra el clima actual y otros datos relevantes en una tarjeta.

## Tecnologías Utilizadas
- **Backend**: Node.js con Express
- **Frontend**: Flutter con Dart
- **API de Clima**: OpenWeather

## Repositorio de Node.js.
- **Link**: [Node.js con Express](https://github.com/Nacho2204/apiexpress_2024_Bertone_Sotomayor.git)

---
**Desarrollado por Bertone Lucas e Ignacio Sotomayor**