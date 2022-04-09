import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'treasure_model.dart';

class LootModel {
  List<TreasureModel>? items;
  List<TreasureModel>? jwels;
  int? gold;
  LootModel({
    this.items = const [],
    this.jwels = const [],
    this.gold = 0,
  });

  LootModel copyWith({
    List<TreasureModel>? items,
    List<TreasureModel>? jwels,
    int? gold,
  }) {
    return LootModel(
      items: items ?? this.items,
      jwels: jwels ?? this.jwels,
      gold: gold ?? this.gold,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'items': items?.map((x) => x.toMap()).toList(),
      'jwels': jwels?.map((x) => x.toMap()).toList(),
      'gold': gold,
    };
  }

  factory LootModel.fromMap(Map<String, dynamic> map) {
    return LootModel(
      items: map['items'] != null
          ? List<TreasureModel>.from(
              map['items']?.map((x) => TreasureModel.fromMap(x)))
          : null,
      jwels: map['jwels'] != null
          ? List<TreasureModel>.from(
              map['jwels']?.map((x) => TreasureModel.fromMap(x)))
          : null,
      gold: map['gold']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory LootModel.fromJson(String source) =>
      LootModel.fromMap(json.decode(source));

  @override
  String toString() => 'LootModel(items: $items, jwels: $jwels, gold: $gold)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LootModel &&
        listEquals(other.items, items) &&
        listEquals(other.jwels, jwels) &&
        other.gold == gold;
  }

  @override
  int get hashCode => items.hashCode ^ jwels.hashCode ^ gold.hashCode;
}
