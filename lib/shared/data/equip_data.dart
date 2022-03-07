import 'package:fantasy_name_generator/models/equip_models/armour_model.dart';
import 'package:fantasy_name_generator/models/equip_models/weapon_model.dart';

class EquipData {
  final List<WeaponModel> oneHandedWeapons = [
    WeaponModel(isSelected: false, type: "Knife", name: "Dagger"),
    WeaponModel(isSelected: false, type: "Mace", name: "Wooden stick"),
    WeaponModel(isSelected: false, type: "Mace", name: "Club"),
    WeaponModel(isSelected: false, type: "Mace", name: "Heavy mace"),
    WeaponModel(isSelected: false, type: "Long", name: "Shortspear"),
    WeaponModel(isSelected: false, type: "Mace", name: "Morningstar"),
    WeaponModel(isSelected: false, type: "Knife", name: "Punching dagger"),
    WeaponModel(isSelected: false, type: "Sword", name: "Butterfly sword"),
    WeaponModel(isSelected: false, type: "Axe", name: "Handaxe"),
    WeaponModel(isSelected: false, type: "Knife", name: "Kukri"),
    WeaponModel(isSelected: false, type: "Mace", name: "Light hammer"),
    WeaponModel(isSelected: false, type: "Sword", name: "Shortsword"),
    WeaponModel(isSelected: false, type: "Axe", name: "Light pick"),
    WeaponModel(isSelected: false, type: "Knife", name: "Starknife"),
    WeaponModel(isSelected: false, type: "Exotic", name: "Light flail"),
    WeaponModel(isSelected: false, type: "Sword", name: "Longsword"),
    WeaponModel(isSelected: false, type: "Unarmed strike", name: "Rapier"),
    WeaponModel(isSelected: false, type: "Sword", name: "Scimitar"),
    WeaponModel(isSelected: false, type: "Sword", name: "Falchion"),
    WeaponModel(isSelected: false, type: "Exotic", name: "whip"),
    WeaponModel(isSelected: false, type: "Knife", name: "Swordbreaker dagger"),
    WeaponModel(isSelected: false, type: "Sword", name: "Bastard sword"),
    WeaponModel(isSelected: false, type: "Axe", name: "Waraxe"),
    WeaponModel(isSelected: false, type: "Sword", name: "Katana"),
    WeaponModel(isSelected: false, type: "Sword", name: "Sabre"),
    WeaponModel(isSelected: false, type: "Mace", name: "Light mace"),
    WeaponModel(isSelected: false, type: "Exotic", name: "Scythe"),
  ];

  final List<WeaponModel> twoHandedWeapon = [
    WeaponModel(isSelected: false, type: "Long", name: "Bayonet"),
    WeaponModel(isSelected: false, type: "Long", name: "Boar spear"),
    WeaponModel(isSelected: false, type: "Long", name: "Longspear"),
    WeaponModel(isSelected: false, type: "Long", name: "Gladius"),
    WeaponModel(isSelected: false, type: "Long", name: "Trident"),
    WeaponModel(isSelected: false, type: "Long", name: "Glaive"),
    WeaponModel(isSelected: false, type: "Long", name: "Bardiche"),
    WeaponModel(isSelected: false, type: "Mace", name: "Earth breaker"),
    WeaponModel(isSelected: false, type: "Mace", name: "Greatclub"),
    WeaponModel(isSelected: false, type: "Mace", name: "Warhammer"),
    WeaponModel(isSelected: false, type: "Axe", name: "Greataxe"),
    WeaponModel(isSelected: false, type: "Sword", name: "Greatsword"),
    WeaponModel(isSelected: false, type: "Long", name: "Guisarme"),
    WeaponModel(isSelected: false, type: "Long", name: "Hooked lance"),
    WeaponModel(isSelected: false, type: "Long", name: "Lance"),
    WeaponModel(isSelected: false, type: "Long", name: "Long scythe"),
    WeaponModel(isSelected: false, type: "Axe", name: "Hooked axe"),
    WeaponModel(isSelected: false, type: "Long", name: "Chain spear"),
    WeaponModel(isSelected: false, type: "Sword", name: "Elven curved blade"),
    WeaponModel(isSelected: false, type: "Long", name: "Halberd"),
    WeaponModel(isSelected: false, type: "Double", name: "Quarterstaff"),
    WeaponModel(isSelected: false, type: "Double", name: "Double saber"),
    WeaponModel(isSelected: false, type: "Exotic", name: "Spiked chain"),
    WeaponModel(isSelected: false, type: "Exotic", name: "Net"),
    WeaponModel(isSelected: false, type: "Exotic", name: "Flying blade"),
    WeaponModel(isSelected: false, type: "Double", name: "Double-chained"),
    WeaponModel(
        isSelected: false, type: "Exotic two-handed", name: "Dire flail"),
  ];

