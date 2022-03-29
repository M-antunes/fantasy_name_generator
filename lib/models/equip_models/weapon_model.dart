import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fantasy_name_generator/models/equip_models/weapon_type_model.dart';

import 'enchant_model.dart';

class WeaponModel {
  WeaponFamilyModel? type;
  bool? isSelected;
  String? name;
  List<EnchantModel>? enchantment;
  String? damage;
  String? damageType;
  String? critical;
  WeaponModel({
    this.type,
    this.isSelected,
    this.name,
    this.enchantment,
    this.damage,
    this.damageType,
    this.critical,
  });

  WeaponModel copyWith({
    WeaponFamilyModel? type,
    bool? isSelected,
    String? name,
    List<EnchantModel>? enchantment,
    String? damage,
    String? damageType,
    String? critical,
  }) {
    return WeaponModel(
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
      name: name ?? this.name,
      enchantment: enchantment ?? this.enchantment,
      damage: damage ?? this.damage,
      damageType: damageType ?? this.damageType,
      critical: critical ?? this.critical,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type?.toMap(),
      'isSelected': isSelected,
      'name': name,
      'enchantment': enchantment?.map((x) => x.toMap()).toList(),
      'damage': damage,
      'damageType': damageType,
      'critical': critical,
    };
  }

  factory WeaponModel.fromMap(Map<String, dynamic> map) {
    return WeaponModel(
      type: map['type'] != null ? WeaponFamilyModel.fromMap(map['type']) : null,
      isSelected: map['isSelected'],
      name: map['name'],
      enchantment: map['enchantment'] != null
          ? List<EnchantModel>.from(
              map['enchantment']?.map((x) => EnchantModel.fromMap(x)))
          : null,
      damage: map['damage'],
      damageType: map['damageType'],
      critical: map['critical'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeaponModel.fromJson(String source) =>
      WeaponModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeaponModel(type: $type, isSelected: $isSelected, name: $name, enchantment: $enchantment, damage: $damage, damageType: $damageType, critical: $critical)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeaponModel &&
        other.type == type &&
        other.isSelected == isSelected &&
        other.name == name &&
        listEquals(other.enchantment, enchantment) &&
        other.damage == damage &&
        other.damageType == damageType &&
        other.critical == critical;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        isSelected.hashCode ^
        name.hashCode ^
        enchantment.hashCode ^
        damage.hashCode ^
        damageType.hashCode ^
        critical.hashCode;
  }
}
