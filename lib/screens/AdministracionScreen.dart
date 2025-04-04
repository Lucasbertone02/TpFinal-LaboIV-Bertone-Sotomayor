import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdministracionScreen extends StatefulWidget {
  const AdministracionScreen({super.key});

  @override
  AdministracionScreenState createState() => AdministracionScreenState();
}

class AdministracionScreenState extends State<AdministracionScreen> {
  List<dynamic> _cities = [];
  final String baseurl = dotenv.env['API_URL_CHROME'] ?? '127.0.0.1:3000';

  @override
  void initState() {
    super.initState();
    _fetchCities();
  }

  Future<void> _fetchCities() async {
    try {
      final response = await http.get(Uri.http(baseurl, '/api/v1/clima/climaget'));
      if (response.statusCode == 200) {
        setState(() {
          _cities = json.decode(response.body);
        });
      } else {
        _showErrorMessage('Error al obtener las ciudades.');
      }
    } catch (e) {
      _showErrorMessage('Error de conexión: $e');
    }
  }

  Future<void> _createCity(Map<String, dynamic> cityData) async {
    try {
      final response = await http.post(
        Uri.http(baseurl, '/api/v1/clima/climapost'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(cityData),
      );
      if (response.statusCode == 201) {
        _showSuccessMessage('Ciudad creada con éxito');
        _fetchCities();
      } else {
        _showErrorMessage('Error al crear la ciudad.');
      }
    } catch (e) {
      _showErrorMessage('Error de conexión: $e');
    }
  }

  Future<void> _toggleFavorite(String cityName) async {
    if (cityName.isEmpty) {
      _showErrorMessage('El nombre de la ciudad no puede estar vacío');
      return;
    }
    
    try {
      final response = await http.put(
        Uri.http(baseurl, '/api/v1/clima/clima/favorito'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"nombre_ciudad": cityName}),
      );

      if (response.statusCode == 200) {
        _showSuccessMessage('Estado de favorito actualizado');
        _fetchCities();
      } else {
        _showErrorMessage('Error al actualizar el estado de favorito.');
      }
    } catch (e) {
      _showErrorMessage('Error de conexión: $e');
    }
  }

