import 'dart:convert';

import 'package:flutter/foundation.dart';

class PhysicalStyleModel {
  final String name;
  final String svg;
  final String weaponType;
  bool isSelected;
  final List<String> forbiddenClasses;
  PhysicalStyleModel({
    required this.name,
    required this.svg,
    required this.weaponType,
    required this.isSelected,
    required this.forbiddenClasses,
  });

  PhysicalStyleModel copyWith({
    String? name,
    String? svg,
    String? weaponType,
    bool? isSelected,
    List<String>? forbiddenClasses,
  }) {
    return PhysicalStyleModel(
      name: name ?? this.name,
      svg: svg ?? this.svg,
      weaponType: weaponType ?? this.weaponType,
      isSelected: isSelected ?? this.isSelected,
      forbiddenClasses: forbiddenClasses ?? this.forbiddenClasses,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'svg': svg,
      'weaponType': weaponType,
      'isSelected': isSelected,
      'forbiddenClasses': forbiddenClasses,
    };
  }

  factory PhysicalStyleModel.fromMap(Map<String, dynamic> map) {
    return PhysicalStyleModel(
      name: map['name'] ?? '',
      svg: map['svg'] ?? '',
      weaponType: map['weaponType'] ?? '',
      isSelected: map['isSelected'] ?? false,
      forbiddenClasses: List<String>.from(map['forbiddenClasses']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PhysicalStyleModel.fromJson(String source) =>
      PhysicalStyleModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PhysicalStyleModel(name: $name, svg: $svg, weaponType: $weaponType, isSelected: $isSelected, forbiddenClasses: $forbiddenClasses)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhysicalStyleModel &&
        other.name == name &&
        other.svg == svg &&
        other.weaponType == weaponType &&
        other.isSelected == isSelected &&
        listEquals(other.forbiddenClasses, forbiddenClasses);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        svg.hashCode ^
        weaponType.hashCode ^
        isSelected.hashCode ^
        forbiddenClasses.hashCode;
  }
}
