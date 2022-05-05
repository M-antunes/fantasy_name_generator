import 'dart:convert';

class BossOrMinionModel {
  final String name;
  final String svg;
  final String description;
  bool isSelected;
  BossOrMinionModel({
    required this.name,
    required this.svg,
    required this.description,
    this.isSelected = false,
  });

  BossOrMinionModel copyWith({
    String? name,
    String? svg,
    String? description,
    bool? isSelected,
  }) {
    return BossOrMinionModel(
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

  factory BossOrMinionModel.fromMap(Map<String, dynamic> map) {
    return BossOrMinionModel(
      name: map['name'] ?? '',
      svg: map['svg'] ?? '',
      description: map['description'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory BossOrMinionModel.fromJson(String source) =>
      BossOrMinionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BossOrMinionModel(name: $name, svg: $svg, description: $description, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BossOrMinionModel &&
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
