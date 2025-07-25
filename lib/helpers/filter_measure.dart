Future<List<List<String>>> filterMeasure(Map<String, dynamic> rawData) async {
  final List<dynamic> allMeasures = rawData['measure'];
  List<List<String>> result = allMeasures
      .map((map) => (map as Map<String, dynamic>).values.map((v) => v.toString()).toList())
      .toList();
  return result;
}