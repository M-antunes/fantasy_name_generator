import 'package:fantasy_name_generator/models/alignment_model.dart';
import 'package:fantasy_name_generator/models/base_atribute_model.dart';
import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/class_model.dart';
import 'package:fantasy_name_generator/models/combat_model.dart';
import 'package:fantasy_name_generator/models/equip_models/equip_model.dart';
import 'package:fantasy_name_generator/models/equip_models/loot_model.dart';
import 'package:fantasy_name_generator/models/equip_models/weapon_model.dart';
import 'package:fantasy_name_generator/models/name_model.dart';
import 'package:fantasy_name_generator/models/race_model.dart';
import 'package:fantasy_name_generator/models/resistance_model.dart';
import 'package:fantasy_name_generator/shared/data/equip_data.dart';

class DefaultCharModelData {
  final listOfWeapons = EquipData();

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
        primaryWeapon: WeaponModel(name: "Dagger", weaponType: 'Light Blade')),
    loot: LootModel(items: [], gold: 0),
    charLevel: 1,
  );
}