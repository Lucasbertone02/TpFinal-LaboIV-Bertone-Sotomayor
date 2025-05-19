import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class AdministracionAireScreen extends StatefulWidget {
  const AdministracionAireScreen({super.key});

  @override
  AdministracionAireScreenState createState() => AdministracionAireScreenState();
}

class AdministracionAireScreenState extends State<AdministracionAireScreen> {
  List<dynamic> _registrosAire = [];
  final String baseurl = dotenv.env['API_URL_ANDROID'] ?? '127.0.0.1:3000';
  // obtiene la API key del archivo .env para mayor seguridad
  final String apiKey = dotenv.env['API_KEY'] ?? '';

  // headers comunes para todas las peticiones HTTP
  Map<String, String> get _headers => {
    "Content-Type": "application/json",
    "Authorization": "Bearer $apiKey" // formato común para enviar la API key
  };

  @override
  void initState() {
    super.initState();
    _fetchRegistrosAire();
  }

  Future<void> _fetchRegistrosAire() async {
    try {
      final response = await http.get(
        Uri.http(baseurl, '/api/v1/aire/aireget'),
        headers: _headers,
      );
      if (response.statusCode == 200) {
        setState(() {
          _registrosAire = json.decode(response.body);
        });
      } else {
        _showErrorMessage('Error al obtener los registros de aire.');
      }
    } catch (e) {
      _showErrorMessage('Error de conexión: $e');
    }
  }

  Future<void> _createRegistroAire(Map<String, dynamic> aireData) async {
    try {
      final response = await http.post(
        Uri.http(baseurl, '/api/v1/aire/airepost'),
        headers: _headers,
        body: json.encode(aireData),
      );
      if (response.statusCode == 201) {
        _showSuccessMessage('Registro de aire creado con éxito');
        _fetchRegistrosAire();
      } else {
        _showErrorMessage('Error al crear el registro de aire.');
      }
    } catch (e) {
      _showErrorMessage('Error de conexión: $e');
    }
  }

  Future<void> _togglePeligroso(String nombreCiudad) async {
    if (nombreCiudad.isEmpty) {
      _showErrorMessage('La coordenada no puede estar vacía');
      return;
    }
    
    try {
      final response = await http.put(
        Uri.http(baseurl, '/api/v1/aire/aire/peligroso'),
        headers: _headers,
        body: jsonEncode({"nombreCiudad": nombreCiudad}),
      );

      if (response.statusCode == 200) {
        _showSuccessMessage('Estado de peligroso actualizado');
        _fetchRegistrosAire();
      } else {
        _showErrorMessage('Error al actualizar el estado de peligroso.');
      }
    } catch (e) {
      _showErrorMessage('Error de conexión: $e');
    }
  }

