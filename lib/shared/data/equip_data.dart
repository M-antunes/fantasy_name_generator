import 'package:fantasy_name_generator/models/equip_models/armor_model.dart';
import 'package:fantasy_name_generator/models/equip_models/armor_type_model.dart';
import 'package:fantasy_name_generator/models/equip_models/weapon_model.dart';
import 'package:fantasy_name_generator/models/equip_models/weapon_type_model.dart';

class EquipData {
  final List<WeaponModel> oneHandedWeapons = [
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d4",
        type: WeaponFamilyModel(
            name: "Knife",
            isSelected: false,
            picture: "assets/images/weapon_types/knife.svg"),
        name: "Dagger"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d4",
        type: WeaponFamilyModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Wooden club"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d6",
        type: WeaponFamilyModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Club"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Light mace"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Morningstar"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d4",
        type: WeaponFamilyModel(
            name: "Knife",
            isSelected: false,
            picture: "assets/images/weapon_types/knife.svg"),
        name: "Punching dagger"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d6",
        type: WeaponFamilyModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Butterfly sword"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d6",
        type: WeaponFamilyModel(
            name: "Axe",
            isSelected: false,
            picture: "assets/images/weapon_types/hatchet.svg"),
        name: "Handaxe"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d4",
        type: WeaponFamilyModel(
            name: "Knife",
            isSelected: false,
            picture: "assets/images/weapon_types/knife.svg"),
        name: "Kukri"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d4",
        type: WeaponFamilyModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Light hammer"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d6",
        type: WeaponFamilyModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Shortsword"),
    WeaponModel(
        isSelected: false,
        critical: "x4",
        damage: "1d6",
        type: WeaponFamilyModel(
            name: "Axe",
            isSelected: false,
            picture: "assets/images/weapon_types/hatchet.svg"),
        name: "Light pick"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d4",
        type: WeaponFamilyModel(
            name: "Knife",
            isSelected: false,
            picture: "assets/images/weapon_types/knife.svg"),
        name: "Starknife"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Light flail"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Longsword"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d6",
        type: WeaponFamilyModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Rapier"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d6",
        type: WeaponFamilyModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Scimitar"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "2d4",
        type: WeaponFamilyModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Falchion"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d2",
        type: WeaponFamilyModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "whip"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d4",
        type: WeaponFamilyModel(
            name: "Knife",
            isSelected: false,
            picture: "assets/images/weapon_types/knife.svg"),
        name: "Swordbreaker dagger"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d10",
        type: WeaponFamilyModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Bastard sword"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d10",
        type: WeaponFamilyModel(
            name: "Axe",
            isSelected: false,
            picture: "assets/images/weapon_types/hatchet.svg"),
        name: "Waraxe"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Katana"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Sabre"),
    WeaponModel(
        isSelected: false,
        critical: "x4",
        damage: "2d4",
        type: WeaponFamilyModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Scythe"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d4",
        type: WeaponFamilyModel(
            name: "Fist",
            isSelected: false,
            picture: "assets/images/weapon_types/punch.svg"),
        name: "Unarmed strike"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d4",
        type: WeaponFamilyModel(
            name: "Fist",
            isSelected: false,
            picture: "assets/images/weapon_types/punch.svg"),
        name: "Brass knuckles"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d4",
        type: WeaponFamilyModel(
            name: "Fist",
            isSelected: false,
            picture: "assets/images/weapon_types/punch.svg"),
        name: "Cestus"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d4",
        type: WeaponFamilyModel(
            name: "Fist",
            isSelected: false,
            picture: "assets/images/weapon_types/punch.svg"),
        name: "Spiked gauntlet"),
  ];
  final List<WeaponFamilyModel> oneHandedTypes = [
    WeaponFamilyModel(
        name: "Knife",
        isSelected: false,
        picture: "assets/images/weapon_types/knife.svg"),
    WeaponFamilyModel(
        name: "Sword",
        isSelected: false,
        picture: "assets/images/weapon_types/sword.svg"),
    WeaponFamilyModel(
        name: "Axe",
        isSelected: false,
        picture: "assets/images/weapon_types/hatchet.svg"),
    WeaponFamilyModel(
        name: "Mace",
        isSelected: false,
        picture: "assets/images/weapon_types/hammer.svg"),
    WeaponFamilyModel(
        name: "Fist",
        isSelected: false,
        picture: "assets/images/weapon_types/punch.svg"),
    WeaponFamilyModel(
        name: "Exotic",
        isSelected: false,
        picture: "assets/images/weapon_types/exotic.svg"),
  ];

