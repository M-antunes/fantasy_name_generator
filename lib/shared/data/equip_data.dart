import 'package:fantasy_name_generator/models/equip_models/armour_model.dart';
import 'package:fantasy_name_generator/models/equip_models/shield_model.dart';
import 'package:fantasy_name_generator/models/equip_models/weapon_model.dart';

class EquipData {
  final List<WeaponModel> oneHandedWeapons = [
    WeaponModel(weaponType: "Ligth blade", name: "Dagger"),
    WeaponModel(weaponType: "Mace", name: "Wooden stick"),
    WeaponModel(weaponType: "Mace", name: "Club"),
    WeaponModel(weaponType: "Mace", name: "Heavy mace"),
    WeaponModel(weaponType: "Long", name: "Shortspear"),
    WeaponModel(weaponType: "Mace", name: "Morningstar"),
    WeaponModel(weaponType: "Ligth blade", name: "Punching dagger"),
    WeaponModel(weaponType: "Sword", name: "Butterfly sword"),
    WeaponModel(weaponType: "Axe", name: "Handaxe"),
    WeaponModel(weaponType: "Ligth blade", name: "Kukri"),
    WeaponModel(weaponType: "Mace", name: "Light hammer"),
    WeaponModel(weaponType: "Sword", name: "Shortsword"),
    WeaponModel(weaponType: "Axe", name: "Light pick"),
    WeaponModel(weaponType: "Ligth blade", name: "Starknife"),
    WeaponModel(weaponType: "Exotic", name: "Light flail"),
    WeaponModel(weaponType: "Sword", name: "Longsword"),
    WeaponModel(weaponType: "Unarmed strike", name: "Rapier"),
    WeaponModel(weaponType: "Sword", name: "Scimitar"),
    WeaponModel(weaponType: "Sword", name: "Falchion"),
    WeaponModel(weaponType: "Exotic", name: "whip"),
    WeaponModel(weaponType: "Ligth blade", name: "Swordbreaker dagger"),
    WeaponModel(weaponType: "Sword", name: "Bastard sword"),
    WeaponModel(weaponType: "Axe", name: "Waraxe"),
    WeaponModel(weaponType: "Sword", name: "Katana"),
    WeaponModel(weaponType: "Sword", name: "Sabre"),
    WeaponModel(weaponType: "Mace", name: "Light mace"),
    WeaponModel(weaponType: "Exotic", name: "Scythe"),
  ];

  final List<WeaponModel> twoHandedWeapon = [
    WeaponModel(weaponType: "Long", name: "Bayonet"),
    WeaponModel(weaponType: "Long", name: "Boar spear"),
    WeaponModel(weaponType: "Long", name: "Longspear"),
    WeaponModel(weaponType: "Long", name: "Gladius"),
    WeaponModel(weaponType: "Long", name: "Trident"),
    WeaponModel(weaponType: "Long", name: "Glaive"),
    WeaponModel(weaponType: "Long", name: "Bardiche"),
    WeaponModel(weaponType: "Mace", name: "Earth breaker"),
    WeaponModel(weaponType: "Mace", name: "Greatclub"),
    WeaponModel(weaponType: "Mace", name: "Warhammer"),
    WeaponModel(weaponType: "Axe", name: "Greataxe"),
    WeaponModel(weaponType: "Sword", name: "Greatsword"),
    WeaponModel(weaponType: "Long", name: "Guisarme"),
    WeaponModel(weaponType: "Long", name: "Hooked lance"),
    WeaponModel(weaponType: "Long", name: "Lance"),
    WeaponModel(weaponType: "Long", name: "Long scythe"),
    WeaponModel(weaponType: "Axe", name: "Hooked axe"),
    WeaponModel(weaponType: "Long", name: "Chain spear"),
    WeaponModel(weaponType: "Sword", name: "Elven curved blade"),
    WeaponModel(weaponType: "Long", name: "Halberd"),
    WeaponModel(weaponType: "Double", name: "Quarterstaff"),
    WeaponModel(weaponType: "Double", name: "Double saber"),
    WeaponModel(weaponType: "Exotic", name: "Spiked chain"),
    WeaponModel(weaponType: "Exotic", name: "Net"),
    WeaponModel(weaponType: "Exotic", name: "Flying blade"),
    WeaponModel(weaponType: "Double", name: "Double-chained"),
    WeaponModel(weaponType: "Exotic", name: "Dire flail"),
  ];

  final List<WeaponModel> distance = [
    WeaponModel(weaponType: "Crossbow", name: "Heavy crossbow"),
    WeaponModel(weaponType: "Throwing", name: "Throwing axe"),
    WeaponModel(weaponType: "Throwing", name: "Javelin"),
    WeaponModel(weaponType: "Throwing", name: "Sling"),
    WeaponModel(weaponType: "Throwing", name: "Chakram"),
    WeaponModel(weaponType: "Crossbow", name: "Light crossbow"),
    WeaponModel(weaponType: "Bow", name: "Composite longbow"),
    WeaponModel(weaponType: "Bow", name: "Composite shortbow"),
    WeaponModel(weaponType: "Bow", name: "Longbow"),
    WeaponModel(weaponType: "Throwing", name: "Pilum"),
    WeaponModel(weaponType: "Bow", name: "Shortbow"),
    WeaponModel(weaponType: "Throwing", name: "Bolas"),
    WeaponModel(weaponType: "Throwing", name: "Boomerang"),
    WeaponModel(weaponType: "Crossbow", name: "Hand crossbow"),
    WeaponModel(weaponType: "Throwing", name: "Shuriken"),
    WeaponModel(weaponType: "Throwing", name: "Throwing shield"),
  ];

  final List<WeaponModel> fistWeapons = [
    WeaponModel(weaponType: "Fist", name: "Unarmed strike"),
    WeaponModel(weaponType: "Fist", name: "Brass knuckles"),
    WeaponModel(weaponType: "Fist", name: "Cestus"),
    WeaponModel(weaponType: "Fist", name: "Spiked gauntlet"),
  ];

  final List<ArmourModel> lightArmours = [
    ArmourModel(name: "Padded"),
    ArmourModel(name: "Quilted cloth"),
    ArmourModel(name: "Silken ceremonial"),
    ArmourModel(name: "Lamellar cuirass"),
    ArmourModel(name: "Leather"),
  ];
  List<ArmourModel> mediumArmours = [
    ArmourModel(name: "Studded leather"),
    ArmourModel(name: "Wooden plaques"),
    ArmourModel(name: "Chain shirt"),
    ArmourModel(name: "Hide"),
    ArmourModel(name: "Lamellar"),
    ArmourModel(name: "Scale mail"),
    ArmourModel(name: "Agile breastplate"),
  ];

  List<ArmourModel> heavyArmours = [
    ArmourModel(name: "Breastplate"),
    ArmourModel(name: "Chainmail"),
    ArmourModel(name: "Mountain pattern"),
    ArmourModel(name: "Splint mail"),
    ArmourModel(name: "Agile half-plate"),
    ArmourModel(name: "Half-plate"),
    ArmourModel(name: "Full plate"),
    ArmourModel(name: "Stoneplate"),
  ];

  List<ShieldModel> lightshields = [
    ShieldModel(name: "Buckler"),
    ShieldModel(name: "wooden shield"),
    ShieldModel(name: "iron shield"),
    ShieldModel(name: "steel shield"),
  ];

  List<ShieldModel> heavyShields = [
    ShieldModel(name: "Wooden shield"),
    ShieldModel(name: "Iron shield"),
    ShieldModel(name: "Steel shield"),
    ShieldModel(name: "Tower shield"),
  ];
}
