import 'dart:convert';

import 'enchant_model.dart';

class ArmourModel {
  final String type;
  final EnchantModel? enchantment;
  final int power;
  ArmourModel({
    required this.type,
    this.enchantment,
    required this.power,
  });

  ArmourModel copyWith({
    String? type,
    EnchantModel? enchantment,
    int? power,
  }) {
    return ArmourModel(
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

  factory ArmourModel.fromMap(Map<String, dynamic> map) {
    return ArmourModel(
      type: map['type'] ?? '',
      enchantment: map['enchantment'] != null
          ? EnchantModel.fromMap(map['enchantment'])
          : null,
      power: map['power']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArmourModel.fromJson(String source) =>
      ArmourModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ArmourModel(type: $type, enchantment: $enchantment, power: $power)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArmourModel &&
        other.type == type &&
        other.enchantment == enchantment &&
        other.power == power;
  }

  @override
  int get hashCode => type.hashCode ^ enchantment.hashCode ^ power.hashCode;
}
