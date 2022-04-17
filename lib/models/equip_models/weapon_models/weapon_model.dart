import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fantasy_name_generator/models/equip_models/weapon_models/weapon_family_model.dart';

import '../magic_equip_models/enchant_model.dart';

class WeaponModel {
  WeaponFamilyModel? type;
  bool? isSelected;
  String? name;
  List<EnchantModel>? enchantment;
  String? damage;
  String? damageType;
  String? critical;
  List<String> forbiddenTo;
  int mundanePrice;
  int fullPrice;
  WeaponModel({
    this.type,
    this.isSelected,
    this.name,
    this.enchantment = const [],
    this.damage,
    this.damageType,
    this.critical,
    required this.forbiddenTo,
    this.mundanePrice = 0,
    this.fullPrice = 0,
  });

  WeaponModel copyWith({
    WeaponFamilyModel? type,
    bool? isSelected,
    String? name,
    List<EnchantModel>? enchantment,
    String? damage,
    String? damageType,
    String? critical,
    List<String>? forbiddenTo,
    int? mundanePrice,
    int? fullPrice,
  }) {
    return WeaponModel(
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
      name: name ?? this.name,
      enchantment: enchantment ?? this.enchantment,
      damage: damage ?? this.damage,
      damageType: damageType ?? this.damageType,
      critical: critical ?? this.critical,
      forbiddenTo: forbiddenTo ?? this.forbiddenTo,
      mundanePrice: mundanePrice ?? this.mundanePrice,
      fullPrice: fullPrice ?? this.fullPrice,
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
      'forbiddenTo': forbiddenTo,
      'mundanePrice': mundanePrice,
      'fullPrice': fullPrice,
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
      forbiddenTo: List<String>.from(map['forbiddenTo']),
      mundanePrice: map['mundanePrice']?.toInt() ?? 0,
      fullPrice: map['fullPrice']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeaponModel.fromJson(String source) =>
      WeaponModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeaponModel(type: $type, isSelected: $isSelected, name: $name, enchantment: $enchantment, damage: $damage, damageType: $damageType, critical: $critical, forbiddenTo: $forbiddenTo, mundanePrice: $mundanePrice, fullPrice: $fullPrice)';
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
        other.critical == critical &&
        listEquals(other.forbiddenTo, forbiddenTo) &&
        other.mundanePrice == mundanePrice &&
        other.fullPrice == fullPrice;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        isSelected.hashCode ^
        name.hashCode ^
        enchantment.hashCode ^
        damage.hashCode ^
        damageType.hashCode ^
        critical.hashCode ^
        forbiddenTo.hashCode ^
        mundanePrice.hashCode ^
        fullPrice.hashCode;
  }
}
