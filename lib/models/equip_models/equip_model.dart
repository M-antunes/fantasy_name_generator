import 'dart:convert';

import 'package:fantasy_name_generator/models/equip_models/armor_model.dart';

import 'weapon_model.dart';

class EquipModel {
  final WeaponModel? primaryWeapon;
  final WeaponModel? secondaryWeapon;
  final WeaponModel? emergencyWeapon;
  final ArmorModel? armour;
  final ArmorModel? shield;
  EquipModel({
    this.primaryWeapon,
    this.secondaryWeapon,
    this.emergencyWeapon,
    this.armour,
    this.shield,
  });

  EquipModel copyWith({
    WeaponModel? primaryWeapon,
    WeaponModel? secondaryWeapon,
    WeaponModel? emergencyWeapon,
    ArmorModel? armour,
    ArmorModel? shield,
  }) {
    return EquipModel(
      primaryWeapon: primaryWeapon ?? this.primaryWeapon,
      secondaryWeapon: secondaryWeapon ?? this.secondaryWeapon,
      emergencyWeapon: emergencyWeapon ?? this.emergencyWeapon,
      armour: armour ?? this.armour,
      shield: shield ?? this.shield,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'primaryWeapon': primaryWeapon?.toMap(),
      'secondaryWeapon': secondaryWeapon?.toMap(),
      'emergencyWeapon': emergencyWeapon?.toMap(),
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
      emergencyWeapon: map['emergencyWeapon'] != null
          ? WeaponModel.fromMap(map['emergencyWeapon'])
          : null,
      armour: map['armour'] != null ? ArmorModel.fromMap(map['armour']) : null,
      shield: map['shield'] != null ? ArmorModel.fromMap(map['shield']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EquipModel.fromJson(String source) =>
      EquipModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EquipModel(primaryWeapon: $primaryWeapon, secondaryWeapon: $secondaryWeapon, emergencyWeapon: $emergencyWeapon, armour: $armour, shield: $shield)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EquipModel &&
        other.primaryWeapon == primaryWeapon &&
        other.secondaryWeapon == secondaryWeapon &&
        other.emergencyWeapon == emergencyWeapon &&
        other.armour == armour &&
        other.shield == shield;
  }

  @override
  int get hashCode {
    return primaryWeapon.hashCode ^
        secondaryWeapon.hashCode ^
        emergencyWeapon.hashCode ^
        armour.hashCode ^
        shield.hashCode;
  }
}
