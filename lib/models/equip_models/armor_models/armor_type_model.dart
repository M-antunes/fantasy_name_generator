import 'dart:convert';

class ArmorFamilyModel {
  String name;
  bool isSelected;
  ArmorFamilyModel({
    required this.name,
    required this.isSelected,
  });

  ArmorFamilyModel copyWith({
    String? name,
    bool? isSelected,
  }) {
    return ArmorFamilyModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
    };
  }

  factory ArmorFamilyModel.fromMap(Map<String, dynamic> map) {
    return ArmorFamilyModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArmorFamilyModel.fromJson(String source) =>
      ArmorFamilyModel.fromMap(json.decode(source));

  @override
  String toString() => 'ArmorFamilyModel(name: $name, isSelected: $isSelected)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArmorFamilyModel &&
        other.name == name &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode;
}