  Future<void> _deleteRegistroAire(String nombreCiudad) async {
    if (nombreCiudad.isEmpty) {
      _showErrorMessage('La coordenada no puede estar vacía');
      return;
    }
    
    try {
      final response = await http.delete(
        Uri.http(baseurl, '/api/v1/aire/airedelete'),
        headers: _headers,
        body: jsonEncode({"nombreCiudad": nombreCiudad}),
      );

      if (response.statusCode == 200) {
        _showSuccessMessage('Registro de aire eliminado con éxito');
        _fetchRegistrosAire();
      } else {
        _showErrorMessage('Error al eliminar el registro de aire.');
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

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = colorScheme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? const Color.fromARGB(255, 30, 30, 50) : Colors.white,
      appBar: AppBar(
        backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Panel de Administrador - Aire'),
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
                      ElevatedButton.icon(
                        icon: const Icon(Icons.add_location_alt),
                        label: const Text('Agregar Registro de Aire'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                          minimumSize: const Size(double.infinity, 48),
                        ),
                        onPressed: _showAddAireDialog,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Registros de Aire',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: _registrosAire.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.air,
                              size: 64,
                              color: isDarkMode ? Colors.white54 : Colors.black38,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No hay registros de aire almacenados',
                              style: TextStyle(
                                fontSize: 16,
                                color: isDarkMode ? Colors.white54 : Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: _registrosAire.length,
                        itemBuilder: (context, index) {
                          final registro = _registrosAire[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            color: isDarkMode ? const Color.fromARGB(255, 40, 40, 70) : Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(
                                    Icons.air,
                                    color: isDarkMode ? Colors.white70 : Colors.blue,
                                    size: 30,
                                  ),
                                  title: Text(
                                    registro['nombre_ciudad'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: isDarkMode ? Colors.white : Colors.black87,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Calidad: ${registro['calidad_aire']}",
                                        style: TextStyle(
                                          color: isDarkMode ? Colors.white70 : Colors.black54,
                                        ),
                                      ),
                                      Text(
                                        "Fecha: ${registro['fecha']}",
                                        style: TextStyle(
                                          color: isDarkMode ? Colors.white70 : Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(
                                    registro['es_peligroso'] == 1 ? Icons.warning : Icons.warning_amber_outlined,
                                    color: registro['es_peligroso'] == 1 ? Colors.red : 
                                          (isDarkMode ? Colors.white54 : Colors.grey),
                                    size: 30,
                                  ),
                                  onTap: () {
                                    _showAireDetails(registro);
                                  },
                                ),
                            
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton.icon(
                                        icon: const Icon(Icons.warning),
                                        label: Text(registro['es_peligroso'] == 1 ? 'Desmarcar Peligroso' : 'Marcar como Peligroso'),
                                        style: TextButton.styleFrom(
                                          foregroundColor: registro['es_peligroso'] == 1 ? Colors.orange : Colors.blue,
                                        ),
                                        onPressed: () => _togglePeligroso(registro['nombre_ciudad']),
                                      ),
                                      const SizedBox(width: 8),
                                      TextButton.icon(
                                        icon: const Icon(Icons.delete),
                                        label: const Text('Eliminar'),
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.red,
                                        ),
                                        onPressed: () => _showDeleteConfirmDialog(registro['nombre_ciudad']),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
        onPressed: _fetchRegistrosAire,
        backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.blue,
        foregroundColor: Colors.white,
        child: const Icon(Icons.refresh),
      ),
    );
  }

  // diálogo de confirmación para eliminar
  void _showDeleteConfirmDialog(String nombreCiudad) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = colorScheme.brightness == Brightness.dark;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDarkMode ? const Color.fromARGB(255, 30, 30, 50) : Colors.white,
        title: const Text('Confirmar eliminación'),
        content: Text('¿Estás seguro de que deseas eliminar el registro para "$nombreCiudad"?'),
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
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              _deleteRegistroAire(nombreCiudad);
              Navigator.pop(context);
            },
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }

  void _showAireDetails(dynamic registro) {
    showDialog(
      context: context,
      builder: (context) {
        final ColorScheme colorScheme = Theme.of(context).colorScheme;
        final bool isDarkMode = colorScheme.brightness == Brightness.dark;
        return AlertDialog(
          backgroundColor: isDarkMode ? const Color.fromARGB(255, 30, 30, 50) : Colors.white,
          title: Text(
            registro['nombre_ciudad'],
            style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _detailRow('Fecha:', registro['fecha'] ?? 'No disponible'),
              _detailRow('Calidad del Aire:', '${registro['calidad_aire']}'),
              _detailRow('CO:', '${registro['co']}'),
              _detailRow('NO:', '${registro['no']}'),
              _detailRow('NO2:', '${registro['no2']}'),
              _detailRow('O3:', '${registro['o3']}'),
              _detailRow('SO2:', '${registro['so2']}'),
              _detailRow('PM2.5:', '${registro['pm2_5']}'),
              _detailRow('PM10:', '${registro['pm10']}'),
              _detailRow('NH3:', '${registro['nh3']}'),
              _detailRow('Es Peligroso:', registro['es_peligroso'] == 1 ? 'Sí' : 'No'),
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

  void _showAddAireDialog() {
    final TextEditingController nombreCiudadController = TextEditingController();
    final TextEditingController calidadAireController = TextEditingController();
    final TextEditingController coController = TextEditingController();
    final TextEditingController noController = TextEditingController();
    final TextEditingController no2Controller = TextEditingController();
    final TextEditingController o3Controller = TextEditingController();
    final TextEditingController so2Controller = TextEditingController();
    final TextEditingController pm25Controller = TextEditingController();
    final TextEditingController pm10Controller = TextEditingController();
    final TextEditingController nh3Controller = TextEditingController();
    
    // fecha actual como valor predeterminado
    final String fechaActual = DateFormat('yyyy-MM-dd').format(DateTime.now());
    
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        final ColorScheme colorScheme = Theme.of(context).colorScheme;
        final bool isDarkMode = colorScheme.brightness == Brightness.dark;
        return AlertDialog(
          backgroundColor: isDarkMode ? const Color.fromARGB(255, 30, 30, 50) : Colors.white,
          title: Text(
            'Agregar Registro de Aire',
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
                    controller: nombreCiudadController,
                    style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Coordenadas (lat,long)',
                      hintText: 'Ejemplo: -34.603722,-58.381592',
                      helperText: 'Ingresa la latitud y longitud separadas por coma',
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
                        return 'Por favor ingrese las coordenadas';
                      }
                      if (!value.contains(',')) {
                        return 'Formato incorrecto. Use: latitud,longitud';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: calidadAireController,
                    style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Calidad del Aire (1-5)',
                      hintText: 'Valor entre 1 y 5',
                      helperText: '1 = Mejor calidad, 5 = Peor calidad',
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
                        return 'Por favor ingrese la calidad del aire';
                      }
                      final intValue = int.tryParse(value);
                      if (intValue == null) {
                        return 'Por favor ingrese un número válido';
                      }
                      if (intValue < 1 || intValue > 5) {
                        return 'La calidad debe estar entre 1 y 5';
                      }
                      return null;
                    },
                  ),
                  // campos para los componentes del aire con placeholders
                  _buildNumberFormField(
                    coController, 
                    'CO',
                    isDarkMode,
                    hintText: 'Valor de monóxido de carbono',
                  ),
                  _buildNumberFormField(
                    noController, 
                    'NO',
                    isDarkMode,
                    hintText: 'Valor de óxido nítrico',
                  ),
                  _buildNumberFormField(
                    no2Controller, 
                    'NO2',
                    isDarkMode,
                    hintText: 'Valor de dióxido de nitrógeno',
                  ),
                  _buildNumberFormField(
                    o3Controller, 
                    'O3',
                    isDarkMode,
                    hintText: 'Valor de ozono',
                  ),
                  _buildNumberFormField(
                    so2Controller, 
                    'SO2',
                    isDarkMode,
                    hintText: 'Valor de dióxido de azufre',
                  ),
                  _buildNumberFormField(
                    pm25Controller, 
                    'PM2.5',
                    isDarkMode,
                    hintText: 'Partículas finas (2.5 µm)',
                  ),
                  _buildNumberFormField(
                    pm10Controller, 
                    'PM10',
                    isDarkMode,
                    hintText: 'Partículas gruesas (10 µm)',
                  ),
                  _buildNumberFormField(
                    nh3Controller, 
                    'NH3',
                    isDarkMode,
                    hintText: 'Valor de amoníaco',
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
                  // crea el objeto con los datos del aire
                  final Map<String, dynamic> aireData = {
                    "nombreCiudad": nombreCiudadController.text,
                    "fecha": fechaActual,
                    "calidadAire": int.parse(calidadAireController.text),
                    "co": double.parse(coController.text),
                    "no": double.parse(noController.text),
                    "no2": double.parse(no2Controller.text),
                    "o3": double.parse(o3Controller.text),
                    "so2": double.parse(so2Controller.text),
                    "pm2_5": double.parse(pm25Controller.text),
                    "pm10": double.parse(pm10Controller.text),
                    "nh3": double.parse(nh3Controller.text),
                  };
                  
                  // envia los datos al servidor
                  _createRegistroAire(aireData);
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
  
  // metodo auxiliar para crear campos de formulario numéricos con placeholders
  Widget _buildNumberFormField(
    TextEditingController controller, 
    String label, 
    bool isDarkMode, 
    {String? hintText}
  ) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
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
          return 'Por favor ingrese el valor para $label';
        }
        if (double.tryParse(value) == null) {
          return 'Por favor ingrese un número válido';
        }
        return null;
      },
    );
  }
}