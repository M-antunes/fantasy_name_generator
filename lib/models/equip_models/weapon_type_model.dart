import 'dart:convert';

class WeaponFamilyModel {
  String name;
  bool isSelected;
  String picture;
  WeaponFamilyModel({
    required this.name,
    required this.isSelected,
    required this.picture,
  });

  WeaponFamilyModel copyWith({
    String? name,
    bool? isSelected,
    String? picture,
  }) {
    return WeaponFamilyModel(
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

  factory WeaponFamilyModel.fromMap(Map<String, dynamic> map) {
    return WeaponFamilyModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
      picture: map['picture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WeaponFamilyModel.fromJson(String source) =>
      WeaponFamilyModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'WeaponWeildingModel(name: $name, isSelected: $isSelected, picture: $picture)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeaponFamilyModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        other.picture == picture;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode ^ picture.hashCode;
}
