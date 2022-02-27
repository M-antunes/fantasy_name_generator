import 'dart:convert';

import 'enchant_model.dart';

class ArmourModel {
  final String name;
  final String? material;
  final EnchantModel? enchantment;
  final int? power;
  ArmourModel({
    required this.name,
    this.material,
    this.enchantment,
    this.power,
  });

  ArmourModel copyWith({
    String? name,
    String? material,
    EnchantModel? enchantment,
    int? power,
  }) {
    return ArmourModel(
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

  factory ArmourModel.fromMap(Map<String, dynamic> map) {
    return ArmourModel(
      name: map['name'] ?? '',
      material: map['material'],
      enchantment: map['enchantment'] != null
          ? EnchantModel.fromMap(map['enchantment'])
          : null,
      power: map['power']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArmourModel.fromJson(String source) =>
      ArmourModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ArmourModel(name: $name, material: $material, enchantment: $enchantment, power: $power)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArmourModel &&
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
