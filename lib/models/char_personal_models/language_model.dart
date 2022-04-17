import 'dart:convert';

class LanguageModel {
  final String name;
  final String spokenBy;
  final double probability;
  LanguageModel({
    required this.name,
    required this.spokenBy,
    required this.probability,
  });

  LanguageModel copyWith({
    String? name,
    String? spokenBy,
    double? probability,
  }) {
    return LanguageModel(
      name: name ?? this.name,
      spokenBy: spokenBy ?? this.spokenBy,
      probability: probability ?? this.probability,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'spokenBy': spokenBy,
      'probability': probability,
    };
  }

  factory LanguageModel.fromMap(Map<String, dynamic> map) {
    return LanguageModel(
      name: map['name'] ?? '',
      spokenBy: map['spokenBy'] ?? '',
      probability: map['probability']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LanguageModel.fromJson(String source) =>
      LanguageModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'LanguageModel(name: $name, spokenBy: $spokenBy, probability: $probability)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LanguageModel &&
        other.name == name &&
        other.spokenBy == spokenBy &&
        other.probability == probability;
  }

  @override
  int get hashCode => name.hashCode ^ spokenBy.hashCode ^ probability.hashCode;
}
