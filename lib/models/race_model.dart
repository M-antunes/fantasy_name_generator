import 'dart:convert';

class RaceModel {
  final String name;
  final String malePicture;
  final String femalePicture;
  bool isSelected;
  RaceModel({
    required this.name,
    required this.malePicture,
    required this.femalePicture,
    required this.isSelected,
  });

  RaceModel copyWith({
    String? name,
    String? malePicture,
    String? femalePicture,
    bool? isSelected,
  }) {
    return RaceModel(
      name: name ?? this.name,
      malePicture: malePicture ?? this.malePicture,
      femalePicture: femalePicture ?? this.femalePicture,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'malePicture': malePicture,
      'femalePicture': femalePicture,
      'isSelected': isSelected,
    };
  }

  factory RaceModel.fromMap(Map<String, dynamic> map) {
    return RaceModel(
      name: map['name'] ?? '',
      malePicture: map['malePicture'] ?? '',
      femalePicture: map['femalePicture'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory RaceModel.fromJson(String source) =>
      RaceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RaceModel(name: $name, malePicture: $malePicture, femalePicture: $femalePicture, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RaceModel &&
        other.name == name &&
        other.malePicture == malePicture &&
        other.femalePicture == femalePicture &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        malePicture.hashCode ^
        femalePicture.hashCode ^
        isSelected.hashCode;
  }
}
