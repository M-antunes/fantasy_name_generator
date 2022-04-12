import 'dart:convert';

import 'package:flutter/foundation.dart';

class SkillModel {
  final String name;
  final String atributeUsed;
  final List<String> skillOfClasses;
  final bool checkPenalty;
  final int value;
  SkillModel({
    this.name = '',
    this.atributeUsed = '',
    this.skillOfClasses = const [],
    this.checkPenalty = false,
    this.value = 0,
  });

  SkillModel copyWith({
    String? name,
    String? atributeUsed,
    List<String>? skillOfClasses,
    bool? checkPenalty,
    int? value,
  }) {
    return SkillModel(
      name: name ?? this.name,
      atributeUsed: atributeUsed ?? this.atributeUsed,
      skillOfClasses: skillOfClasses ?? this.skillOfClasses,
      checkPenalty: checkPenalty ?? this.checkPenalty,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'atributeUsed': atributeUsed,
      'skillOfClasses': skillOfClasses,
      'checkPenalty': checkPenalty,
      'value': value,
    };
  }

  factory SkillModel.fromMap(Map<String, dynamic> map) {
    return SkillModel(
      name: map['name'] ?? '',
      atributeUsed: map['atributeUsed'] ?? '',
      skillOfClasses: List<String>.from(map['skillOfClasses']),
      checkPenalty: map['checkPenalty'] ?? false,
      value: map['value']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SkillModel.fromJson(String source) =>
      SkillModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SkillModel(name: $name, atributeUsed: $atributeUsed, skillOfClasses: $skillOfClasses, checkPenalty: $checkPenalty, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SkillModel &&
        other.name == name &&
        other.atributeUsed == atributeUsed &&
        listEquals(other.skillOfClasses, skillOfClasses) &&
        other.checkPenalty == checkPenalty &&
        other.value == value;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        atributeUsed.hashCode ^
        skillOfClasses.hashCode ^
        checkPenalty.hashCode ^
        value.hashCode;
  }
}
