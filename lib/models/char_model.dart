import 'dart:convert';

import 'package:fantasy_name_generator/models/alignment_model.dart';
import 'package:fantasy_name_generator/models/class_model.dart';
import 'package:fantasy_name_generator/models/combat_model.dart';
import 'package:fantasy_name_generator/models/combat_style_choice_model.dart';
import 'package:fantasy_name_generator/models/equip_models/equip_model.dart';
import 'package:fantasy_name_generator/models/equip_models/loot_model.dart';
import 'package:fantasy_name_generator/models/name_model.dart';
import 'package:fantasy_name_generator/models/physical_style_model.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:fantasy_name_generator/models/resistance_model.dart';

import 'base_atribute_model.dart';

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
    );
  }

  String toJson() => json.encode(toMap());

  factory CharModel.fromJson(String source) =>
      CharModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CharModel(charRace: $charRace, charName: $charName, physicalStyle: $physicalStyle, battleStyle: $battleStyle, baseAtributes: $baseAtributes, modAtributes: $modAtributes, charClass: $charClass, alignment: $alignment, hitPoints: $hitPoints, resistances: $resistances, combatStats: $combatStats, charEquip: $charEquip, loot: $loot, charLevel: $charLevel)';
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
        other.charLevel == charLevel;
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
        charLevel.hashCode;
  }
}
