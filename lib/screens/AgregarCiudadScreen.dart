import 'package:flutter/material.dart';

class AgregarCiudadScreen extends StatefulWidget {
  const AgregarCiudadScreen({Key? key}) : super(key: key);
  @override
  _AgregarCiudadScreenState createState() => _AgregarCiudadScreenState();
}

class _AgregarCiudadScreenState extends State<AgregarCiudadScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ciudadController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _justificacionController = TextEditingController();
  bool _esImportante = false;

  @override
  void dispose() {
    _ciudadController.dispose();
    _nombreController.dispose();
    _apellidoController.dispose();
    _justificacionController.dispose();
    super.dispose();
  }

  void _mostrarMensaje() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "¡Gracias, ${_nombreController.text} ${_apellidoController.text}! "
            "Pronto evaluaremos agregar la ciudad ${_ciudadController.text} "
            "${_esImportante ? 'como importante' : ''}.",
          ),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = colorScheme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Color.fromARGB(255, 30, 30, 50) : Colors.white,
      appBar: AppBar(
        title: Text(
          "Agregar Ciudad",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isDarkMode ? Colors.deepPurple : Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Campo para el nombre
                TextFormField(
                  controller: _nombreController,
                  decoration: InputDecoration(
                    labelText: "Nombre",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor ingrese su nombre";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Campo para el apellido
                TextFormField(
                  controller: _apellidoController,
                  decoration: InputDecoration(
                    labelText: "Apellido",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor ingrese su apellido";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Campo para ingresar el nombre de la ciudad
                TextFormField(
                  controller: _ciudadController,
                  decoration: InputDecoration(
                    labelText: "Nombre de la Ciudad",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor ingrese un nombre de ciudad";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Campo para justificar por qué agregar la ciudad
                TextFormField(
                  controller: _justificacionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: "¿Por qué debemos agregar esta ciudad?",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor justifique su sugerencia";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Switch para marcar si es una ciudad importante
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "¿Es una ciudad importante?",
                      style: TextStyle(
                        fontSize: 16,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    Switch(
                      value: _esImportante,
                      onChanged: (value) {
                        setState(() {
                          _esImportante = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Botón para enviar
                Center(
                  child: ElevatedButton(
                    onPressed: _mostrarMensaje,
                    child: Text("Enviar"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? Colors.deepPurple : Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
