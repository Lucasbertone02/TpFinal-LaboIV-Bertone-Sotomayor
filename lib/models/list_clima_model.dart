import 'dart:convert';

import 'package:flutter_application_base/models/clima_model.dart';

Clima climaFromJson(String str) => Clima.fromJson(json.decode(str));

String climaToJson(Clima data) => json.encode(data.toJson());