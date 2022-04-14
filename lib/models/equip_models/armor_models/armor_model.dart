import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../magic_equip_models/enchant_model.dart';
import 'armor_type_model.dart';

class ArmorModel {
  String? name;
  String? material;
  ArmorFamilyModel? type;
  bool? isSelected;
  List<EnchantModel>? enchantment;
  bool fitForDruid;
  int defenseBonus;
  int checkPenalty;
  int maxDexAllowed;
  int speedPenalty;
  int price;
  ArmorModel({
    this.name,
    this.material,
    this.type,
    this.isSelected,
    this.enchantment,
    this.fitForDruid = true,
    this.defenseBonus = 0,
    this.checkPenalty = 0,
    this.maxDexAllowed = 0,
    this.speedPenalty = 0,
    required this.price,
  });

  ArmorModel copyWith({
    String? name,
    String? material,
    ArmorFamilyModel? type,
    bool? isSelected,
    List<EnchantModel>? enchantment,
    bool? fitForDruid,
    int? defenseBonus,
    int? checkPenalty,
    int? maxDexAllowed,
    int? speedPenalty,
    int? price,
  }) {
    return ArmorModel(
      name: name ?? this.name,
      material: material ?? this.material,
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
      enchantment: enchantment ?? this.enchantment,
      fitForDruid: fitForDruid ?? this.fitForDruid,
      defenseBonus: defenseBonus ?? this.defenseBonus,
      checkPenalty: checkPenalty ?? this.checkPenalty,
      maxDexAllowed: maxDexAllowed ?? this.maxDexAllowed,
      speedPenalty: speedPenalty ?? this.speedPenalty,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'material': material,
      'type': type?.toMap(),
      'isSelected': isSelected,
      'enchantment': enchantment?.map((x) => x.toMap()).toList(),
      'fitForDruid': fitForDruid,
      'defenseBonus': defenseBonus,
      'checkPenalty': checkPenalty,
      'maxDexAllowed': maxDexAllowed,
      'speedPenalty': speedPenalty,
      'price': price,
    };
  }

  factory ArmorModel.fromMap(Map<String, dynamic> map) {
    return ArmorModel(
      name: map['name'],
      material: map['material'],
      type: map['type'] != null ? ArmorFamilyModel.fromMap(map['type']) : null,
      isSelected: map['isSelected'],
      enchantment: map['enchantment'] != null
          ? List<EnchantModel>.from(
              map['enchantment']?.map((x) => EnchantModel.fromMap(x)))
          : null,
      fitForDruid: map['fitForDruid'] ?? false,
      defenseBonus: map['defenseBonus']?.toInt(),
      checkPenalty: map['checkPenalty']?.toInt(),
      maxDexAllowed: map['maxDexAllowed']?.toInt(),
      speedPenalty: map['speedPenalty']?.toInt(),
      price: map['price']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArmorModel.fromJson(String source) =>
      ArmorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArmorModel(name: $name, material: $material, type: $type, isSelected: $isSelected, enchantment: $enchantment, fitForDruid: $fitForDruid, defenseBonus: $defenseBonus, checkPenalty: $checkPenalty, maxDexAllowed: $maxDexAllowed, speedPenalty: $speedPenalty, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArmorModel &&
        other.name == name &&
        other.material == material &&
        other.type == type &&
        other.isSelected == isSelected &&
        listEquals(other.enchantment, enchantment) &&
        other.fitForDruid == fitForDruid &&
        other.defenseBonus == defenseBonus &&
        other.checkPenalty == checkPenalty &&
        other.maxDexAllowed == maxDexAllowed &&
        other.speedPenalty == speedPenalty &&
        other.price == price;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        material.hashCode ^
        type.hashCode ^
        isSelected.hashCode ^
        enchantment.hashCode ^
        fitForDruid.hashCode ^
        defenseBonus.hashCode ^
        checkPenalty.hashCode ^
        maxDexAllowed.hashCode ^
        speedPenalty.hashCode ^
        price.hashCode;
  }
}
