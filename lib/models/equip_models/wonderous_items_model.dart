import 'dart:convert';

class WonderousItemsModel {
  final String? type;
  final String? name;
  final String? description;
  final int? price;
  final int? availability;
  final String? exclusiveClasses;
  final int? bonus;
  WonderousItemsModel({
    this.type,
    this.name,
    this.description,
    this.price,
    this.availability,
    this.exclusiveClasses,
    this.bonus,
  });

  WonderousItemsModel copyWith({
    String? type,
    String? name,
    String? description,
    int? price,
    int? availability,
    String? exclusiveClasses,
    int? bonus,
  }) {
    return WonderousItemsModel(
      type: type ?? this.type,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      availability: availability ?? this.availability,
      exclusiveClasses: exclusiveClasses ?? this.exclusiveClasses,
      bonus: bonus ?? this.bonus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'name': name,
      'description': description,
      'price': price,
      'availability': availability,
      'exclusiveClasses': exclusiveClasses,
      'bonus': bonus,
    };
  }

  factory WonderousItemsModel.fromMap(Map<String, dynamic> map) {
    return WonderousItemsModel(
      type: map['type'],
      name: map['name'],
      description: map['description'],
      price: map['price']?.toInt(),
      availability: map['availability']?.toInt(),
      exclusiveClasses: map['exclusiveClasses'],
      bonus: map['bonus']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory WonderousItemsModel.fromJson(String source) =>
      WonderousItemsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WonderousItemsModel(type: $type, name: $name, description: $description, price: $price, availability: $availability, exclusiveClasses: $exclusiveClasses, bonus: $bonus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WonderousItemsModel &&
        other.type == type &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.availability == availability &&
        other.exclusiveClasses == exclusiveClasses &&
        other.bonus == bonus;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        availability.hashCode ^
        exclusiveClasses.hashCode ^
        bonus.hashCode;
  }
}
