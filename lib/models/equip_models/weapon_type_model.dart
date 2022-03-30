import 'dart:convert';

import 'package:flutter/foundation.dart';

class WeaponFamilyModel {
  String name;
  bool isSelected;
  String picture;
  String wielding;
  List<String> forbiddenTo;
  WeaponFamilyModel({
    required this.name,
    required this.isSelected,
    required this.picture,
    required this.wielding,
    required this.forbiddenTo,
  });

  WeaponFamilyModel copyWith({
    String? name,
    bool? isSelected,
    String? picture,
    String? wielding,
    List<String>? forbiddenTo,
  }) {
    return WeaponFamilyModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      picture: picture ?? this.picture,
      wielding: wielding ?? this.wielding,
      forbiddenTo: forbiddenTo ?? this.forbiddenTo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
      'picture': picture,
      'wielding': wielding,
      'forbiddenTo': forbiddenTo,
    };
  }

  factory WeaponFamilyModel.fromMap(Map<String, dynamic> map) {
    return WeaponFamilyModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
      picture: map['picture'] ?? '',
      wielding: map['wielding'] ?? '',
      forbiddenTo: List<String>.from(map['forbiddenTo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeaponFamilyModel.fromJson(String source) =>
      WeaponFamilyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeaponFamilyModel(name: $name, isSelected: $isSelected, picture: $picture, wielding: $wielding, forbiddenTo: $forbiddenTo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeaponFamilyModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        other.picture == picture &&
        other.wielding == wielding &&
        listEquals(other.forbiddenTo, forbiddenTo);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        isSelected.hashCode ^
        picture.hashCode ^
        wielding.hashCode ^
        forbiddenTo.hashCode;
  }
}
