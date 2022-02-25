import 'dart:convert';

class EnchantModel {
  final String enchant;
  final int power;
  final String magicPorperty;
  EnchantModel({
    required this.enchant,
    required this.power,
    required this.magicPorperty,
  });

  EnchantModel copyWith({
    String? enchant,
    int? power,
    String? magicPorperty,
  }) {
    return EnchantModel(
      enchant: enchant ?? this.enchant,
      power: power ?? this.power,
      magicPorperty: magicPorperty ?? this.magicPorperty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'enchant': enchant,
      'power': power,
      'magicPorperty': magicPorperty,
    };
  }

  factory EnchantModel.fromMap(Map<String, dynamic> map) {
    return EnchantModel(
      enchant: map['enchant'] ?? '',
      power: map['power']?.toInt() ?? 0,
      magicPorperty: map['magicPorperty'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EnchantModel.fromJson(String source) =>
      EnchantModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'EnchantModel(enchant: $enchant, power: $power, magicPorperty: $magicPorperty)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EnchantModel &&
        other.enchant == enchant &&
        other.power == power &&
        other.magicPorperty == magicPorperty;
  }

  @override
  int get hashCode =>
      enchant.hashCode ^ power.hashCode ^ magicPorperty.hashCode;
}
