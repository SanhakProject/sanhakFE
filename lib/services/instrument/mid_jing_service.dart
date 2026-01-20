import 'dart:convert';
import 'package:flutter/services.dart';

Future<Map<String, dynamic>> midJingService() async {
  try {
    final String jsonString = await rootBundle.loadString('assets/dummy/mid_jing.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);
    return jsonData;
  } catch (e) {
    throw Exception("fetchDummyData error: $e");
  }
}