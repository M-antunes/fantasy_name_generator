import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fantasy_name_generator/models/key_value.model.dart';

class LootModel {
  final List<KeyValueModel>? items;
  final List<KeyValueModel>? jwels;
  final int? gold;
  LootModel({
    this.items,
    this.jwels,
    this.gold = 0,
  });

  LootModel copyWith({
    List<KeyValueModel>? items,
    List<KeyValueModel>? jwels,
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
          ? List<KeyValueModel>.from(
              map['items']?.map((x) => KeyValueModel.fromMap(x)))
          : null,
      jwels: map['jwels'] != null
          ? List<KeyValueModel>.from(
              map['jwels']?.map((x) => KeyValueModel.fromMap(x)))
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
