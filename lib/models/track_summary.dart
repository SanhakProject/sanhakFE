import 'track_record_summary.dart';

class TrackSummary {
  final int id;
  final String title;
  final String difficulty;
  final int durationMs;
  final String audioUrl;
  final TrackRecordSummary record;

  TrackSummary({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.durationMs,
    required this.audioUrl,
    required this.record,
  });

  factory TrackSummary.fromJson(Map<String, dynamic> json) {
    return TrackSummary(
      id: json['id'],
      title: json['title'],
      difficulty: json['difficulty'],
      durationMs: json['durationMs'],
      audioUrl: json['audioUrl'],
      record: TrackRecordSummary.fromJson(json['TrackRecordSummary']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'difficulty': difficulty,
      'durationMs': durationMs,
      'audioUrl': audioUrl,
      'record': record.toJson(),
    };
  }
}