  final List<WeaponModel> distance = [
    WeaponModel(isSelected: false, type: "Crossbow", name: "Heavy crossbow"),
    WeaponModel(isSelected: false, type: "Throwing", name: "Throwing axe"),
    WeaponModel(isSelected: false, type: "Throwing", name: "Javelin"),
    WeaponModel(isSelected: false, type: "Throwing", name: "Sling"),
    WeaponModel(isSelected: false, type: "Throwing", name: "Chakram"),
    WeaponModel(isSelected: false, type: "Crossbow", name: "Light crossbow"),
    WeaponModel(isSelected: false, type: "Bow", name: "Composite longbow"),
    WeaponModel(isSelected: false, type: "Bow", name: "Composite shortbow"),
    WeaponModel(isSelected: false, type: "Bow", name: "Longbow"),
    WeaponModel(isSelected: false, type: "Throwing", name: "Pilum"),
    WeaponModel(isSelected: false, type: "Bow", name: "Shortbow"),
    WeaponModel(isSelected: false, type: "Throwing", name: "Bolas"),
    WeaponModel(isSelected: false, type: "Throwing", name: "Boomerang"),
    WeaponModel(isSelected: false, type: "Crossbow", name: "Hand crossbow"),
    WeaponModel(isSelected: false, type: "Throwing", name: "Shuriken"),
    WeaponModel(isSelected: false, type: "Throwing", name: "Throwing shield"),
  ];

  final List<WeaponModel> fistWeapons = [
    WeaponModel(isSelected: false, type: "Fist", name: "Unarmed strike"),
    WeaponModel(isSelected: false, type: "Fist", name: "Brass knuckles"),
    WeaponModel(isSelected: false, type: "Fist", name: "Cestus"),
    WeaponModel(isSelected: false, type: "Fist", name: "Spiked gauntlet"),
  ];

  final List<ArmourModel> lightArmours = [
    ArmourModel(type: "armor", isSelected: false, name: "Padded"),
    ArmourModel(type: "armor", isSelected: false, name: "Quilted cloth"),
    ArmourModel(type: "armor", isSelected: false, name: "Silken ceremonial"),
    ArmourModel(type: "armor", isSelected: false, name: "Lamellar cuirass"),
    ArmourModel(type: "armor", isSelected: false, name: "Leather"),
  ];
  List<ArmourModel> mediumArmours = [
    ArmourModel(type: "armor", isSelected: false, name: "Studded leather"),
    ArmourModel(type: "armor", isSelected: false, name: "Wooden plaques"),
    ArmourModel(type: "armor", isSelected: false, name: "Chain shirt"),
    ArmourModel(type: "armor", isSelected: false, name: "Hide"),
    ArmourModel(type: "armor", isSelected: false, name: "Lamellar"),
    ArmourModel(type: "armor", isSelected: false, name: "Scale mail"),
    ArmourModel(type: "armor", isSelected: false, name: "Agile breastplate"),
  ];

  List<ArmourModel> heavyArmours = [
    ArmourModel(type: "armor", isSelected: false, name: "Breastplate"),
    ArmourModel(type: "armor", isSelected: false, name: "Chainmail"),
    ArmourModel(type: "armor", isSelected: false, name: "Mountain pattern"),
    ArmourModel(type: "armor", isSelected: false, name: "Splint mail"),
    ArmourModel(type: "armor", isSelected: false, name: "Agile half-plate"),
    ArmourModel(type: "armor", isSelected: false, name: "Half-plate"),
    ArmourModel(type: "armor", isSelected: false, name: "Full plate"),
    ArmourModel(type: "armor", isSelected: false, name: "Stoneplate"),
  ];

  List<ArmourModel> lightshields = [
    ArmourModel(type: "shield", isSelected: false, name: "Buckler"),
    ArmourModel(type: "shield", isSelected: false, name: "wooden shield"),
    ArmourModel(type: "shield", isSelected: false, name: "iron shield"),
    ArmourModel(type: "shield", isSelected: false, name: "steel shield"),
  ];

  List<ArmourModel> heavyShields = [
    ArmourModel(type: "shield", isSelected: false, name: "Wooden shield"),
    ArmourModel(type: "shield", isSelected: false, name: "Iron shield"),
    ArmourModel(type: "shield", isSelected: false, name: "Steel shield"),
    ArmourModel(type: "shield", isSelected: false, name: "Tower shield"),
  ];
}
