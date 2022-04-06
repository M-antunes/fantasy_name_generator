import 'dart:convert';

import 'package:flutter/foundation.dart';

class WeaponFamilyModel {
  String name;
  String wielding;
  List<String> forbiddenTo;
  WeaponFamilyModel({
    required this.name,
    required this.wielding,
    required this.forbiddenTo,
  });

  WeaponFamilyModel copyWith({
    String? name,
    String? wielding,
    List<String>? forbiddenTo,
  }) {
    return WeaponFamilyModel(
      name: name ?? this.name,
      wielding: wielding ?? this.wielding,
      forbiddenTo: forbiddenTo ?? this.forbiddenTo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'wielding': wielding,
      'forbiddenTo': forbiddenTo,
    };
  }

  factory WeaponFamilyModel.fromMap(Map<String, dynamic> map) {
    return WeaponFamilyModel(
      name: map['name'] ?? '',
      wielding: map['wielding'] ?? '',
      forbiddenTo: List<String>.from(map['forbiddenTo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WeaponFamilyModel.fromJson(String source) =>
      WeaponFamilyModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'WeaponFamilyModel(name: $name, wielding: $wielding, forbiddenTo: $forbiddenTo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeaponFamilyModel &&
        other.name == name &&
        other.wielding == wielding &&
        listEquals(other.forbiddenTo, forbiddenTo);
  }

  @override
  int get hashCode => name.hashCode ^ wielding.hashCode ^ forbiddenTo.hashCode;
}
