import 'dart:convert';

import 'package:fantasy_name_generator/models/equip_models/armor_type_model.dart';

import 'enchant_model.dart';

class ArmorModel {
  final String name;
  final String? material;
  final ArmorTypeModel? type;
  final String? picture;
  bool? isSelected;
  final EnchantModel? enchantment;
  final int? power;
  final int? defenseBonus;
  ArmorModel({
    required this.name,
    this.material,
    this.type,
    this.picture,
    this.isSelected,
    this.enchantment,
    this.power,
    this.defenseBonus,
  });

  ArmorModel copyWith({
    String? name,
    String? material,
    ArmorTypeModel? type,
    String? picture,
    bool? isSelected,
    EnchantModel? enchantment,
    int? power,
    int? defenseBonus,
  }) {
    return ArmorModel(
      name: name ?? this.name,
      material: material ?? this.material,
      type: type ?? this.type,
      picture: picture ?? this.picture,
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
      'type': type?.toMap(),
      'picture': picture,
      'isSelected': isSelected,
      'enchantment': enchantment?.toMap(),
      'power': power,
      'defenseBonus': defenseBonus,
    };
  }

  factory ArmorModel.fromMap(Map<String, dynamic> map) {
    return ArmorModel(
      name: map['name'] ?? '',
      material: map['material'],
      type: map['type'] != null ? ArmorTypeModel.fromMap(map['type']) : null,
      picture: map['picture'],
      isSelected: map['isSelected'],
      enchantment: map['enchantment'] != null
          ? EnchantModel.fromMap(map['enchantment'])
          : null,
      power: map['power']?.toInt(),
      defenseBonus: map['defenseBonus']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArmorModel.fromJson(String source) =>
      ArmorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArmorModel(name: $name, material: $material, type: $type, picture: $picture, isSelected: $isSelected, enchantment: $enchantment, power: $power, defenseBonus: $defenseBonus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArmorModel &&
        other.name == name &&
        other.material == material &&
        other.type == type &&
        other.picture == picture &&
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
        picture.hashCode ^
        isSelected.hashCode ^
        enchantment.hashCode ^
        power.hashCode ^
        defenseBonus.hashCode;
  }
}
