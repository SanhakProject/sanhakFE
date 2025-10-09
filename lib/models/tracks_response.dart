import 'track_summary.dart';

class TracksResponse {
  final List<TrackSummary> tracks;

  TracksResponse({required this.tracks});

  factory TracksResponse.fromJson(Map<String, dynamic> json) {
    return TracksResponse(
      tracks: (json['tracks'] as List)
          .map((track) => TrackSummary.fromJson(track))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tracks': tracks.map((track) => track.toJson()).toList(),
    };
  }
}
