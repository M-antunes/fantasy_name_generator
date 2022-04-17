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
  int mundanePrice;
  int fullPrice;
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
    this.mundanePrice = 0,
    this.fullPrice = 0,
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
    int? mundanePrice,
    int? fullPrice,
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
      mundanePrice: mundanePrice ?? this.mundanePrice,
      fullPrice: fullPrice ?? this.fullPrice,
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
      'mundanePrice': mundanePrice,
      'fullPrice': fullPrice,
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
      defenseBonus: map['defenseBonus']?.toInt() ?? 0,
      checkPenalty: map['checkPenalty']?.toInt() ?? 0,
      maxDexAllowed: map['maxDexAllowed']?.toInt() ?? 0,
      speedPenalty: map['speedPenalty']?.toInt() ?? 0,
      mundanePrice: map['mundanePrice']?.toInt() ?? 0,
      fullPrice: map['fullPrice']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArmorModel.fromJson(String source) =>
      ArmorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArmorModel(name: $name, material: $material, type: $type, isSelected: $isSelected, enchantment: $enchantment, fitForDruid: $fitForDruid, defenseBonus: $defenseBonus, checkPenalty: $checkPenalty, maxDexAllowed: $maxDexAllowed, speedPenalty: $speedPenalty, mundanePrice: $mundanePrice, fullPrice: $fullPrice)';
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
        other.mundanePrice == mundanePrice &&
        other.fullPrice == fullPrice;
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
        mundanePrice.hashCode ^
        fullPrice.hashCode;
  }
}
