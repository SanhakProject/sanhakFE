import 'dart:convert';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> hardGguengService() async {
  try {
    final String jsonString = await rootBundle.loadString('assets/dummy/hard_ggueng.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return jsonData;
  } catch (e) {
    throw Exception("fetchDummyData error: $e");
  }
}