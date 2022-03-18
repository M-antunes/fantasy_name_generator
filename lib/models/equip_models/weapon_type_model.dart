import 'dart:convert';

class WeaponFamilyModel {
  String name;
  bool isSelected;
  String picture;
  String wielding;

  WeaponFamilyModel({
    required this.name,
    required this.isSelected,
    required this.picture,
    required this.wielding,
  });

  WeaponFamilyModel copyWith({
    String? name,
    bool? isSelected,
    String? picture,
    String? wielding,
  }) {
    return WeaponFamilyModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      picture: picture ?? this.picture,
      wielding: wielding ?? this.wielding,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
      'picture': picture,
      'wielding': wielding,
    };
  }

  factory WeaponFamilyModel.fromMap(Map<String, dynamic> map) {
    return WeaponFamilyModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
      picture: map['picture'] ?? '',
      wielding: map['wielding'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WeaponFamilyModel.fromJson(String source) =>
      WeaponFamilyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeaponFamilyModel(name: $name, isSelected: $isSelected, picture: $picture, wielding: $wielding)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeaponFamilyModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        other.picture == picture &&
        other.wielding == wielding;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        isSelected.hashCode ^
        picture.hashCode ^
        wielding.hashCode;
  }
}
