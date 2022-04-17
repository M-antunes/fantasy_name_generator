import 'package:flutter/foundation.dart';

import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';

class CharModel {
  RaceModel charRace;
  NameModel charName;
  PhysicalStyleModel physicalStyle;
  CombatStyleChoiceModel battleStyle;
  AtributeModel baseAtributes;
  AtributeModel modAtributes;
  ClassModel charClass;
  AlignmentModel alignment;
  int hitPoints;
  ResistanceModel resistances;
  CombatModel combatStats;
  EquipModel charEquip;
  LootModel loot;
  int charLevel;
  List<TraitModel> feats;
  List<SkillModel> skills;

  CharModel({
    required this.charRace,
    required this.charName,
    required this.physicalStyle,
    required this.battleStyle,
    required this.baseAtributes,
    required this.modAtributes,
    required this.charClass,
    required this.alignment,
    required this.hitPoints,
    required this.resistances,
    required this.combatStats,
    required this.charEquip,
    required this.loot,
    required this.charLevel,
    required this.feats,
    required this.skills,
  });

  CharModel copyWith({
    RaceModel? charRace,
    NameModel? charName,
    PhysicalStyleModel? physicalStyle,
    CombatStyleChoiceModel? battleStyle,
    AtributeModel? baseAtributes,
    AtributeModel? modAtributes,
    ClassModel? charClass,
    AlignmentModel? alignment,
    int? hitPoints,
    ResistanceModel? resistances,
    CombatModel? combatStats,
    EquipModel? charEquip,
    LootModel? loot,
    int? charLevel,
    List<TraitModel>? feats,
    List<SkillModel>? skills,
  }) {
    return CharModel(
      charRace: charRace ?? this.charRace,
      charName: charName ?? this.charName,
      physicalStyle: physicalStyle ?? this.physicalStyle,
      battleStyle: battleStyle ?? this.battleStyle,
      baseAtributes: baseAtributes ?? this.baseAtributes,
      modAtributes: modAtributes ?? this.modAtributes,
      charClass: charClass ?? this.charClass,
      alignment: alignment ?? this.alignment,
      hitPoints: hitPoints ?? this.hitPoints,
      resistances: resistances ?? this.resistances,
      combatStats: combatStats ?? this.combatStats,
      charEquip: charEquip ?? this.charEquip,
      loot: loot ?? this.loot,
      charLevel: charLevel ?? this.charLevel,
      feats: feats ?? this.feats,
      skills: skills ?? this.skills,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'charRace': charRace.toMap(),
      'charName': charName.toMap(),
      'physicalStyle': physicalStyle.toMap(),
      'battleStyle': battleStyle.toMap(),
      'baseAtributes': baseAtributes.toMap(),
      'modAtributes': modAtributes.toMap(),
      'charClass': charClass.toMap(),
      'alignment': alignment.toMap(),
      'hitPoints': hitPoints,
      'resistances': resistances.toMap(),
      'combatStats': combatStats.toMap(),
      'charEquip': charEquip.toMap(),
      'loot': loot.toMap(),
      'charLevel': charLevel,
      'feats': feats.map((x) => x.toMap()).toList(),
      'skills': skills.map((x) => x.toMap()).toList(),
    };
  }

  factory CharModel.fromMap(Map<String, dynamic> map) {
    return CharModel(
      charRace: RaceModel.fromMap(map['charRace']),
      charName: NameModel.fromMap(map['charName']),
      physicalStyle: PhysicalStyleModel.fromMap(map['physicalStyle']),
      battleStyle: CombatStyleChoiceModel.fromMap(map['battleStyle']),
      baseAtributes: AtributeModel.fromMap(map['baseAtributes']),
      modAtributes: AtributeModel.fromMap(map['modAtributes']),
      charClass: ClassModel.fromMap(map['charClass']),
      alignment: AlignmentModel.fromMap(map['alignment']),
      hitPoints: map['hitPoints']?.toInt() ?? 0,
      resistances: ResistanceModel.fromMap(map['resistances']),
      combatStats: CombatModel.fromMap(map['combatStats']),
      charEquip: EquipModel.fromMap(map['charEquip']),
      loot: LootModel.fromMap(map['loot']),
      charLevel: map['charLevel']?.toInt() ?? 0,
      feats: List<TraitModel>.from(
          map['feats']?.map((x) => TraitModel.fromMap(x))),
      skills: List<SkillModel>.from(
          map['skills']?.map((x) => SkillModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharModel.fromJson(String source) =>
      CharModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CharModel(charRace: $charRace, charName: $charName, physicalStyle: $physicalStyle, battleStyle: $battleStyle, baseAtributes: $baseAtributes, modAtributes: $modAtributes, charClass: $charClass, alignment: $alignment, hitPoints: $hitPoints, resistances: $resistances, combatStats: $combatStats, charEquip: $charEquip, loot: $loot, charLevel: $charLevel, feats: $feats, skills: $skills)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharModel &&
        other.charRace == charRace &&
        other.charName == charName &&
        other.physicalStyle == physicalStyle &&
        other.battleStyle == battleStyle &&
        other.baseAtributes == baseAtributes &&
        other.modAtributes == modAtributes &&
        other.charClass == charClass &&
        other.alignment == alignment &&
        other.hitPoints == hitPoints &&
        other.resistances == resistances &&
        other.combatStats == combatStats &&
        other.charEquip == charEquip &&
        other.loot == loot &&
        other.charLevel == charLevel &&
        listEquals(other.feats, feats) &&
        listEquals(other.skills, skills);
  }

  @override
  int get hashCode {
    return charRace.hashCode ^
        charName.hashCode ^
        physicalStyle.hashCode ^
        battleStyle.hashCode ^
        baseAtributes.hashCode ^
        modAtributes.hashCode ^
        charClass.hashCode ^
        alignment.hashCode ^
        hitPoints.hashCode ^
        resistances.hashCode ^
        combatStats.hashCode ^
        charEquip.hashCode ^
        loot.hashCode ^
        charLevel.hashCode ^
        feats.hashCode ^
        skills.hashCode;
  }
}
