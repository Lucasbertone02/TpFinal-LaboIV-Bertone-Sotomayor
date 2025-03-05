import 'dart:convert';

import 'package:flutter_application_base/models/climaActual_model.dart';

climaActual welcomeFromJson(String str) => climaActual.fromJson(json.decode(str));

String welcomeToJson(climaActual data) => json.encode(data.toJson());