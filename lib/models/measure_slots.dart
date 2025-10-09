class MeasureSlots {
  final String first;
  final String second;
  final String third;
  final String fourth;
  final String fifth;
  final String sixth;
  final String seventh;
  final String eighth;

  MeasureSlots({
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
    required this.fifth,
    required this.sixth,
    required this.seventh,
    required this.eighth,
  });

  factory MeasureSlots.fromJson(Map<String, dynamic> json) {
    return MeasureSlots(
      first: json['first'] ?? '',
      second: json['second'] ?? '',
      third: json['third'] ?? '',
      fourth: json['fourth'] ?? '',
      fifth: json['fifth'] ?? '',
      sixth: json['sixth'] ?? '',
      seventh: json['seventh'] ?? '',
      eighth: json['eighth'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first': first,
      'second': second,
      'third': third,
      'fourth': fourth,
      'fifth': fifth,
      'sixth': sixth,
      'seventh': seventh,
      'eighth': eighth,
    };
  }
}
