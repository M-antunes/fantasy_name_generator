import 'dart:convert';

import 'package:flutter/foundation.dart';

class LootModel {
  final List<String>? items;
  final int? gold;
  LootModel({
    required this.items,
    this.gold = 0,
  });

  LootModel copyWith({
    List<String>? items,
    int? gold,
  }) {
    return LootModel(
      items: items ?? this.items,
      gold: gold ?? this.gold,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'items': items,
      'gold': gold,
    };
  }

  factory LootModel.fromMap(Map<String, dynamic> map) {
    return LootModel(
      items: List<String>.from(map['items']),
      gold: map['gold']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory LootModel.fromJson(String source) =>
      LootModel.fromMap(json.decode(source));

  @override
  String toString() => 'LootModel(items: $items, gold: $gold)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LootModel &&
        listEquals(other.items, items) &&
        other.gold == gold;
  }

  @override
  int get hashCode => items.hashCode ^ gold.hashCode;
}
