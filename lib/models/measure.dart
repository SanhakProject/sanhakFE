import 'measure_slots.dart';

class Measure {
  final MeasureSlots strokes;
  final MeasureSlots lyrics;

  Measure({
    required this.strokes,
    required this.lyrics,
  });

  factory Measure.fromJson(Map<String, dynamic> json) {
    return Measure(
      strokes: MeasureSlots.fromJson(json['strokes']),
      lyrics: MeasureSlots.fromJson(json['lyrics']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'strokes': strokes.toJson(),
      'lyrics': lyrics.toJson(),
    };
  }
}