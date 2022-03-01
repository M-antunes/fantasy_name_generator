import 'dart:convert';

import 'enchant_model.dart';

class WeaponModel {
  final String? weaponType;
  final String? name;
  final EnchantModel? enchantment;
  final int? power;
  final String? damage;
  WeaponModel({
    this.weaponType,
    this.name,
    this.enchantment,
    this.power,
    this.damage,
  });

  WeaponModel copyWith({
    String? weaponType,
    String? name,
    EnchantModel? enchantment,
    int? power,
    String? damage,
  }) {
    return WeaponModel(
      weaponType: weaponType ?? this.weaponType,
      name: name ?? this.name,
      enchantment: enchantment ?? this.enchantment,
      power: power ?? this.power,
      damage: damage ?? this.damage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weaponType': weaponType,
      'name': name,
      'enchantment': enchantment?.toMap(),
      'power': power,
      'damage': damage,
    };
  }

  factory WeaponModel.fromMap(Map<String, dynamic> map) {
    return WeaponModel(
      weaponType: map['weaponType'],
      name: map['name'],
      enchantment: map['enchantment'] != null
          ? EnchantModel.fromMap(map['enchantment'])
          : null,
      power: map['power']?.toInt(),
      damage: map['damage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeaponModel.fromJson(String source) =>
      WeaponModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WeaponModel(weaponType: $weaponType, name: $name, enchantment: $enchantment, power: $power, damage: $damage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WeaponModel &&
        other.weaponType == weaponType &&
        other.name == name &&
        other.enchantment == enchantment &&
        other.power == power &&
        other.damage == damage;
  }

  @override
  int get hashCode {
    return weaponType.hashCode ^
        name.hashCode ^
        enchantment.hashCode ^
        power.hashCode ^
        damage.hashCode;
  }
}
