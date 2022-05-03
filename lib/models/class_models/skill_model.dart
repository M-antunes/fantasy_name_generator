import 'package:flutter/foundation.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';

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
  int boostValue;
  List<KeyValueModel> boostedByItems;
  List<KeyValueModel> raceBosst;
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
    this.boostValue = 0,
    this.boostedByItems = const [],
    this.raceBosst = const [],
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
    int? boostValue,
    List<KeyValueModel>? boostedByItems,
    List<KeyValueModel>? raceBosst,
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
      boostValue: boostValue ?? this.boostValue,
      boostedByItems: boostedByItems ?? this.boostedByItems,
      raceBosst: raceBosst ?? this.raceBosst,
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
      'boostValue': boostValue,
      'boostedByItems': boostedByItems.map((x) => x.toMap()).toList(),
      'raceBosst': raceBosst.map((x) => x.toMap()).toList(),
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
      boostValue: map['boostValue']?.toInt() ?? 0,
      boostedByItems: List<KeyValueModel>.from(
          map['boostedByItems']?.map((x) => KeyValueModel.fromMap(x))),
      raceBosst: List<KeyValueModel>.from(
          map['raceBosst']?.map((x) => KeyValueModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SkillModel.fromJson(String source) =>
      SkillModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SkillModel(name: $name, attributeUsed: $attributeUsed, skillOfClasses: $skillOfClasses, hasPenalty: $hasPenalty, initialClassSkill: $initialClassSkill, checkPenalty: $checkPenalty, finalValue: $finalValue, pointsAdded: $pointsAdded, atrbValue: $atrbValue, boostValue: $boostValue, boostedByItems: $boostedByItems, raceBosst: $raceBosst)';
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
        other.atrbValue == atrbValue &&
        other.boostValue == boostValue &&
        listEquals(other.boostedByItems, boostedByItems) &&
        listEquals(other.raceBosst, raceBosst);
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
        atrbValue.hashCode ^
        boostValue.hashCode ^
        boostedByItems.hashCode ^
        raceBosst.hashCode;
  }
}
