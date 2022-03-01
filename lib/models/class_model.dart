import 'dart:convert';

class ClassModel {
  final String name;
  bool isSelected;
  final String mainAtrb;
  final int? hitDice;
  ClassModel({
    required this.name,
    required this.isSelected,
    required this.mainAtrb,
    this.hitDice,
  });

  ClassModel copyWith({
    String? name,
    bool? isSelected,
    String? mainAtrb,
    int? hitDice,
  }) {
    return ClassModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      mainAtrb: mainAtrb ?? this.mainAtrb,
      hitDice: hitDice ?? this.hitDice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
      'mainAtrb': mainAtrb,
      'hitDice': hitDice,
    };
  }

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
      mainAtrb: map['mainAtrb'] ?? '',
      hitDice: map['hitDice']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassModel.fromJson(String source) =>
      ClassModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClassModel(name: $name, isSelected: $isSelected, mainAtrb: $mainAtrb, hitDice: $hitDice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClassModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        other.mainAtrb == mainAtrb &&
        other.hitDice == hitDice;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        isSelected.hashCode ^
        mainAtrb.hashCode ^
        hitDice.hashCode;
  }
}
