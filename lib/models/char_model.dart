import 'dart:convert';

import 'package:fantasy_name_generator/models/class_model.dart';
import 'package:fantasy_name_generator/models/equip_models/equip_model.dart';
import 'package:fantasy_name_generator/models/equip_models/loot_model.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:fantasy_name_generator/models/saved_name_model.dart';

import 'atribute_model.dart';

class CharModel {
  final RaceModel charRace;
  final SavedNameModel charName;
  final EquipModel charEquip;
  final AtributeModel atributes;
  final LootModel loot;
  final ClassModel charClass;
  final int charLevel;

  CharModel({
    required this.charRace,
    required this.charName,
    required this.charEquip,
    required this.atributes,
    required this.loot,
    required this.charClass,
    required this.charLevel,
  });

  CharModel copyWith({
    RaceModel? charRace,
    SavedNameModel? charName,
    EquipModel? charEquip,
    AtributeModel? atributes,
    LootModel? loot,
    ClassModel? charClass,
    int? charLevel,
  }) {
    return CharModel(
      charRace: charRace ?? this.charRace,
      charName: charName ?? this.charName,
      charEquip: charEquip ?? this.charEquip,
      atributes: atributes ?? this.atributes,
      loot: loot ?? this.loot,
      charClass: charClass ?? this.charClass,
      charLevel: charLevel ?? this.charLevel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'charRace': charRace.toMap(),
      'charName': charName.toMap(),
      'charEquip': charEquip.toMap(),
      'atributes': atributes.toMap(),
      'loot': loot.toMap(),
      'charClass': charClass.toMap(),
      'charLevel': charLevel,
    };
  }

  factory CharModel.fromMap(Map<String, dynamic> map) {
    return CharModel(
      charRace: RaceModel.fromMap(map['charRace']),
      charName: SavedNameModel.fromMap(map['charName']),
      charEquip: EquipModel.fromMap(map['charEquip']),
      atributes: AtributeModel.fromMap(map['atributes']),
      loot: LootModel.fromMap(map['loot']),
      charClass: ClassModel.fromMap(map['charClass']),
      charLevel: map['charLevel']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CharModel.fromJson(String source) =>
      CharModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CharModel(charRace: $charRace, charName: $charName, charEquip: $charEquip, atributes: $atributes, loot: $loot, charClass: $charClass, charLevel: $charLevel)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharModel &&
        other.charRace == charRace &&
        other.charName == charName &&
        other.charEquip == charEquip &&
        other.atributes == atributes &&
        other.loot == loot &&
        other.charClass == charClass &&
        other.charLevel == charLevel;
  }

  @override
  int get hashCode {
    return charRace.hashCode ^
        charName.hashCode ^
        charEquip.hashCode ^
        atributes.hashCode ^
        loot.hashCode ^
        charClass.hashCode ^
        charLevel.hashCode;
  }
}
