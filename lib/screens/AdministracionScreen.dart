import 'package:flutter/material.dart';

class Administracionscreen extends StatefulWidget {
  const Administracionscreen({super.key});

  @override
  AdministracionscreenState createState() => AdministracionscreenState();
}

class AdministracionscreenState extends State<Administracionscreen> {
  final TextEditingController _cityController = TextEditingController();

 //logica MARCAR FAVORITO
  void _markAsFavorite() {
    if (_cityController.text.isEmpty) {
      _showErrorMessage('Debes ingresar el nombre de la ciudad antes de marcarla como favorita.');
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Ciudad "${_cityController.text}" marcada como favorita en clima')),
    );
    _cityController.clear();
  }

 //LOGICA CREAR CIUDAD
  void _createCity() {
    showDialog(
      context: context,
      builder: (context) {
        return CrearCiudad();
      },
    );
  }

  //LOGICA ELIMINAR CIUDAD
  void _deleteCity() {
    if (_cityController.text.isEmpty) {
      _showErrorMessage('Debes ingresar el nombre de la ciudad antes de eliminarla.');
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Ciudad "${_cityController.text}" eliminada de clima')),
    );
    _cityController.clear();
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, style: const TextStyle(color: Colors.white)), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = colorScheme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? const Color.fromARGB(255, 30, 30, 50) : Colors.white,
      appBar: AppBar(
        title: Text(
          'Panel de Administrador',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _cityController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelText: 'Nombre de la ciudad',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _markAsFavorite,
                child: const Text('Marcar como favorita'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _deleteCity,
                child: const Text('Eliminar Ciudad'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _createCity,
                child: const Text('Crear Ciudad'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CrearCiudad extends StatefulWidget {
  @override
  _CrearCiudadState createState() => _CrearCiudadState();
}

class _CrearCiudadState extends State<CrearCiudad> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _minTempController = TextEditingController();
  final TextEditingController _maxTempController = TextEditingController();
  final TextEditingController _feelsLikeController = TextEditingController();
  final TextEditingController _humidityController = TextEditingController();
  final TextEditingController _windController = TextEditingController();

  void _saveCity() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ciudad "${_nameController.text}" creada en clima')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Crear Ciudad"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(_nameController, "Nombre de la ciudad"),
              _buildTextField(_descriptionController, "Descripción"),
              _buildTextField(_temperatureController, "Temperatura", isNumeric: true),
              _buildTextField(_minTempController, "Temperatura mínima", isNumeric: true),
              _buildTextField(_maxTempController, "Temperatura máxima", isNumeric: true),
              _buildTextField(_feelsLikeController, "Sensación térmica", isNumeric: true),
              _buildTextField(_humidityController, "Humedad", isNumeric: true),
              _buildTextField(_windController, "Viento", isNumeric: true),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancelar"),
        ),
        ElevatedButton(
          onPressed: _saveCity,
          child: const Text("Guardar"),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isNumeric = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Este campo es obligatorio";
          }
          return null;
        },
      ),
    );
  }
}
