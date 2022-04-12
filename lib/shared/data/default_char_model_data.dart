import 'package:fantasy_name_generator/models/alignment_model.dart';
import 'package:fantasy_name_generator/models/base_atribute_model.dart';
import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/class_model.dart';
import 'package:fantasy_name_generator/models/combat_model.dart';
import 'package:fantasy_name_generator/models/combat_style_choice_model.dart';
import 'package:fantasy_name_generator/models/equip_models/equip_model.dart';
import 'package:fantasy_name_generator/models/equip_models/loot_model.dart';
import 'package:fantasy_name_generator/models/name_model.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:fantasy_name_generator/models/resistance_model.dart';

import '../../models/physical_style_model.dart';

class DefaultCharModelData {
  final defaultCharModel = CharModel(
    charRace: RaceModel(name: "Human", isSelected: false),
    charName: NameModel(
      fullName: "",
      name: "",
      surname: "",
      gender: "",
      objectPronoun: "",
      personalPronoun: "",
      possessiveAdjective: "",
    ),
    feats: [],
    battleStyle: CombatStyleChoiceModel(
        isSelected: false,
        description: "",
        descriptionTitle: "",
        name: "",
        svg: ""),
    physicalStyle: PhysicalStyleModel(
        weaponType: "",
        name: "",
        forbiddenClasses: [],
        isSelected: false,
        svg: ""),
    baseAtributes: AtributeModel(),
    modAtributes: AtributeModel(),
    charClass: ClassModel(
      permittedAligments: [],
      forbidenArmorType: [],
      name: "Commoner",
      isSelected: false,
      mainAtrb: "strength",
      combatStyle: "Spellcaster",
    ),
    alignment:
        AlignmentModel(name: "Neutral", isSelected: false, description: ""),
    hitPoints: 10,
    resistances: ResistanceModel(),
    combatStats: CombatModel(),
    charEquip: EquipModel(),
    loot: LootModel(items: [], gold: 0),
    charLevel: 1,
  );
}
