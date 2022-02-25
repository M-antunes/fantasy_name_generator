import 'dart:convert';

import 'enchant_model.dart';

class ShieldModel {
  final String type;
  final EnchantModel? enchantment;
  final int? power;
  ShieldModel({
    required this.type,
    this.enchantment,
    this.power,
  });

  ShieldModel copyWith({
    String? type,
    EnchantModel? enchantment,
    int? power,
  }) {
    return ShieldModel(
      type: type ?? this.type,
      enchantment: enchantment ?? this.enchantment,
      power: power ?? this.power,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'enchantment': enchantment?.toMap(),
      'power': power,
    };
  }

  factory ShieldModel.fromMap(Map<String, dynamic> map) {
    return ShieldModel(
      type: map['type'] ?? '',
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
  String toString() =>
      'ShieldModel(type: $type, enchantment: $enchantment, power: $power)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShieldModel &&
        other.type == type &&
        other.enchantment == enchantment &&
        other.power == power;
  }

  @override
  int get hashCode => type.hashCode ^ enchantment.hashCode ^ power.hashCode;
}
