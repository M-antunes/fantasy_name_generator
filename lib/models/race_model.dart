import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fantasy_name_generator/models/key_value.model.dart';

class RaceModel {
  final String name;
  bool isSelected;
  final List<KeyValueModel>? traits;
  RaceModel({
    required this.name,
    required this.isSelected,
    this.traits,
  });

  RaceModel copyWith({
    String? name,
    bool? isSelected,
    List<KeyValueModel>? traits,
  }) {
    return RaceModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      traits: traits ?? this.traits,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
      'traits': traits?.map((x) => x.toMap()).toList(),
    };
  }

  factory RaceModel.fromMap(Map<String, dynamic> map) {
    return RaceModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
      traits: map['traits'] != null
          ? List<KeyValueModel>.from(
              map['traits']?.map((x) => KeyValueModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RaceModel.fromJson(String source) =>
      RaceModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'RaceModel(name: $name, isSelected: $isSelected, traits: $traits)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RaceModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        listEquals(other.traits, traits);
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode ^ traits.hashCode;
}
