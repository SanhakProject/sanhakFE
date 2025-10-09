class TrackRecordSummary {
  final String lastPlayedAt;
  final int lastScore;
  final String bestPlayedAt;
  final int bestScore;

  TrackRecordSummary({
    required this.lastPlayedAt,
    required this.lastScore,
    required this.bestPlayedAt,
    required this.bestScore,
  });

  factory TrackRecordSummary.fromJson(Map<String, dynamic> json) {
    return TrackRecordSummary(
      lastPlayedAt: json['lastPlayedAt'],
      lastScore: json['lastScore'],
      bestPlayedAt: json['bestPlayedAt'],
      bestScore: json['bestScore'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lastPlayedAt': lastPlayedAt,
      'lastScore': lastScore,
      'bestPlayedAt': bestPlayedAt,
      'bestScore': bestScore,
    };
  }
}