  Future<void> _deleteCity(String cityName) async {
    if (cityName.isEmpty) {
      _showErrorMessage('El nombre de la ciudad no puede estar vacío');
      return;
    }
    
    try {
      final response = await http.delete(
        Uri.http(baseurl, '/api/v1/clima/climadelete'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"nombre_ciudad": cityName}),
      );

      if (response.statusCode == 200) {
        _showSuccessMessage('Ciudad eliminada con éxito');
        _fetchCities();
      } else {
        _showErrorMessage('Error al eliminar la ciudad.');
      }
    } catch (e) {
      _showErrorMessage('Error de conexión: $e');
    }
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _showCityInputDialog(String title, Function(String) onConfirm) {
    final TextEditingController cityController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    
    showDialog(
      context: context,
      builder: (context) {
        final ColorScheme colorScheme = Theme.of(context).colorScheme;
        final bool isDarkMode = colorScheme.brightness == Brightness.dark;
        return AlertDialog(
          backgroundColor: isDarkMode ? const Color.fromARGB(255, 30, 30, 50) : Colors.white,
          title: Text(
            title,
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: cityController,
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              decoration: InputDecoration(
                labelText: 'Nombre de la ciudad',
                labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: isDarkMode ? Colors.white54 : Colors.black54),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.blue),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el nombre de la ciudad';
                }
                return null;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancelar',
                style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  onConfirm(cityController.text);
                  Navigator.pop(context);
                }
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
      final ColorScheme colorScheme = Theme.of(context).colorScheme;
      final bool isDarkMode = colorScheme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? const Color.fromARGB(255, 30, 30, 50) : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Panel de Administrador'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: isDarkMode
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color.fromARGB(255, 30, 30, 50), Color.fromARGB(255, 20, 20, 35)],
                )
              : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.white],
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Card(
                color: isDarkMode ? const Color.fromARGB(255, 40, 40, 70) : Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Acciones',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.add_location_alt),
                              label: const Text('Agregar'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                              onPressed: _showAddCityDialog,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.delete_forever),
                              label: const Text('Eliminar'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                              onPressed: () => _showCityInputDialog('Eliminar Ciudad', _deleteCity),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ciudades Almacenadas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: _cities.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_city,
                              size: 64,
                              color: isDarkMode ? Colors.white54 : Colors.black38,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No hay ciudades almacenadas',
                              style: TextStyle(
                                fontSize: 16,
                                color: isDarkMode ? Colors.white54 : Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: _cities.length,
                        itemBuilder: (context, index) {
                          final city = _cities[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            color: isDarkMode ? const Color.fromARGB(255, 40, 40, 70) : Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              leading: Icon(
                                Icons.location_on,
                                color: isDarkMode ? Colors.white70 : Colors.blue,
                                size: 30,
                              ),
                              title: Text(
                                city['nombre_ciudad'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isDarkMode ? Colors.white : Colors.black87,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Temperatura: ${city['temperatura']}°C",
                                    style: TextStyle(
                                      color: isDarkMode ? Colors.white70 : Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    "Mín: ${city['temp_minima']}°C • Máx: ${city['temp_maxima']}°C",
                                    style: TextStyle(
                                      color: isDarkMode ? Colors.white70 : Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  city['es_favorita'] == 1 ? Icons.star : Icons.star_border,
                                  color: city['es_favorita'] == 1 ? Colors.amber : 
                                        (isDarkMode ? Colors.white54 : Colors.grey),
                                  size: 30,
                                ),
                                onPressed: () {
                                  _toggleFavorite(city['nombre_ciudad']);
                                },
                              ),
                              onTap: () {
                                _showCityDetails(city);
                              },
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _fetchCities,
        backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _showCityDetails(dynamic city) {
    showDialog(
      context: context,
      builder: (context) {
      final ColorScheme colorScheme = Theme.of(context).colorScheme;
      final bool isDarkMode = colorScheme.brightness == Brightness.dark;
        return AlertDialog(
          backgroundColor: isDarkMode ? const Color.fromARGB(255, 30, 30, 50) : Colors.white,
          title: Text(
            city['nombre_ciudad'],
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _detailRow('Descripción:', city['descripcion'] ?? 'No disponible'),
              _detailRow('Temperatura:', '${city['temperatura']}°C'),
              _detailRow('Temp. Mínima:', '${city['temp_minima']}°C'),
              _detailRow('Temp. Máxima:', '${city['temp_maxima']}°C'),
              _detailRow('Sensación Térmica:', '${city['sensacion_termica']}°C'),
              _detailRow('Humedad:', '${city['humedad']}%'),
              _detailRow('Viento:', '${city['viento']} km/h'),
              _detailRow('Favorita:', city['es_favorita'] == 1 ? 'Sí' : 'No'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cerrar',
                style: TextStyle(
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _detailRow(String label, String value) {
        final ColorScheme colorScheme = Theme.of(context).colorScheme;
      final bool isDarkMode = colorScheme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: isDarkMode ? Colors.white70 : Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddCityDialog() {
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController descripcionController = TextEditingController();
    final TextEditingController temperaturaController = TextEditingController();
    final TextEditingController tempMinimaController = TextEditingController();
    final TextEditingController tempMaximaController = TextEditingController();
    final TextEditingController sensacionTermicaController = TextEditingController();
    final TextEditingController humedadController = TextEditingController();
    final TextEditingController vientoController = TextEditingController();
    
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
      final ColorScheme colorScheme = Theme.of(context).colorScheme;
      final bool isDarkMode = colorScheme.brightness == Brightness.dark;
        return AlertDialog(
          backgroundColor: isDarkMode ? const Color.fromARGB(255, 30, 30, 50) : Colors.white,
          title: Text(
            'Agregar Ciudad',
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nombreController,
                    style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Nombre de la ciudad',
                      labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white54 : Colors.black54),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.blue),
                      ),
                      errorStyle: TextStyle(color: isDarkMode ? Colors.redAccent : Colors.red),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese el nombre de la ciudad';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: descripcionController,
                    style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Descripción',
                      labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white54 : Colors.black54),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.blue),
                      ),
                      errorStyle: TextStyle(color: isDarkMode ? Colors.redAccent : Colors.red),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese una descripción';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: temperaturaController,
                    style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Temperatura (°C)',
                      labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white54 : Colors.black54),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.blue),
                      ),
                      errorStyle: TextStyle(color: isDarkMode ? Colors.redAccent : Colors.red),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese la temperatura';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Por favor ingrese un número válido';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: tempMinimaController,
                    style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Temperatura Mínima (°C)',
                      labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white54 : Colors.black54),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.blue),
                      ),
                      errorStyle: TextStyle(color: isDarkMode ? Colors.redAccent : Colors.red),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese la temperatura mínima';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Por favor ingrese un número válido';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: tempMaximaController,
                    style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Temperatura Máxima (°C)',
                      labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white54 : Colors.black54),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.blue),
                      ),
                      errorStyle: TextStyle(color: isDarkMode ? Colors.redAccent : Colors.red),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese la temperatura máxima';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Por favor ingrese un número válido';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: sensacionTermicaController,
                    style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Sensación Térmica (°C)',
                      labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white54 : Colors.black54),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.blue),
                      ),
                      errorStyle: TextStyle(color: isDarkMode ? Colors.redAccent : Colors.red),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese la sensación térmica';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Por favor ingrese un número válido';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: humedadController,
                    style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Humedad (%)',
                      labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white54 : Colors.black54),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.blue),
                      ),
                      errorStyle: TextStyle(color: isDarkMode ? Colors.redAccent : Colors.red),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese la humedad';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Por favor ingrese un número entero válido';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: vientoController,
                    style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Viento (km/h)',
                      labelStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white54 : Colors.black54),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: isDarkMode ? Colors.white : Colors.blue),
                      ),
                      errorStyle: TextStyle(color: isDarkMode ? Colors.redAccent : Colors.red),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese la velocidad del viento';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Por favor ingrese un número válido';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancelar',
                style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _createCity({
                    "nombre_ciudad": nombreController.text,
                    "descripcion": descripcionController.text,
                    "temperatura": double.tryParse(temperaturaController.text) ?? 0.0,
                    "temp_minima": double.tryParse(tempMinimaController.text) ?? 0.0,
                    "temp_maxima": double.tryParse(tempMaximaController.text) ?? 0.0,
                    "sensacion_termica": double.tryParse(sensacionTermicaController.text) ?? 0.0,
                    "humedad": int.tryParse(humedadController.text) ?? 0,
                    "viento": double.tryParse(vientoController.text) ?? 0.0,
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }
}