# Proyecto Clima y Calidad del Aire

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