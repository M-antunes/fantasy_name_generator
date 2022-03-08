import 'dart:convert';

class WeaponTypeModel {
  String name;
  bool isSelected;
  String picture;
  WeaponTypeModel({
    required this.name,
    required this.isSelected,
    required this.picture,
  });

  WeaponTypeModel copyWith({
    String? name,
    bool? isSelected,
    String? picture,
  }) {
    return WeaponTypeModel(
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

  factory WeaponTypeModel.fromMap(Map<String, dynamic> map) {
    return WeaponTypeModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
      picture: map['picture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WeaponTypeModel.fromJson(String source) =>
      WeaponTypeModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'WeaponWeildingModel(name: $name, isSelected: $isSelected, picture: $picture)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeaponTypeModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        other.picture == picture;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode ^ picture.hashCode;
}
