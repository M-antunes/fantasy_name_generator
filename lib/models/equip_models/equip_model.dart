import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'armor_models/armor_model.dart';
import 'weapon_models/weapon_model.dart';
import 'magic_equip_models/wonderous_items_model.dart';

class EquipModel {
  WeaponModel? meleeWeapon;
  WeaponModel? rangeWeapon;
  ArmorModel? armour;
  ArmorModel? shield;
  List<WonderousItemsModel>? wonderousItems;
  EquipModel({
    this.meleeWeapon,
    this.rangeWeapon,
    this.armour,
    this.shield,
    this.wonderousItems,
  });

  EquipModel copyWith({
    WeaponModel? primaryWeapon,
    WeaponModel? emergencyWeapon,
    ArmorModel? armour,
    ArmorModel? shield,
    List<WonderousItemsModel>? wonderousItems,
  }) {
    return EquipModel(
      meleeWeapon: primaryWeapon ?? meleeWeapon,
      rangeWeapon: emergencyWeapon ?? rangeWeapon,
      armour: armour ?? this.armour,
      shield: shield ?? this.shield,
      wonderousItems: wonderousItems ?? this.wonderousItems,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'primaryWeapon': meleeWeapon?.toMap(),
      'emergencyWeapon': rangeWeapon?.toMap(),
      'armour': armour?.toMap(),
      'shield': shield?.toMap(),
      'wonderousItems': wonderousItems?.map((x) => x.toMap()).toList(),
    };
  }

  factory EquipModel.fromMap(Map<String, dynamic> map) {
    return EquipModel(
      meleeWeapon: map['primaryWeapon'] != null
          ? WeaponModel.fromMap(map['primaryWeapon'])
          : null,
      rangeWeapon: map['emergencyWeapon'] != null
          ? WeaponModel.fromMap(map['emergencyWeapon'])
          : null,
      armour: map['armour'] != null ? ArmorModel.fromMap(map['armour']) : null,
      shield: map['shield'] != null ? ArmorModel.fromMap(map['shield']) : null,
      wonderousItems: map['wonderousItems'] != null
          ? List<WonderousItemsModel>.from(
              map['wonderousItems']?.map((x) => WonderousItemsModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EquipModel.fromJson(String source) =>
      EquipModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EquipModel(primaryWeapon: $meleeWeapon, emergencyWeapon: $rangeWeapon, armour: $armour, shield: $shield, wonderousItems: $wonderousItems)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EquipModel &&
        other.meleeWeapon == meleeWeapon &&
        other.rangeWeapon == rangeWeapon &&
        other.armour == armour &&
        other.shield == shield &&
        listEquals(other.wonderousItems, wonderousItems);
  }

  @override
  int get hashCode {
    return meleeWeapon.hashCode ^
        rangeWeapon.hashCode ^
        armour.hashCode ^
        shield.hashCode ^
        wonderousItems.hashCode;
  }
}
