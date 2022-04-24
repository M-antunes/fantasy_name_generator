import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fantasy_name_generator/models/spell_models/spell_model.dart';

import 'armor_models/armor_model.dart';
import 'magic_equip_models/wonderous_items_model.dart';
import 'weapon_models/weapon_model.dart';

class EquipModel {
  WeaponModel? meleeWeapon;
  WeaponModel? rangeWeapon;
  ArmorModel? armour;
  ArmorModel? shield;
  List<WonderousItemsModel>? wonderousItems;
  List<WonderousItemsModel>? tomesAndManuals;
  List<SpellModel> potions;
  EquipModel({
    this.meleeWeapon,
    this.rangeWeapon,
    this.armour,
    this.shield,
    this.wonderousItems,
    this.tomesAndManuals,
    this.potions = const [],
  });

  EquipModel copyWith({
    WeaponModel? meleeWeapon,
    WeaponModel? rangeWeapon,
    ArmorModel? armour,
    ArmorModel? shield,
    List<WonderousItemsModel>? wonderousItems,
    List<WonderousItemsModel>? tomesAndManuals,
    List<SpellModel>? potions,
  }) {
    return EquipModel(
      meleeWeapon: meleeWeapon ?? this.meleeWeapon,
      rangeWeapon: rangeWeapon ?? this.rangeWeapon,
      armour: armour ?? this.armour,
      shield: shield ?? this.shield,
      wonderousItems: wonderousItems ?? this.wonderousItems,
      tomesAndManuals: tomesAndManuals ?? this.tomesAndManuals,
      potions: potions ?? this.potions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'meleeWeapon': meleeWeapon?.toMap(),
      'rangeWeapon': rangeWeapon?.toMap(),
      'armour': armour?.toMap(),
      'shield': shield?.toMap(),
      'wonderousItems': wonderousItems?.map((x) => x.toMap()).toList(),
      'tomesAndManuals': tomesAndManuals?.map((x) => x.toMap()).toList(),
      'potions': potions.map((x) => x.toMap()).toList(),
    };
  }

  factory EquipModel.fromMap(Map<String, dynamic> map) {
    return EquipModel(
      meleeWeapon: map['meleeWeapon'] != null
          ? WeaponModel.fromMap(map['meleeWeapon'])
          : null,
      rangeWeapon: map['rangeWeapon'] != null
          ? WeaponModel.fromMap(map['rangeWeapon'])
          : null,
      armour: map['armour'] != null ? ArmorModel.fromMap(map['armour']) : null,
      shield: map['shield'] != null ? ArmorModel.fromMap(map['shield']) : null,
      wonderousItems: map['wonderousItems'] != null
          ? List<WonderousItemsModel>.from(
              map['wonderousItems']?.map((x) => WonderousItemsModel.fromMap(x)))
          : null,
      tomesAndManuals: map['tomesAndManuals'] != null
          ? List<WonderousItemsModel>.from(map['tomesAndManuals']
              ?.map((x) => WonderousItemsModel.fromMap(x)))
          : null,
      potions: List<SpellModel>.from(
          map['potions']?.map((x) => SpellModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory EquipModel.fromJson(String source) =>
      EquipModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EquipModel(meleeWeapon: $meleeWeapon, rangeWeapon: $rangeWeapon, armour: $armour, shield: $shield, wonderousItems: $wonderousItems, tomesAndManuals: $tomesAndManuals, potions: $potions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EquipModel &&
        other.meleeWeapon == meleeWeapon &&
        other.rangeWeapon == rangeWeapon &&
        other.armour == armour &&
        other.shield == shield &&
        listEquals(other.wonderousItems, wonderousItems) &&
        listEquals(other.tomesAndManuals, tomesAndManuals) &&
        listEquals(other.potions, potions);
  }

  @override
  int get hashCode {
    return meleeWeapon.hashCode ^
        rangeWeapon.hashCode ^
        armour.hashCode ^
        shield.hashCode ^
        wonderousItems.hashCode ^
        tomesAndManuals.hashCode ^
        potions.hashCode;
  }
}
