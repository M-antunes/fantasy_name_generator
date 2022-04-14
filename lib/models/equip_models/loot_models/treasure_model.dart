import 'dart:convert';

class TreasureModel {
  final String name;
  final int price;
  int qnt;
  int finalPrice;
  final String? description;
  TreasureModel({
    required this.name,
    required this.price,
    required this.qnt,
    required this.finalPrice,
    this.description,
  });

  TreasureModel copyWith({
    String? name,
    int? price,
    int? qnt,
    int? finalPrice,
    String? description,
  }) {
    return TreasureModel(
      name: name ?? this.name,
      price: price ?? this.price,
      qnt: qnt ?? this.qnt,
      finalPrice: finalPrice ?? this.finalPrice,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'qnt': qnt,
      'finalPrice': finalPrice,
      'description': description,
    };
  }

  factory TreasureModel.fromMap(Map<String, dynamic> map) {
    return TreasureModel(
      name: map['name'] ?? '',
      price: map['price']?.toInt() ?? 0,
      qnt: map['qnt']?.toInt() ?? 0,
      finalPrice: map['finalPrice']?.toInt() ?? 0,
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TreasureModel.fromJson(String source) =>
      TreasureModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TreasureModel(name: $name, price: $price, qnt: $qnt, finalPrice: $finalPrice, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TreasureModel &&
        other.name == name &&
        other.price == price &&
        other.qnt == qnt &&
        other.finalPrice == finalPrice &&
        other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        qnt.hashCode ^
        finalPrice.hashCode ^
        description.hashCode;
  }
}
