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
  int itemBoostValue;
  int raceBoostValue;
  List<KeyValueModel> boostedByItems;
  List<KeyValueModel> boostRaceList;
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
    this.itemBoostValue = 0,
    this.raceBoostValue = 0,
    this.boostedByItems = const [],
    this.boostRaceList = const [],
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
    int? itemBoostValue,
    int? raceBoostValue,
    List<KeyValueModel>? boostedByItems,
    List<KeyValueModel>? boostRaceList,
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
      itemBoostValue: itemBoostValue ?? this.itemBoostValue,
      raceBoostValue: raceBoostValue ?? this.raceBoostValue,
      boostedByItems: boostedByItems ?? this.boostedByItems,
      boostRaceList: boostRaceList ?? this.boostRaceList,
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
      'itemBoostValue': itemBoostValue,
      'raceBoostValue': raceBoostValue,
      'boostedByItems': boostedByItems.map((x) => x.toMap()).toList(),
      'boostRaceList': boostRaceList.map((x) => x.toMap()).toList(),
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
      itemBoostValue: map['itemBoostValue']?.toInt() ?? 0,
      raceBoostValue: map['raceBoostValue']?.toInt() ?? 0,
      boostedByItems: List<KeyValueModel>.from(
          map['boostedByItems']?.map((x) => KeyValueModel.fromMap(x))),
      boostRaceList: List<KeyValueModel>.from(
          map['boostRaceList']?.map((x) => KeyValueModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SkillModel.fromJson(String source) =>
      SkillModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SkillModel(name: $name, attributeUsed: $attributeUsed, skillOfClasses: $skillOfClasses, hasPenalty: $hasPenalty, initialClassSkill: $initialClassSkill, checkPenalty: $checkPenalty, finalValue: $finalValue, pointsAdded: $pointsAdded, atrbValue: $atrbValue, itemBoostValue: $itemBoostValue, raceBoostValue: $raceBoostValue, boostedByItems: $boostedByItems, boostRaceList: $boostRaceList)';
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
        other.itemBoostValue == itemBoostValue &&
        other.raceBoostValue == raceBoostValue &&
        listEquals(other.boostedByItems, boostedByItems) &&
        listEquals(other.boostRaceList, boostRaceList);
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
        itemBoostValue.hashCode ^
        raceBoostValue.hashCode ^
        boostedByItems.hashCode ^
        boostRaceList.hashCode;
  }
}
