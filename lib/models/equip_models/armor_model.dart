import 'dart:convert';

import 'package:fantasy_name_generator/models/equip_models/armor_type_model.dart';

import 'enchant_model.dart';

class ArmorModel {
  String? name;
  String? material;
  ArmorFamilyModel? type;
  bool? isSelected;
  EnchantModel? enchantment;
  bool fitForDruid;
  int? power;
  int? defenseBonus;
  int? checkPenalty;
  int? maxDexAllowed;
  int? speedPenalty;
  ArmorModel({
    this.name,
    this.material,
    this.type,
    this.isSelected,
    this.enchantment,
    this.fitForDruid = true,
    this.power,
    this.defenseBonus,
    this.checkPenalty,
    this.maxDexAllowed,
    this.speedPenalty,
  });

  ArmorModel copyWith({
    String? name,
    String? material,
    ArmorFamilyModel? type,
    bool? isSelected,
    EnchantModel? enchantment,
    bool? fitForDruid,
    int? power,
    int? defenseBonus,
    int? checkPenalty,
    int? maxDexAllowed,
    int? speedPenalty,
  }) {
    return ArmorModel(
      name: name ?? this.name,
      material: material ?? this.material,
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
      enchantment: enchantment ?? this.enchantment,
      fitForDruid: fitForDruid ?? this.fitForDruid,
      power: power ?? this.power,
      defenseBonus: defenseBonus ?? this.defenseBonus,
      checkPenalty: checkPenalty ?? this.checkPenalty,
      maxDexAllowed: maxDexAllowed ?? this.maxDexAllowed,
      speedPenalty: speedPenalty ?? this.speedPenalty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'material': material,
      'type': type?.toMap(),
      'isSelected': isSelected,
      'enchantment': enchantment?.toMap(),
      'fitForDruid': fitForDruid,
      'power': power,
      'defenseBonus': defenseBonus,
      'checkPenalty': checkPenalty,
      'maxDexAllowed': maxDexAllowed,
      'speedPenalty': speedPenalty,
    };
  }

  factory ArmorModel.fromMap(Map<String, dynamic> map) {
    return ArmorModel(
      name: map['name'],
      material: map['material'],
      type: map['type'] != null ? ArmorFamilyModel.fromMap(map['type']) : null,
      isSelected: map['isSelected'],
      enchantment: map['enchantment'] != null
          ? EnchantModel.fromMap(map['enchantment'])
          : null,
      fitForDruid: map['fitForDruid'] ?? false,
      power: map['power']?.toInt(),
      defenseBonus: map['defenseBonus']?.toInt(),
      checkPenalty: map['checkPenalty']?.toInt(),
      maxDexAllowed: map['maxDexAllowed']?.toInt(),
      speedPenalty: map['speedPenalty']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArmorModel.fromJson(String source) =>
      ArmorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArmorModel(name: $name, material: $material, type: $type, isSelected: $isSelected, enchantment: $enchantment, fitForDruid: $fitForDruid, power: $power, defenseBonus: $defenseBonus, checkPenalty: $checkPenalty, maxDexAllowed: $maxDexAllowed, speedPenalty: $speedPenalty)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArmorModel &&
        other.name == name &&
        other.material == material &&
        other.type == type &&
        other.isSelected == isSelected &&
        other.enchantment == enchantment &&
        other.fitForDruid == fitForDruid &&
        other.power == power &&
        other.defenseBonus == defenseBonus &&
        other.checkPenalty == checkPenalty &&
        other.maxDexAllowed == maxDexAllowed &&
        other.speedPenalty == speedPenalty;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        material.hashCode ^
        type.hashCode ^
        isSelected.hashCode ^
        enchantment.hashCode ^
        fitForDruid.hashCode ^
        power.hashCode ^
        defenseBonus.hashCode ^
        checkPenalty.hashCode ^
        maxDexAllowed.hashCode ^
        speedPenalty.hashCode;
  }
}
