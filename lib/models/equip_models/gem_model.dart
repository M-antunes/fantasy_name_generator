import 'dart:convert';

class GemModel {
  final String name;
  final int price;
  final int availabelAfterLevel;
  GemModel({
    required this.name,
    required this.price,
    required this.availabelAfterLevel,
  });

  GemModel copyWith({
    String? name,
    int? price,
    int? availabelAfterLevel,
  }) {
    return GemModel(
      name: name ?? this.name,
      price: price ?? this.price,
      availabelAfterLevel: availabelAfterLevel ?? this.availabelAfterLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'availabelAfterLevel': availabelAfterLevel,
    };
  }

  factory GemModel.fromMap(Map<String, dynamic> map) {
    return GemModel(
      name: map['name'] ?? '',
      price: map['price']?.toInt() ?? 0,
      availabelAfterLevel: map['availabelAfterLevel']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory GemModel.fromJson(String source) =>
      GemModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'GemModel(name: $name, price: $price, availabelAfterLevel: $availabelAfterLevel)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GemModel &&
        other.name == name &&
        other.price == price &&
        other.availabelAfterLevel == availabelAfterLevel;
  }

  @override
  int get hashCode =>
      name.hashCode ^ price.hashCode ^ availabelAfterLevel.hashCode;
}
