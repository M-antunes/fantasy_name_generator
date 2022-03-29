import 'dart:convert';

class EnchantModel {
  final String enchant;
  final int power;
  final String magicalPorperty;
  final String? additionalDiceDamage;
  EnchantModel({
    required this.enchant,
    required this.power,
    required this.magicalPorperty,
    this.additionalDiceDamage,
  });

  EnchantModel copyWith({
    String? enchant,
    int? power,
    String? magicalPorperty,
    String? additionalDamage,
  }) {
    return EnchantModel(
      enchant: enchant ?? this.enchant,
      power: power ?? this.power,
      magicalPorperty: magicalPorperty ?? this.magicalPorperty,
      additionalDiceDamage: additionalDamage ?? this.additionalDiceDamage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'enchant': enchant,
      'power': power,
      'magicalPorperty': magicalPorperty,
      'additionalDamage': additionalDiceDamage,
    };
  }

  factory EnchantModel.fromMap(Map<String, dynamic> map) {
    return EnchantModel(
      enchant: map['enchant'] ?? '',
      power: map['power']?.toInt() ?? 0,
      magicalPorperty: map['magicalPorperty'] ?? '',
      additionalDiceDamage: map['additionalDamage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EnchantModel.fromJson(String source) =>
      EnchantModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EnchantModel(enchant: $enchant, power: $power, magicalPorperty: $magicalPorperty, additionalDamage: $additionalDiceDamage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EnchantModel &&
        other.enchant == enchant &&
        other.power == power &&
        other.magicalPorperty == magicalPorperty &&
        other.additionalDiceDamage == additionalDiceDamage;
  }

  @override
  int get hashCode {
    return enchant.hashCode ^
        power.hashCode ^
        magicalPorperty.hashCode ^
        additionalDiceDamage.hashCode;
  }
}
