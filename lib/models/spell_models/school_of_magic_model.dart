import 'dart:convert';

class SchoolOfMagicModel {
  final String name;
  final String svg;
  final String description;
  bool isSelected;
  SchoolOfMagicModel({
    required this.name,
    required this.svg,
    required this.description,
    required this.isSelected,
  });

  SchoolOfMagicModel copyWith({
    String? name,
    String? svg,
    String? description,
    bool? isSelected,
  }) {
    return SchoolOfMagicModel(
      name: name ?? this.name,
      svg: svg ?? this.svg,
      description: description ?? this.description,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'svg': svg,
      'description': description,
      'isSelected': isSelected,
    };
  }

  factory SchoolOfMagicModel.fromMap(Map<String, dynamic> map) {
    return SchoolOfMagicModel(
      name: map['name'] ?? '',
      svg: map['svg'] ?? '',
      description: map['description'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SchoolOfMagicModel.fromJson(String source) =>
      SchoolOfMagicModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SchoolModel(name: $name, svg: $svg, description: $description, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SchoolOfMagicModel &&
        other.name == name &&
        other.svg == svg &&
        other.description == description &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        svg.hashCode ^
        description.hashCode ^
        isSelected.hashCode;
  }
}
