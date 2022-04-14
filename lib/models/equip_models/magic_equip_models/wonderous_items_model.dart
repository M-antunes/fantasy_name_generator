import 'dart:convert';

import 'package:flutter/foundation.dart';

class WonderousItemsModel {
  final String? type;
  final String? name;
  final String? description;
  final int? price;
  final int availability;
  final List<String> exclusiveClasses;
  final int? bonus;
  final String? additionalInfo;
  bool isSelected;
  WonderousItemsModel({
    this.type,
    this.name,
    this.description,
    this.price,
    required this.availability,
    required this.exclusiveClasses,
    this.bonus,
    this.additionalInfo,
    this.isSelected = false,
  });

  WonderousItemsModel copyWith({
    String? type,
    String? name,
    String? description,
    int? price,
    int? availability,
    List<String>? exclusiveClasses,
    int? bonus,
    String? additionalInfo,
    bool? isSelected,
  }) {
    return WonderousItemsModel(
      type: type ?? this.type,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      availability: availability ?? this.availability,
      exclusiveClasses: exclusiveClasses ?? this.exclusiveClasses,
      bonus: bonus ?? this.bonus,
      additionalInfo: additionalInfo ?? this.additionalInfo,
      isSelected: isSelected ?? this.isSelected,
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
      'additionalInfo': additionalInfo,
      'isSelected': isSelected,
    };
  }

  factory WonderousItemsModel.fromMap(Map<String, dynamic> map) {
    return WonderousItemsModel(
      type: map['type'],
      name: map['name'],
      description: map['description'],
      price: map['price']?.toInt(),
      availability: map['availability']?.toInt() ?? 0,
      exclusiveClasses: List<String>.from(map['exclusiveClasses']),
      bonus: map['bonus']?.toInt(),
      additionalInfo: map['additionalInfo'],
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory WonderousItemsModel.fromJson(String source) =>
      WonderousItemsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WonderousItemsModel(type: $type, name: $name, description: $description, price: $price, availability: $availability, exclusiveClasses: $exclusiveClasses, bonus: $bonus, additionalInfo: $additionalInfo, isSelected: $isSelected)';
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
        listEquals(other.exclusiveClasses, exclusiveClasses) &&
        other.bonus == bonus &&
        other.additionalInfo == additionalInfo &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        availability.hashCode ^
        exclusiveClasses.hashCode ^
        bonus.hashCode ^
        additionalInfo.hashCode ^
        isSelected.hashCode;
  }
}
