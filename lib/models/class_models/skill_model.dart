import 'dart:convert';

import 'package:flutter/foundation.dart';

class SkillModel {
  final String name;
  final String attributeUsed;
  final List<String> skillOfClasses;
  final bool hasPenalty;
  bool initialClassSkill;
  int checkPenalty;
  int finalValue;
  int pointsAdded;
  int atrbValue;
  SkillModel({
    this.name = '',
    this.attributeUsed = '',
    this.skillOfClasses = const [],
    required this.hasPenalty,
    this.initialClassSkill = false,
    this.checkPenalty = 0,
    this.finalValue = 0,
    this.pointsAdded = 0,
    this.atrbValue = 0,
  });

  SkillModel copyWith({
    String? name,
    String? attributeUsed,
    List<String>? skillOfClasses,
    bool? hasPenalty,
    bool? initialClassSkill,
    int? checkPenalty,
    int? finalValue,
    int? pointsAdded,
    int? atrbValue,
  }) {
    return SkillModel(
      name: name ?? this.name,
      attributeUsed: attributeUsed ?? this.attributeUsed,
      skillOfClasses: skillOfClasses ?? this.skillOfClasses,
      hasPenalty: hasPenalty ?? this.hasPenalty,
      initialClassSkill: initialClassSkill ?? this.initialClassSkill,
      checkPenalty: checkPenalty ?? this.checkPenalty,
      finalValue: finalValue ?? this.finalValue,
      pointsAdded: pointsAdded ?? this.pointsAdded,
      atrbValue: atrbValue ?? this.atrbValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'attributeUsed': attributeUsed,
      'skillOfClasses': skillOfClasses,
      'hasPenalty': hasPenalty,
      'initialClassSkill': initialClassSkill,
      'checkPenalty': checkPenalty,
      'finalValue': finalValue,
      'pointsAdded': pointsAdded,
      'atrbValue': atrbValue,
    };
  }

  factory SkillModel.fromMap(Map<String, dynamic> map) {
    return SkillModel(
      name: map['name'] ?? '',
      attributeUsed: map['attributeUsed'] ?? '',
      skillOfClasses: List<String>.from(map['skillOfClasses']),
      hasPenalty: map['hasPenalty'] ?? false,
      initialClassSkill: map['initialClassSkill'] ?? false,
      checkPenalty: map['checkPenalty']?.toInt() ?? 0,
      finalValue: map['finalValue']?.toInt() ?? 0,
      pointsAdded: map['pointsAdded']?.toInt() ?? 0,
      atrbValue: map['atrbValue']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SkillModel.fromJson(String source) =>
      SkillModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SkillModel(name: $name, attributeUsed: $attributeUsed, skillOfClasses: $skillOfClasses, hasPenalty: $hasPenalty, initialClassSkill: $initialClassSkill, checkPenalty: $checkPenalty, finalValue: $finalValue, pointsAdded: $pointsAdded, atrbValue: $atrbValue)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SkillModel &&
        other.name == name &&
        other.attributeUsed == attributeUsed &&
        listEquals(other.skillOfClasses, skillOfClasses) &&
        other.hasPenalty == hasPenalty &&
        other.initialClassSkill == initialClassSkill &&
        other.checkPenalty == checkPenalty &&
        other.finalValue == finalValue &&
        other.pointsAdded == pointsAdded &&
        other.atrbValue == atrbValue;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        attributeUsed.hashCode ^
        skillOfClasses.hashCode ^
        hasPenalty.hashCode ^
        initialClassSkill.hashCode ^
        checkPenalty.hashCode ^
        finalValue.hashCode ^
        pointsAdded.hashCode ^
        atrbValue.hashCode;
  }
}
