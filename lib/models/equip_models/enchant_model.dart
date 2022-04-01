import 'dart:convert';

class EnchantModel {
  final String enchant;
  final int power;
  final int availability;
  final int enchantPrice;
  final String magicalPorperty;
  final String? additionalDiceDamage;
  EnchantModel({
    required this.enchant,
    required this.power,
    required this.availability,
    required this.enchantPrice,
    required this.magicalPorperty,
    this.additionalDiceDamage,
  });

  EnchantModel copyWith({
    String? enchant,
    int? power,
    int? availability,
    int? enchantPrice,
    String? magicalPorperty,
    String? additionalDiceDamage,
  }) {
    return EnchantModel(
      enchant: enchant ?? this.enchant,
      power: power ?? this.power,
      availability: availability ?? this.availability,
      enchantPrice: enchantPrice ?? this.enchantPrice,
      magicalPorperty: magicalPorperty ?? this.magicalPorperty,
      additionalDiceDamage: additionalDiceDamage ?? this.additionalDiceDamage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'enchant': enchant,
      'power': power,
      'availability': availability,
      'enchantPrice': enchantPrice,
      'magicalPorperty': magicalPorperty,
      'additionalDiceDamage': additionalDiceDamage,
    };
  }

  factory EnchantModel.fromMap(Map<String, dynamic> map) {
    return EnchantModel(
      enchant: map['enchant'] ?? '',
      power: map['power']?.toInt() ?? 0,
      availability: map['availability']?.toInt() ?? 0,
      enchantPrice: map['enchantPrice']?.toInt() ?? 0,
      magicalPorperty: map['magicalPorperty'] ?? '',
      additionalDiceDamage: map['additionalDiceDamage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EnchantModel.fromJson(String source) =>
      EnchantModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EnchantModel(enchant: $enchant, power: $power, availability: $availability, enchantPrice: $enchantPrice, magicalPorperty: $magicalPorperty, additionalDiceDamage: $additionalDiceDamage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EnchantModel &&
        other.enchant == enchant &&
        other.power == power &&
        other.availability == availability &&
        other.enchantPrice == enchantPrice &&
        other.magicalPorperty == magicalPorperty &&
        other.additionalDiceDamage == additionalDiceDamage;
  }

  @override
  int get hashCode {
    return enchant.hashCode ^
        power.hashCode ^
        availability.hashCode ^
        enchantPrice.hashCode ^
        magicalPorperty.hashCode ^
        additionalDiceDamage.hashCode;
  }
}
