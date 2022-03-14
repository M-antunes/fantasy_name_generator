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
        type: WeaponTypeModel(
            name: "Knife",
            isSelected: false,
            picture: "assets/images/weapon_types/knife.svg"),
        name: "Dagger"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d4",
        type: WeaponTypeModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Wooden club"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d6",
        type: WeaponTypeModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Club"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Light mace"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Morningstar"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d4",
        type: WeaponTypeModel(
            name: "Knife",
            isSelected: false,
            picture: "assets/images/weapon_types/knife.svg"),
        name: "Punching dagger"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d6",
        type: WeaponTypeModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Butterfly sword"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d6",
        type: WeaponTypeModel(
            name: "Axe",
            isSelected: false,
            picture: "assets/images/weapon_types/hatchet.svg"),
        name: "Handaxe"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d4",
        type: WeaponTypeModel(
            name: "Knife",
            isSelected: false,
            picture: "assets/images/weapon_types/knife.svg"),
        name: "Kukri"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d4",
        type: WeaponTypeModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Light hammer"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d6",
        type: WeaponTypeModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Shortsword"),
    WeaponModel(
        isSelected: false,
        critical: "x4",
        damage: "1d6",
        type: WeaponTypeModel(
            name: "Axe",
            isSelected: false,
            picture: "assets/images/weapon_types/hatchet.svg"),
        name: "Light pick"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d4",
        type: WeaponTypeModel(
            name: "Knife",
            isSelected: false,
            picture: "assets/images/weapon_types/knife.svg"),
        name: "Starknife"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Light flail"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Longsword"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d6",
        type: WeaponTypeModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Rapier"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d6",
        type: WeaponTypeModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Scimitar"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "2d4",
        type: WeaponTypeModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Falchion"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d2",
        type: WeaponTypeModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "whip"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d4",
        type: WeaponTypeModel(
            name: "Knife",
            isSelected: false,
            picture: "assets/images/weapon_types/knife.svg"),
        name: "Swordbreaker dagger"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d10",
        type: WeaponTypeModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Bastard sword"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d10",
        type: WeaponTypeModel(
            name: "Axe",
            isSelected: false,
            picture: "assets/images/weapon_types/hatchet.svg"),
        name: "Waraxe"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Katana"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/sword.svg"),
        name: "Sabre"),
    WeaponModel(
        isSelected: false,
        critical: "x4",
        damage: "2d4",
        type: WeaponTypeModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Scythe"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d4",
        type: WeaponTypeModel(
            name: "Fist",
            isSelected: false,
            picture: "assets/images/weapon_types/punch.svg"),
        name: "Unarmed strike"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d4",
        type: WeaponTypeModel(
            name: "Fist",
            isSelected: false,
            picture: "assets/images/weapon_types/punch.svg"),
        name: "Brass knuckles"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d4",
        type: WeaponTypeModel(
            name: "Fist",
            isSelected: false,
            picture: "assets/images/weapon_types/punch.svg"),
        name: "Cestus"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d4",
        type: WeaponTypeModel(
            name: "Fist",
            isSelected: false,
            picture: "assets/images/weapon_types/punch.svg"),
        name: "Spiked gauntlet"),
  ];
  final List<WeaponTypeModel> oneHandedTypes = [
    WeaponTypeModel(
        name: "Knife",
        isSelected: false,
        picture: "assets/images/weapon_types/knife.svg"),
    WeaponTypeModel(
        name: "Sword",
        isSelected: false,
        picture: "assets/images/weapon_types/sword.svg"),
    WeaponTypeModel(
        name: "Axe",
        isSelected: false,
        picture: "assets/images/weapon_types/hatchet.svg"),
    WeaponTypeModel(
        name: "Mace",
        isSelected: false,
        picture: "assets/images/weapon_types/hammer.svg"),
    WeaponTypeModel(
        name: "Fist",
        isSelected: false,
        picture: "assets/images/weapon_types/punch.svg"),
    WeaponTypeModel(
        name: "Exotic",
        isSelected: false,
        picture: "assets/images/weapon_types/exotic.svg"),
  ];

  final List<WeaponModel> twoHandedWeapons = [
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d6",
        type: WeaponTypeModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Bayonet"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Spear",
            isSelected: false,
            picture: "assets/images/weapon_types/spear.svg"),
        name: "Boar spear"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Spear",
            isSelected: false,
            picture: "assets/images/weapon_types/spear.svg"),
        name: "Longspear"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d10",
        type: WeaponTypeModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Gladius"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Trident"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d10",
        type: WeaponTypeModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Glaive"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d10",
        type: WeaponTypeModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Bardiche"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "2d6",
        type: WeaponTypeModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Earth breaker"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d10",
        type: WeaponTypeModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Greatclub"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d12",
        type: WeaponTypeModel(
            name: "Mace",
            isSelected: false,
            picture: "assets/images/weapon_types/mace.svg"),
        name: "Warhammer"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d12",
        type: WeaponTypeModel(
            name: "Axe",
            isSelected: false,
            picture: "assets/images/weapon_types/battle-axe.svg"),
        name: "Greataxe"),
    WeaponModel(
        isSelected: false,
        critical: "19-20x2",
        damage: "2d6",
        type: WeaponTypeModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/great-sword.svg"),
        name: "Greatsword"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d10",
        type: WeaponTypeModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Guisarme"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Spear",
            isSelected: false,
            picture: "assets/images/weapon_types/spear.svg"),
        name: "Hooked lance"),
    WeaponModel(
        isSelected: false,
        critical: "x3",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Spear",
            isSelected: false,
            picture: "assets/images/weapon_types/spear.svg"),
        name: "Lance"),
    WeaponModel(
        isSelected: false,
        critical: "x4",
        damage: "2d4",
        type: WeaponTypeModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Long scythe"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d10",
        type: WeaponTypeModel(
            name: "Axe",
            isSelected: false,
            picture: "assets/images/weapon_types/battle-axe.svg"),
        name: "Hooked axe"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Spear",
            isSelected: false,
            picture: "assets/images/weapon_types/spear.svg"),
        name: "Chain spear"),
    WeaponModel(
        isSelected: false,
        critical: "19-20x2",
        damage: "1d10",
        type: WeaponTypeModel(
            name: "Sword",
            isSelected: false,
            picture: "assets/images/weapon_types/great-sword.svg"),
        name: "Elven curved blade"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d10",
        type: WeaponTypeModel(
            name: "Polearm",
            isSelected: false,
            picture: "assets/images/weapon_types/polearm.svg"),
        name: "Halberd"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d6/1d6",
        type: WeaponTypeModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Quarterstaff"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d8/1d8",
        type: WeaponTypeModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Double saber"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "2d4",
        type: WeaponTypeModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Spiked chain"),
    WeaponModel(
        isSelected: false,
        critical: "-",
        damage: "-",
        type: WeaponTypeModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Net"),
    WeaponModel(
        isSelected: false,
        critical: "19-20 x2",
        damage: "1d12",
        type: WeaponTypeModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Flying blade"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d6/1d6",
        type: WeaponTypeModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Double-chained"),
    WeaponModel(
        isSelected: false,
        critical: "x2",
        damage: "1d8/1d8",
        type: WeaponTypeModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/exotic.svg"),
        name: "Dire flail"),
    WeaponModel(
        isSelected: false,
        critical: "x4",
        damage: "1d10",
        type: WeaponTypeModel(
            name: "Exotic",
            isSelected: false,
            picture: "assets/images/weapon_types/battle-axe.svg"),
        name: "Heavy pick"),
  ];

  final List<WeaponTypeModel> twoHandedTypes = [
    WeaponTypeModel(
        name: "Sword",
        isSelected: false,
        picture: "assets/images/weapon_types/great-sword.svg"),
    WeaponTypeModel(
        name: "Spear",
        isSelected: false,
        picture: "assets/images/weapon_types/spear.svg"),
    WeaponTypeModel(
        name: "Axe",
        isSelected: false,
        picture: "assets/images/weapon_types/battle-axe.svg"),
    WeaponTypeModel(
        name: "Mace",
        isSelected: false,
        picture: "assets/images/weapon_types/mace.svg"),
    WeaponTypeModel(
        name: "Polearm",
        isSelected: false,
        picture: "assets/images/weapon_types/polearm.svg"),
    WeaponTypeModel(
        name: "Exotic",
        isSelected: false,
        picture: "assets/images/weapon_types/exotic_tw.svg"),
  ];

  final List<WeaponModel> distanceWeapons = [
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d10",
        type: WeaponTypeModel(
            name: "Crossbow",
            isSelected: false,
            picture: "assets/images/weapon_types/crossbow.svg"),
        name: "Heavy crossbow"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d6",
        type: WeaponTypeModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Throwing axe"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d6",
        type: WeaponTypeModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Javelin"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Sling"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Chakram"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Crossbow",
            isSelected: false,
            picture: "assets/images/weapon_types/crossbow.svg"),
        name: "Light crossbow"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Bow",
            isSelected: false,
            picture: "assets/images/weapon_types/bow.svg"),
        name: "Composite longbow"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d6",
        type: WeaponTypeModel(
            name: "Bow",
            isSelected: false,
            picture: "assets/images/weapon_types/bow.svg"),
        name: "Composite shortbow"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d8",
        type: WeaponTypeModel(
            name: "Bow",
            isSelected: false,
            picture: "assets/images/weapon_types/bow.svg"),
        name: "Longbow"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d6",
        type: WeaponTypeModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Pilum"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d6",
        type: WeaponTypeModel(
            name: "Bow",
            isSelected: false,
            picture: "assets/images/weapon_types/bow.svg"),
        name: "Shortbow"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "-",
        type: WeaponTypeModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Bolas"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d2",
        type: WeaponTypeModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Shuriken"),
    WeaponModel(
        isSelected: false,
        critical: "",
        damage: "1d6",
        type: WeaponTypeModel(
            name: "Throwing",
            isSelected: false,
            picture: "assets/images/weapon_types/throwing.svg"),
        name: "Throwing shield"),
  ];

  final List<WeaponTypeModel> distanceTypes = [
    WeaponTypeModel(
        name: "Bow",
        isSelected: false,
        picture: "assets/images/weapon_types/bow.svg"),
    WeaponTypeModel(
        name: "Crossbow",
        isSelected: false,
        picture: "assets/images/weapon_types/crossbow.svg"),
    WeaponTypeModel(
        name: "Throwing",
        isSelected: false,
        picture: "assets/images/weapon_types/throwing.svg"),
  ];

  final List<ArmorModel> lightArmours = [
    ArmorModel(
        type: ArmorTypeModel(
            name: "light armor",
            isSelected: false,
            picture: "assets/images/armors/light.svg"),
        isSelected: false,
        name: "Quilted cloth"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "light armor",
            isSelected: false,
            picture: "assets/images/armors/light.svg"),
        isSelected: false,
        name: "Padded"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "light armor",
            isSelected: false,
            picture: "assets/images/armors/light.svg"),
        isSelected: false,
        name: "Silken ceremonial"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "light armor",
            isSelected: false,
            picture: "assets/images/armors/light.svg"),
        isSelected: false,
        name: "Lamellar cuirass"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "light armor",
            isSelected: false,
            picture: "assets/images/armors/light.svg"),
        isSelected: false,
        name: "Leather"),
  ];
  List<ArmorModel> mediumArmours = [
    ArmorModel(
        type: ArmorTypeModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        isSelected: false,
        name: "Studded leather"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        isSelected: false,
        name: "Wooden plaques"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        isSelected: false,
        name: "Chain shirt"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        isSelected: false,
        name: "Hide"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        isSelected: false,
        name: "Lamellar"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        isSelected: false,
        name: "Scale mail"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "medium armor",
            isSelected: false,
            picture: "assets/images/armors/medium.svg"),
        isSelected: false,
        name: "Agile breastplate"),
  ];

  List<ArmorModel> heavyArmours = [
    ArmorModel(
        type: ArmorTypeModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        isSelected: false,
        name: "Breastplate"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        isSelected: false,
        name: "Chainmail"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        isSelected: false,
        name: "Mountain pattern"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        isSelected: false,
        name: "Splint mail"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        isSelected: false,
        name: "Agile half-plate"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        isSelected: false,
        name: "Half-plate"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        isSelected: false,
        name: "Full plate"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "heavy armor",
            isSelected: false,
            picture: "assets/images/armors/heavy.svg"),
        isSelected: false,
        name: "Stoneplate"),
  ];

  List<ArmorModel> lightshields = [
    ArmorModel(
        type: ArmorTypeModel(
            name: "buckler",
            isSelected: false,
            picture: "assets/images/shields/buckler.svg"),
        isSelected: false,
        name: "Buckler"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "light shield",
            isSelected: false,
            picture: "assets/images/shields/light.svg"),
        isSelected: false,
        name: "wooden shield"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "light shield",
            isSelected: false,
            picture: "assets/images/shields/light.svg"),
        isSelected: false,
        name: "iron shield"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "light shield",
            isSelected: false,
            picture: "assets/images/shields/light.svg"),
        isSelected: false,
        name: "steel shield"),
  ];

  List<ArmorModel> heavyShields = [
    ArmorModel(
        type: ArmorTypeModel(
            name: "heavy shield",
            isSelected: false,
            picture: "assets/images/shields/heavy.svg"),
        isSelected: false,
        name: "Wooden shield"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "heavy shield",
            isSelected: false,
            picture: "assets/images/shields/heavy.svg"),
        isSelected: false,
        name: "Iron shield"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "heavy shield",
            isSelected: false,
            picture: "assets/images/shields/heavy.svg"),
        isSelected: false,
        name: "Steel shield"),
    ArmorModel(
        type: ArmorTypeModel(
            name: "heavy shield",
            isSelected: false,
            picture: "assets/images/shields/heavy.svg"),
        isSelected: false,
        name: "Tower shield"),
  ];

  List<ArmorTypeModel> armorTypes = [
    ArmorTypeModel(
        name: "No armor",
        isSelected: false,
        picture: "assets/images/armors/none.svg"),
    ArmorTypeModel(
        name: "Light armor",
        isSelected: false,
        picture: "assets/images/armors/light.svg"),
    ArmorTypeModel(
        name: "Medium armor",
        isSelected: false,
        picture: "assets/images/armors/medium.svg"),
    ArmorTypeModel(
        name: "Heavy armor",
        isSelected: false,
        picture: "assets/images/armors/heavy.svg"),
  ];

  List<ArmorTypeModel> shieldTypes = [
    ArmorTypeModel(
        name: "No shield",
        isSelected: false,
        picture: "assets/images/shields/no-shield.svg"),
    ArmorTypeModel(
        name: "Buckler",
        isSelected: false,
        picture: "assets/images/shields/buckler.svg"),
    ArmorTypeModel(
        name: "Light shield",
        isSelected: false,
        picture: "assets/images/shields/light.svg"),
    ArmorTypeModel(
        name: "Heavy shield",
        isSelected: false,
        picture: "assets/images/shields/heavy.svg"),
  ];
}
