import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:fantasy_name_generator/models/key_value.model.dart';

class RaceModel {
  final String name;
  bool isSelected;
  final List<KeyValueModel>? traits;
  KeyValueModel? height;
  String initialIdiom;
  double? weight;
  int? age;
  int? speed;
  String? size;
  String? vision;
  RaceModel({
    required this.name,
    required this.isSelected,
    this.traits,
    this.height,
    required this.initialIdiom,
    this.weight = 0,
    this.age = 0,
    this.speed = 0,
    this.size = "",
    this.vision = "",
  });

  RaceModel copyWith({
    String? name,
    bool? isSelected,
    List<KeyValueModel>? traits,
    KeyValueModel? height,
    String? initialIdiom,
    double? weight,
    int? age,
    int? speed,
    String? size,
    String? vision,
  }) {
    return RaceModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      traits: traits ?? this.traits,
      height: height ?? this.height,
      initialIdiom: initialIdiom ?? this.initialIdiom,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      speed: speed ?? this.speed,
      size: size ?? this.size,
      vision: vision ?? this.vision,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
      'traits': traits?.map((x) => x.toMap()).toList(),
      'height': height?.toMap(),
      'initialIdiom': initialIdiom,
      'weight': weight,
      'age': age,
      'speed': speed,
      'size': size,
      'vision': vision,
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
      height:
          map['height'] != null ? KeyValueModel.fromMap(map['height']) : null,
      initialIdiom: map['initialIdiom'] ?? '',
      weight: map['weight']?.toDouble(),
      age: map['age']?.toInt(),
      speed: map['speed']?.toInt(),
      size: map['size'],
      vision: map['vision'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RaceModel.fromJson(String source) =>
      RaceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RaceModel(name: $name, isSelected: $isSelected, traits: $traits, height: $height, initialIdiom: $initialIdiom, weight: $weight, age: $age, speed: $speed, size: $size, vision: $vision)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RaceModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        listEquals(other.traits, traits) &&
        other.height == height &&
        other.initialIdiom == initialIdiom &&
        other.weight == weight &&
        other.age == age &&
        other.speed == speed &&
        other.size == size &&
        other.vision == vision;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        isSelected.hashCode ^
        traits.hashCode ^
        height.hashCode ^
        initialIdiom.hashCode ^
        weight.hashCode ^
        age.hashCode ^
        speed.hashCode ^
        size.hashCode ^
        vision.hashCode;
  }
}
