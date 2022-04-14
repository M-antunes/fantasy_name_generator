import 'dart:convert';

import 'package:flutter/foundation.dart';

class PhysicalStyleModel {
  final String name;
  final String svg;
  final String weaponType;
  bool isSelected;
  final List<String> forbiddenClasses;
  final String description;
  PhysicalStyleModel({
    required this.name,
    required this.svg,
    required this.weaponType,
    required this.isSelected,
    required this.forbiddenClasses,
    required this.description,
  });

  PhysicalStyleModel copyWith({
    String? name,
    String? svg,
    String? weaponType,
    bool? isSelected,
    List<String>? forbiddenClasses,
    String? description,
  }) {
    return PhysicalStyleModel(
      name: name ?? this.name,
      svg: svg ?? this.svg,
      weaponType: weaponType ?? this.weaponType,
      isSelected: isSelected ?? this.isSelected,
      forbiddenClasses: forbiddenClasses ?? this.forbiddenClasses,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'svg': svg,
      'weaponType': weaponType,
      'isSelected': isSelected,
      'forbiddenClasses': forbiddenClasses,
      'description': description,
    };
  }

  factory PhysicalStyleModel.fromMap(Map<String, dynamic> map) {
    return PhysicalStyleModel(
      name: map['name'] ?? '',
      svg: map['svg'] ?? '',
      weaponType: map['weaponType'] ?? '',
      isSelected: map['isSelected'] ?? false,
      forbiddenClasses: List<String>.from(map['forbiddenClasses']),
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PhysicalStyleModel.fromJson(String source) =>
      PhysicalStyleModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PhysicalStyleModel(name: $name, svg: $svg, weaponType: $weaponType, isSelected: $isSelected, forbiddenClasses: $forbiddenClasses, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhysicalStyleModel &&
        other.name == name &&
        other.svg == svg &&
        other.weaponType == weaponType &&
        other.isSelected == isSelected &&
        listEquals(other.forbiddenClasses, forbiddenClasses) &&
        other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        svg.hashCode ^
        weaponType.hashCode ^
        isSelected.hashCode ^
        forbiddenClasses.hashCode ^
        description.hashCode;
  }
}
