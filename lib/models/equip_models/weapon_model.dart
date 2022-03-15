import 'dart:convert';

import 'package:fantasy_name_generator/models/equip_models/weapon_type_model.dart';

import 'enchant_model.dart';

class WeaponModel {
  final WeaponFamilyModel? type;
  bool? isSelected;
  final String? name;
  final EnchantModel? enchantment;
  final int? power;
  final String? damage;
  final String? critical;
  WeaponModel({
    this.type,
    this.isSelected,
    this.name,
    this.enchantment,
    this.power,
    this.damage,
    this.critical,
  });

  WeaponModel copyWith({
    WeaponFamilyModel? type,
    bool? isSelected,
    String? name,
    EnchantModel? enchantment,
    int? power,
    String? damage,
    String? critical,
  }) {
    return WeaponModel(
      type: type ?? this.type,
      isSelected: isSelected ?? this.isSelected,
      name: name ?? this.name,
      enchantment: enchantment ?? this.enchantment,
      power: power ?? this.power,
      damage: damage ?? this.damage,
      critical: critical ?? this.critical,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type?.toMap(),
      'isSelected': isSelected,
      'name': name,
      'enchantment': enchantment?.toMap(),
      'power': power,
      'damage': damage,
      'critical': critical,
    };
  }

  factory WeaponModel.fromMap(Map<String, dynamic> map) {
    return WeaponModel(
      type: map['type'] != null ? WeaponFamilyModel.fromMap(map['type']) : null,
      isSelected: map['isSelected'],
      name: map['name'],
      enchantment: map['enchantment'] != null
          ? EnchantModel.fromMap(map['enchantment'])
          : null,
      power: map['power']?.toInt(),
      damage: map['damage'],
      critical: map['critical'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeaponModel.fromJson(String source) =>
      WeaponModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeaponModel(type: $type, isSelected: $isSelected, name: $name, enchantment: $enchantment, power: $power, damage: $damage, critical: $critical)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeaponModel &&
        other.type == type &&
        other.isSelected == isSelected &&
        other.name == name &&
        other.enchantment == enchantment &&
        other.power == power &&
        other.damage == damage &&
        other.critical == critical;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        isSelected.hashCode ^
        name.hashCode ^
        enchantment.hashCode ^
        power.hashCode ^
        damage.hashCode ^
        critical.hashCode;
  }
}
