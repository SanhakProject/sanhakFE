import 'measure.dart';

class TrackSheetGrid {
  final int trackId;
  final String instrument;
  final int sheetId;
  final String difficulty;
  final int totalMeasures;
  final int intervalMs;
  final int durationMs;
  final List<Measure> measures;
  final String audioUrl;

  TrackSheetGrid({
    required this.trackId,
    required this.instrument,
    required this.sheetId,
    required this.difficulty,
    required this.totalMeasures,
    required this.intervalMs,
    required this.durationMs,
    required this.measures,
    required this.audioUrl,
  });

  factory TrackSheetGrid.fromJson(Map<String, dynamic> json) {
    return TrackSheetGrid(
      trackId: json['trackId'],
      instrument: json['instrument'],
      sheetId: json['sheetId'],
      difficulty: json['difficulty'],
      totalMeasures: json['totalMeasures'],
      intervalMs: json['intervalMs'],
      durationMs: json['durationMs'],
      measures: (json['measures'] as List)
          .map((measure) => Measure.fromJson(measure))
          .toList(),
      audioUrl: json['audioUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trackId': trackId,
      'instrument': instrument,
      'sheetId': sheetId,
      'difficulty': difficulty,
      'totalMeasures': totalMeasures,
      'intervalMs': intervalMs,
      'durationMs': durationMs,
      'measures': measures.map((measure) => measure.toJson()).toList(),
      'audioUrl': audioUrl,
    };
  }
}
