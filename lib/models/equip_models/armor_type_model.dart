import 'dart:convert';

class ArmorFamilyModel {
  String name;
  bool isSelected;
  String picture;
  ArmorFamilyModel({
    required this.name,
    required this.isSelected,
    required this.picture,
  });

  ArmorFamilyModel copyWith({
    String? name,
    bool? isSelected,
    String? picture,
  }) {
    return ArmorFamilyModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
      'picture': picture,
    };
  }

  factory ArmorFamilyModel.fromMap(Map<String, dynamic> map) {
    return ArmorFamilyModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
      picture: map['picture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ArmorFamilyModel.fromJson(String source) =>
      ArmorFamilyModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ArmorTypeModel(name: $name, isSelected: $isSelected, picture: $picture)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArmorFamilyModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        other.picture == picture;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode ^ picture.hashCode;
}
