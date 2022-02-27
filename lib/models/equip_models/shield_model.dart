import 'dart:convert';

import 'enchant_model.dart';

class ShieldModel {
  final String name;
  final String? material;
  final EnchantModel? enchantment;
  final int? power;
  ShieldModel({
    required this.name,
    this.material,
    this.enchantment,
    this.power,
  });

  ShieldModel copyWith({
    String? name,
    String? material,
    EnchantModel? enchantment,
    int? power,
  }) {
    return ShieldModel(
      name: name ?? this.name,
      material: material ?? this.material,
      enchantment: enchantment ?? this.enchantment,
      power: power ?? this.power,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'material': material,
      'enchantment': enchantment?.toMap(),
      'power': power,
    };
  }

  factory ShieldModel.fromMap(Map<String, dynamic> map) {
    return ShieldModel(
      name: map['name'] ?? '',
      material: map['material'],
      enchantment: map['enchantment'] != null
          ? EnchantModel.fromMap(map['enchantment'])
          : null,
      power: map['power']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShieldModel.fromJson(String source) =>
      ShieldModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShieldModel(name: $name, material: $material, enchantment: $enchantment, power: $power)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShieldModel &&
        other.name == name &&
        other.material == material &&
        other.enchantment == enchantment &&
        other.power == power;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        material.hashCode ^
        enchantment.hashCode ^
        power.hashCode;
  }
}
