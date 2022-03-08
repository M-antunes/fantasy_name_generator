import 'package:fantasy_name_generator/models/alignment_model.dart';
import 'package:fantasy_name_generator/models/base_atribute_model.dart';
import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/class_model.dart';
import 'package:fantasy_name_generator/models/combat_model.dart';
import 'package:fantasy_name_generator/models/equip_models/equip_model.dart';
import 'package:fantasy_name_generator/models/equip_models/loot_model.dart';
import 'package:fantasy_name_generator/models/equip_models/weapon_model.dart';
import 'package:fantasy_name_generator/models/equip_models/weapon_type_model.dart';
import 'package:fantasy_name_generator/models/name_model.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:fantasy_name_generator/models/resistance_model.dart';

class DefaultCharModelData {
  final defaultCharModel = CharModel(
    charRace: RaceModel(name: "Human", isSelected: false),
    charName: NameModel(fullName: "", name: "", surname: "", gender: ""),
    baseAtributes: AtributeModel(),
    modAtributes: AtributeModel(),
    charClass: ClassModel(name: "Commoner", isSelected: false, mainAtrb: "Str"),
    alignment: AlignmentModel(name: "Neutral", isSelected: false),
    hitPoints: 10,
    resistances: ResistanceModel(),
    combatStats: CombatModel(),
    charEquip: EquipModel(
        primaryWeapon: WeaponModel(
            name: "Dagger",
            type: WeaponTypeModel(
                name: "Knife",
                isSelected: false,
                picture: "assets/images/weapon_types/knife.svg"))),
    loot: LootModel(items: [], gold: 0),
    charLevel: 1,
  );
}
