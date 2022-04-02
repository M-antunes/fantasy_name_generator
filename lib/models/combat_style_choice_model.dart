import 'dart:convert';

class CombatStyleChoiceModel {
  final String name;
  final String svg;
  final String descriptionTitle;
  final String description;
  bool isSelected;
  CombatStyleChoiceModel({
    required this.name,
    required this.svg,
    required this.descriptionTitle,
    required this.description,
    required this.isSelected,
  });

  CombatStyleChoiceModel copyWith({
    String? name,
    String? svg,
    String? descriptionTitle,
    String? description,
    bool? isSelected,
  }) {
    return CombatStyleChoiceModel(
      name: name ?? this.name,
      svg: svg ?? this.svg,
      descriptionTitle: descriptionTitle ?? this.descriptionTitle,
      description: description ?? this.description,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'svg': svg,
      'descriptionTitle': descriptionTitle,
      'description': description,
      'isSelected': isSelected,
    };
  }

  factory CombatStyleChoiceModel.fromMap(Map<String, dynamic> map) {
    return CombatStyleChoiceModel(
      name: map['name'] ?? '',
      svg: map['svg'] ?? '',
      descriptionTitle: map['descriptionTitle'] ?? '',
      description: map['description'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CombatStyleChoiceModel.fromJson(String source) =>
      CombatStyleChoiceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CombatStyleChoiceModel(name: $name, svg: $svg, descriptionTitle: $descriptionTitle, description: $description, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CombatStyleChoiceModel &&
        other.name == name &&
        other.svg == svg &&
        other.descriptionTitle == descriptionTitle &&
        other.description == description &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        svg.hashCode ^
        descriptionTitle.hashCode ^
        description.hashCode ^
        isSelected.hashCode;
  }
}
