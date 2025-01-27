import 'dart:convert';
import 'package:flutter_application_base/models/aire_model.dart';

Aire aireFromJson(String str) => Aire.fromJson(json.decode(str));

String aireToJson(Aire data) => json.encode(data.toJson());

