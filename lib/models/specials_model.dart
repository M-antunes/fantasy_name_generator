import 'dart:convert';

class SpecialsModel {
  final String name;
  final String description;
  final int levelAcquired;
  bool isSelected;
  SpecialsModel({
    required this.name,
    required this.description,
    required this.levelAcquired,
    required this.isSelected,
  });

  SpecialsModel copyWith({
    String? name,
    String? description,
    int? levelAcquired,
    bool? isSelected,
  }) {
    return SpecialsModel(
      name: name ?? this.name,
      description: description ?? this.description,
      levelAcquired: levelAcquired ?? this.levelAcquired,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'levelAcquired': levelAcquired,
      'isSelected': isSelected,
    };
  }

  factory SpecialsModel.fromMap(Map<String, dynamic> map) {
    return SpecialsModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      levelAcquired: map['levelAcquired']?.toInt() ?? 0,
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialsModel.fromJson(String source) =>
      SpecialsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SpecialsModel(name: $name, description: $description, levelAcquired: $levelAcquired, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpecialsModel &&
        other.name == name &&
        other.description == description &&
        other.levelAcquired == levelAcquired &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        levelAcquired.hashCode ^
        isSelected.hashCode;
  }
}
