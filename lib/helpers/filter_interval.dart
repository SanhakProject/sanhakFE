Future<int> filterInterval(Map<String, dynamic> rawData) async {
  return rawData['interval'] as int;
}