  final List<WeaponModel> twoHandedWeapons = [
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d6",
        type: WeaponFamilyModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Bayonet"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Spear",
            isSelected: false,
            picture: "assets/images/weapon_types/spear.svg"),
        name: "Boar spear"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Spear",
            isSelected: false,
            picture: "assets/images/weapon_types/spear.svg"),
        name: "Longspear"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d10",
        type: WeaponFamilyModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Gladius"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Trident"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d10",
        type: WeaponFamilyModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Glaive"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d10",
        type: WeaponFamilyModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Bardiche"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "2d6",
        type: WeaponFamilyModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Earth breaker"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d10",
        type: WeaponFamilyModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Greatclub"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d12",
        type: WeaponFamilyModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Warhammer"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d12",
        type: WeaponFamilyModel(
            name: "Axe",
            isSelected: false,
            picture: "assets/images/weapon_types/battle-axe.svg"),
        name: "Greataxe"),
    WeaponModel(
        isSelected: false,
        critical: "19-20x2",
        damage: "2d6",
        type: WeaponFamilyModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/great-sword.svg"),
        name: "Greatsword"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d10",
        type: WeaponFamilyModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Guisarme"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Spear",
            isSelected: false,
            picture: "assets/images/weapon_types/spear.svg"),
        name: "Hooked lance"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Spear",
            isSelected: false,
            picture: "assets/images/weapon_types/spear.svg"),
        name: "Lance"),
    WeaponModel(
        isSelected: false,
        critical: "x4",
        damage: "2d4",
        type: WeaponFamilyModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Long scythe"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d10",
        type: WeaponFamilyModel(
            name: "Axe",
            isSelected: false,
            picture: "assets/images/weapon_types/battle-axe.svg"),
        name: "Hooked axe"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Spear",
            isSelected: false,
            picture: "assets/images/weapon_types/spear.svg"),
        name: "Chain spear"),
    WeaponModel(
        isSelected: false,
        critical: "19-20x2",
        damage: "1d10",
        type: WeaponFamilyModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/great-sword.svg"),
        name: "Elven curved blade"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d10",
        type: WeaponFamilyModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Halberd"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d6/1d6",
        type: WeaponFamilyModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Quarterstaff"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d8/1d8",
        type: WeaponFamilyModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Double saber"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "2d4",
        type: WeaponFamilyModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Spiked chain"),
    WeaponModel(
        isSelected: false,
        critical: "-",
        damage: "-",
        type: WeaponFamilyModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Net"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d12",
        type: WeaponFamilyModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Flying blade"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d6/1d6",
        type: WeaponFamilyModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Double-chained"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d8/1d8",
        type: WeaponFamilyModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Dire flail"),
    WeaponModel(
        isSelected: false,
        critical: "x4",
        damage: "1d10",
        type: WeaponFamilyModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/battle-axe.svg"),
        name: "Heavy pick"),
  ];

  final List<WeaponFamilyModel> twoHandedTypes = [
    WeaponFamilyModel(
        name: "Sword",
        isSelected: false,
        picture: "assets/images/weapon_types/great-sword.svg"),
    WeaponFamilyModel(
        name: "Spear",
        isSelected: false,
        picture: "assets/images/weapon_types/spear.svg"),
    WeaponFamilyModel(
        name: "Axe",
        isSelected: false,
        picture: "assets/images/weapon_types/battle-axe.svg"),
    WeaponFamilyModel(
        name: "Mace",
        isSelected: false,
        picture: "assets/images/weapon_types/mace.svg"),
    WeaponFamilyModel(
        name: "Polearm",
        isSelected: false,
        picture: "assets/images/weapon_types/polearm.svg"),
    WeaponFamilyModel(
        name: "Exotic",
        isSelected: false,
        picture: "assets/images/weapon_types/exotic_tw.svg"),
  ];

  final List<WeaponModel> distanceWeapons = [
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d10",
        type: WeaponFamilyModel(
            name: "Crossbow",
            isSelected: false,
            picture: "assets/images/weapon_types/crossbow.svg"),
        name: "Heavy crossbow"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d6",
        type: WeaponFamilyModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Throwing axe"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d6",
        type: WeaponFamilyModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Javelin"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Sling"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Chakram"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Crossbow",
            isSelected: false,
            picture: "assets/images/weapon_types/crossbow.svg"),
        name: "Light crossbow"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Bow",
            isSelected: false,
            picture: "assets/images/weapon_types/bow.svg"),
        name: "Composite longbow"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d6",
        type: WeaponFamilyModel(
            name: "Bow",
            isSelected: false,
            picture: "assets/images/weapon_types/bow.svg"),
        name: "Composite shortbow"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d8",
        type: WeaponFamilyModel(
            name: "Bow",
            isSelected: false,
            picture: "assets/images/weapon_types/bow.svg"),
        name: "Longbow"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d6",
        type: WeaponFamilyModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Pilum"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d6",
        type: WeaponFamilyModel(
            name: "Bow",
            isSelected: false,
            picture: "assets/images/weapon_types/bow.svg"),
        name: "Shortbow"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "-",
        type: WeaponFamilyModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Bolas"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d2",
        type: WeaponFamilyModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Shuriken"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d6",
        type: WeaponFamilyModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Throwing shield"),
  ];

  final List<WeaponFamilyModel> distanceTypes = [
    WeaponFamilyModel(
        name: "Bow",
        isSelected: false,
        picture: "assets/images/weapon_types/bow.svg"),
    WeaponFamilyModel(
        name: "Crossbow",
        isSelected: false,
        picture: "assets/images/weapon_types/crossbow.svg"),
    WeaponFamilyModel(
        name: "Throwing",
        isSelected: false,
        picture: "assets/images/weapon_types/throwing.svg"),
  ];

  final List<ArmorModel> lightArmours = [
    ArmorModel(
        type: ArmorFamilyModel(
            name: "light armor",
            isSelected: false,
            picture: "assets/images/armors/light.svg"),
        defenseBonus: 1,
        maxDexAllowed: 8,
        checkPenalty: 0,
        speedPenalty: 0,
        isSelected: false,
        name: "Quilted cloth"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "light armor",
            isSelected: false,
            picture: "assets/images/armors/light.svg"),
        defenseBonus: 1,
        maxDexAllowed: 8,
        checkPenalty: 0,
        speedPenalty: 0,
        isSelected: false,
        name: "Padded"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "light armor",
            isSelected: false,
            picture: "assets/images/armors/light.svg"),
        defenseBonus: 1,
        maxDexAllowed: 8,
        checkPenalty: 0,
        speedPenalty: 0,
        isSelected: false,
        name: "Silken ceremonial"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "light armor",
            isSelected: false,
            picture: "assets/images/armors/light.svg"),
        defenseBonus: 2,
        maxDexAllowed: 4,
        checkPenalty: 0,
        speedPenalty: 0,
        isSelected: false,
        name: "Lamellar (cuirass)"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "light armor",
            isSelected: false,
            picture: "assets/images/armors/light.svg"),
        defenseBonus: 2,
        maxDexAllowed: 6,
        checkPenalty: 0,
        speedPenalty: 0,
        isSelected: false,
        name: "Leather"),
  ];
  List<ArmorModel> mediumArmours = [
    ArmorModel(
        type: ArmorFamilyModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        defenseBonus: 3,
        maxDexAllowed: 5,
        checkPenalty: 1,
        speedPenalty: 5,
        isSelected: false,
        name: "Studded leather"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        defenseBonus: 3,
        maxDexAllowed: 5,
        checkPenalty: 1,
        speedPenalty: 5,
        isSelected: false,
        name: "Wooden plaques"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        defenseBonus: 4,
        maxDexAllowed: 4,
        checkPenalty: 2,
        speedPenalty: 5,
        isSelected: false,
        name: "Chain shirt"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        defenseBonus: 4,
        maxDexAllowed: 4,
        checkPenalty: 3,
        speedPenalty: 5,
        isSelected: false,
        name: "Hide"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        defenseBonus: 5,
        maxDexAllowed: 3,
        checkPenalty: 4,
        speedPenalty: 5,
        isSelected: false,
        name: "Lamellar (wooden)"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        defenseBonus: 5,
        maxDexAllowed: 3,
        checkPenalty: 4,
        speedPenalty: 5,
        isSelected: false,
        name: "Scale mail"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        defenseBonus: 6,
        maxDexAllowed: 3,
        checkPenalty: 4,
        speedPenalty: 5,
        isSelected: false,
        name: "Agile breastplate"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        defenseBonus: 6,
        maxDexAllowed: 3,
        checkPenalty: 4,
        speedPenalty: 5,
        isSelected: false,
        name: "Chainmail"),
  ];

  List<ArmorModel> heavyArmours = [
    ArmorModel(
        type: ArmorFamilyModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        defenseBonus: 7,
        maxDexAllowed: 2,
        checkPenalty: 6,
        speedPenalty: 5,
        isSelected: false,
        name: "Breastplate"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        defenseBonus: 6,
        maxDexAllowed: 3,
        checkPenalty: 4,
        speedPenalty: 5,
        isSelected: false,
        name: "Mountain pattern"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        defenseBonus: 7,
        maxDexAllowed: 2,
        checkPenalty: 7,
        speedPenalty: 5,
        isSelected: false,
        name: "Splint mail"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        defenseBonus: 7,
        maxDexAllowed: 1,
        checkPenalty: 7,
        speedPenalty: 5,
        isSelected: false,
        name: "Lamellar (iron)"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        defenseBonus: 8,
        maxDexAllowed: 2,
        checkPenalty: 5,
        speedPenalty: 5,
        isSelected: false,
        name: "Agile half-plate"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        defenseBonus: 8,
        maxDexAllowed: 1,
        checkPenalty: 7,
        speedPenalty: 5,
        isSelected: false,
        name: "Half-plate"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        defenseBonus: 9,
        maxDexAllowed: 1,
        checkPenalty: 6,
        speedPenalty: 5,
        isSelected: false,
        name: "Full plate"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        defenseBonus: 9,
        maxDexAllowed: 1,
        checkPenalty: 6,
        speedPenalty: 5,
        isSelected: false,
        name: "Stoneplate"),
  ];

  List<ArmorModel> lightshields = [
    ArmorModel(
        type: ArmorFamilyModel(
            name: "buckler",
            isSelected: false,
            picture: "assets/images/shields/buckler.svg"),
        defenseBonus: 1,
        maxDexAllowed: null,
        checkPenalty: 1,
        speedPenalty: null,
        isSelected: false,
        name: "Buckler"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "light shield",
            isSelected: false,
            picture: "assets/images/shields/light.svg"),
        defenseBonus: 1,
        maxDexAllowed: null,
        checkPenalty: 1,
        speedPenalty: null,
        isSelected: false,
        name: "Wooden shield"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "light shield",
            isSelected: false,
            picture: "assets/images/shields/light.svg"),
        defenseBonus: 2,
        maxDexAllowed: null,
        checkPenalty: 1,
        speedPenalty: null,
        isSelected: false,
        name: "Iron-wood shield"),
  ];

  List<ArmorModel> heavyShields = [
    ArmorModel(
        type: ArmorFamilyModel(
            name: "heavy shield",
            isSelected: false,
            picture: "assets/images/shields/heavy.svg"),
        defenseBonus: 2,
        maxDexAllowed: null,
        checkPenalty: 2,
        speedPenalty: null,
        isSelected: false,
        name: "Steel-wood shield"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "heavy shield",
            isSelected: false,
            picture: "assets/images/shields/heavy.svg"),
        defenseBonus: 2,
        maxDexAllowed: null,
        checkPenalty: 2,
        speedPenalty: null,
        isSelected: false,
        name: "Iron shield"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "heavy shield",
            isSelected: false,
            picture: "assets/images/shields/heavy.svg"),
        defenseBonus: 2,
        maxDexAllowed: null,
        checkPenalty: 2,
        speedPenalty: null,
        isSelected: false,
        name: "Steel shield"),
    ArmorModel(
        type: ArmorFamilyModel(
            name: "heavy shield",
            isSelected: false,
            picture: "assets/images/shields/heavy.svg"),
        defenseBonus: 2,
        maxDexAllowed: null,
        checkPenalty: 2,
        speedPenalty: null,
        isSelected: false,
        name: "Tower shield"),
  ];

  List<ArmorFamilyModel> armorTypes = [
    ArmorFamilyModel(
        name: "No armor",
        isSelected: false,
        picture: "assets/images/armors/none.svg"),
    ArmorFamilyModel(
        name: "Light armor",
        isSelected: false,
        picture: "assets/images/armors/light.svg"),
    ArmorFamilyModel(
        name: "Medium armor",
        isSelected: false,
        picture: "assets/images/armors/medium.svg"),
    ArmorFamilyModel(
        name: "Heavy armor",
        isSelected: false,
        picture: "assets/images/armors/heavy.svg"),
  ];

  List<ArmorFamilyModel> shieldTypes = [
    ArmorFamilyModel(
        name: "No shield",
        isSelected: false,
        picture: "assets/images/shields/no-shield.svg"),
    ArmorFamilyModel(
        name: "Buckler",
        isSelected: false,
        picture: "assets/images/shields/buckler.svg"),
    ArmorFamilyModel(
        name: "Light shield",
        isSelected: false,
        picture: "assets/images/shields/light.svg"),
    ArmorFamilyModel(
        name: "Heavy shield",
        isSelected: false,
        picture: "assets/images/shields/heavy.svg"),
  ];
}
