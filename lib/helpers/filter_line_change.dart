Future<int> filterLineChange(Map<String, dynamic> rawData) async {
  return rawData['line_change'] as int;
}