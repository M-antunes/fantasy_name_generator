import 'package:fantasy_name_generator/models/class_models/alignment_model.dart';
import 'package:fantasy_name_generator/models/char_personal_models/char_model.dart';
import 'package:fantasy_name_generator/models/class_models/class_model.dart';
import 'package:fantasy_name_generator/models/combat_models/combat_model.dart';
import 'package:fantasy_name_generator/models/combat_models/combat_style_choice_model.dart';
import 'package:fantasy_name_generator/models/equip_models/equip_model.dart';
import 'package:fantasy_name_generator/models/equip_models/loot_models/loot_model.dart';
import 'package:fantasy_name_generator/models/char_personal_models/name_model.dart';
import 'package:fantasy_name_generator/models/key_value.model.dart';
import 'package:fantasy_name_generator/models/race_models/race_model.dart';
import 'package:fantasy_name_generator/models/combat_models/resistance_model.dart';

import '../../../models/combat_models/base_atribute_model.dart';
import '../../../models/combat_models/physical_style_model.dart';

class DefaultCharModelData {
  final defaultCharModel = CharModel(
    languages: [],
    charRace: RaceModel(
        initialIdiom: "",
        height: KeyValueModel(key: 0, value: 0),
        name: "",
        isSelected: false),
    charName: NameModel(
      fullName: " - ? - ",
      name: " - ? - ",
      surname: " - ? - ",
      gender: "",
      objectPronoun: "",
      personalPronoun: "",
      possessiveAdjective: "",
    ),
    bossOrMinion: "",
    skills: [],
    feats: [],
    battleStyle: CombatStyleChoiceModel(
        isSelected: false,
        description: "",
        descriptionTitle: "",
        name: "",
        svg: ""),
    physicalStyle: PhysicalStyleModel(
        description: "",
        weaponType: "",
        name: "",
        forbiddenClasses: [],
        isSelected: false,
        svg: ""),
    baseAttributes: AttributeModel(),
    modAttributes: AttributeModel(),
    charClass: ClassModel(
      skillRankPerLevel: 0,
      permittedAligments: [],
      forbidenArmorType: [],
      name: "",
      isSelected: false,
      mainAtrb: "",
      combatStyle: "",
    ),
    alignment: AlignmentModel(name: "", isSelected: false, description: ""),
    hitPoints: 10,
    resistances: ResistanceModel(),
    combatStats: CombatModel(),
    charEquip: EquipModel(),
    loot: LootModel(items: [], gold: 0),
    charLevel: 1,
  );
}
