import 'package:flutter/material.dart';
import 'package:flutter_application_base/models/climaActual_model.dart';
import 'package:flutter_application_base/providers/climaActualProvider.dart';
import 'package:flutter_application_base/mocks/weather_icons.dart';

class BuscarClimaScreen extends StatefulWidget {
  const BuscarClimaScreen({Key? key}) : super(key: key);

  @override
  State<BuscarClimaScreen> createState() => _BuscarClimaScreenState();
}

class _BuscarClimaScreenState extends State<BuscarClimaScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ClimaActualProvider _climaProvider = ClimaActualProvider();
  String? _ciudadBuscada;
  bool _isLoading = false;
  climaActual? _climaActual;
  String? _error;

  Future<void> _buscarClima(String ciudad) async {
    if (ciudad.isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = null;
      _climaActual = null;
    });

    try {
      final clima = await _climaProvider.fetchClimaPorCiudad(ciudad);
      setState(() {
        _climaActual = clima;
        _ciudadBuscada = ciudad;
      });
    } catch (e) {
      setState(() {
        _error = 'Ciudad no encontrada o error en la búsqueda. Por favor, verifique el nombre de la ciudad e intente nuevamente.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDarkMode = colorScheme.brightness == Brightness.dark;
    
    return Scaffold(
      backgroundColor: isDarkMode ? const Color.fromARGB(255, 30, 30, 50) : Colors.white,
      appBar: AppBar(
        title: Text(
          'Buscar Clima',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode ? const Color.fromARGB(255, 60, 60, 100) : Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cabecera con texto explicativo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Encuentra el clima de cualquier ciudad',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Introduce el nombre de la ciudad en el campo de búsqueda y obtén detalles sobre la temperatura, humedad, viento y más.',
                    style: TextStyle(
                      fontSize: 16,
                      color: isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            // Campo de búsqueda
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Ej: Bahia Blanca',
                  hintStyle: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
                  prefixIcon: Icon(Icons.search, color: isDarkMode ? Colors.white : Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: isDarkMode ? Colors.white30 : Colors.black87),
                  ),
                  filled: true,
                  fillColor: isDarkMode ? Colors.black54 : Colors.white,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color: isDarkMode ? Colors.white : Colors.black87),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _climaActual = null;
                        _error = null;
                      });
                    },
                  ),
                ),
                onSubmitted: (value) => _buscarClima(value),
                textCapitalization: TextCapitalization.words,
              ),
            ),

            // Cargando, error o datos de clima
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_error != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _error!,
                  style: TextStyle(color: isDarkMode ? Colors.redAccent : Colors.red),
                  textAlign: TextAlign.center,
                ),
              )
            else if (_climaActual != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 5,
                  color: isDarkMode ? Colors.grey[850] : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Ciudad buscada y icono
                        Center(
                          child: Text(
                            _ciudadBuscada!,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Icon(
                            getWeatherIcon(_climaActual!.data.icono),
                            size: 80,
                            color: isDarkMode ? Colors.white : Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Información del clima
                        _buildInfoRow('Temperatura', '${_climaActual!.data.temperatura}°C', Icons.thermostat, isDarkMode),
                        _buildInfoRow('Descripción', _climaActual!.data.descripcion, Icons.description, isDarkMode),
                        _buildInfoRow('Sensación Térmica', '${_climaActual!.data.sensacionTermica}°C', Icons.thermostat_auto, isDarkMode),
                        _buildInfoRow('Temperatura Mínima', '${_climaActual!.data.tempMinima}°C', Icons.arrow_downward, isDarkMode),
                        _buildInfoRow('Temperatura Máxima', '${_climaActual!.data.tempMaxima}°C', Icons.arrow_upward, isDarkMode),
                        _buildInfoRow('Humedad', '${_climaActual!.data.humedad}%', Icons.water_drop, isDarkMode),
                        _buildInfoRow('Viento', '${_climaActual!.data.viento} km/h', Icons.air, isDarkMode),
                      ],
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 24, color: isDarkMode ? Colors.white : Theme.of(context).primaryColor),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(fontSize: 18, color: isDarkMode ? Colors.white70 : Colors.black54),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}