import 'dart:convert';

import 'enchant_model.dart';

class ArmourModel {
  final String name;
  final String? material;
  final String? type;
  bool? isSelected;
  final EnchantModel? enchantment;
  final int? power;
  final int? defenseBonus;
  ArmourModel({
    required this.name,
    this.material,
    this.type,
    this.isSelected,
    this.enchantment,
    this.power,
    this.defenseBonus,
  });

  ArmourModel copyWith({
    String? name,
    String? material,
    String? type,
    bool? isSelected,
    EnchantModel? enchantment,
    int? power,
    int? defenseBonus,
  }) {
    return ArmourModel(
      name: name ?? this.name,
      material: material ?? this.material,
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
      enchantment: enchantment ?? this.enchantment,
      power: power ?? this.power,
      defenseBonus: defenseBonus ?? this.defenseBonus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'material': material,
      'type': type,
      'isSelected': isSelected,
      'enchantment': enchantment?.toMap(),
      'power': power,
      'defenseBonus': defenseBonus,
    };
  }

  factory ArmourModel.fromMap(Map<String, dynamic> map) {
    return ArmourModel(
      name: map['name'] ?? '',
      material: map['material'],
      type: map['type'],
      isSelected: map['isSelected'],
      enchantment: map['enchantment'] != null
          ? EnchantModel.fromMap(map['enchantment'])
          : null,
      power: map['power']?.toInt(),
      defenseBonus: map['defenseBonus']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArmourModel.fromJson(String source) =>
      ArmourModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArmourModel(name: $name, material: $material, type: $type, isSelected: $isSelected, enchantment: $enchantment, power: $power, defenseBonus: $defenseBonus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArmourModel &&
        other.name == name &&
        other.material == material &&
        other.type == type &&
        other.isSelected == isSelected &&
        other.enchantment == enchantment &&
        other.power == power &&
        other.defenseBonus == defenseBonus;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        material.hashCode ^
        type.hashCode ^
        isSelected.hashCode ^
        enchantment.hashCode ^
        power.hashCode ^
        defenseBonus.hashCode;
  }
}
