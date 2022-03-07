import 'dart:convert';

import 'package:fantasy_name_generator/models/equip_models/armour_model.dart';

import 'weapon_model.dart';

class EquipModel {
  final WeaponModel? primaryWeapon;
  final WeaponModel? secondaryWeapon;
  final ArmourModel? armour;
  final ArmourModel? shield;
  EquipModel({
    this.primaryWeapon,
    this.secondaryWeapon,
    this.armour,
    this.shield,
  });

  EquipModel copyWith({
    WeaponModel? primaryWeapon,
    WeaponModel? secondaryWeapon,
    ArmourModel? armour,
    ArmourModel? shield,
  }) {
    return EquipModel(
      primaryWeapon: primaryWeapon ?? this.primaryWeapon,
      secondaryWeapon: secondaryWeapon ?? this.secondaryWeapon,
      armour: armour ?? this.armour,
      shield: shield ?? this.shield,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'primaryWeapon': primaryWeapon?.toMap(),
      'secondaryWeapon': secondaryWeapon?.toMap(),
      'armour': armour?.toMap(),
      'shield': shield?.toMap(),
    };
  }

  factory EquipModel.fromMap(Map<String, dynamic> map) {
    return EquipModel(
      primaryWeapon: map['primaryWeapon'] != null
          ? WeaponModel.fromMap(map['primaryWeapon'])
          : null,
      secondaryWeapon: map['secondaryWeapon'] != null
          ? WeaponModel.fromMap(map['secondaryWeapon'])
          : null,
      armour: map['armour'] != null ? ArmourModel.fromMap(map['armour']) : null,
      shield: map['shield'] != null ? ArmourModel.fromMap(map['shield']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EquipModel.fromJson(String source) =>
      EquipModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EquipModel(primaryWeapon: $primaryWeapon, secondaryWeapon: $secondaryWeapon, armour: $armour, shield: $shield)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EquipModel &&
        other.primaryWeapon == primaryWeapon &&
        other.secondaryWeapon == secondaryWeapon &&
        other.armour == armour &&
        other.shield == shield;
  }

  @override
  int get hashCode {
    return primaryWeapon.hashCode ^
        secondaryWeapon.hashCode ^
        armour.hashCode ^
        shield.hashCode;
  }
}
