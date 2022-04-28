import 'package:fantasy_name_generator/models/combat_models/base_atribute_model.dart';

import '../../../../../../../models/class_models/class_model.dart';
import '../../../../../../../models/class_models/traits_model.dart';
import '../../../../../../../models/combat_models/physical_style_model.dart';
import '../../../../../../../models/equip_models/armor_models/armor_model.dart';
import '../../../../../../../models/equip_models/magic_equip_models/enchant_model.dart';
import '../../../../../../../models/equip_models/weapon_models/weapon_model.dart';
import '../../../../../../../models/key_value.model.dart';
import '../../../../../../../models/race_models/race_model.dart';
import '../../../../../../../shared/data/equip_data/enchant_data.dart';
import '../../../../../../../shared/data/race_data/race_data.dart';
import '../../../../../../../shared/utils/utils.dart';

class OffenseController {
  sortingWeapons(PhysicalStyleModel style, List<WeaponModel> allWeapons,
      String className) {
    List<WeaponModel> list = allWeapons
        .where((element) =>
            (element.type!.wielding == style.weaponType ||
                element.type!.name == style.weaponType) &&
            element.type!.name != "Fist" &&
            element.type!.name != "Knife" &&
            element.type!.name != "Exotic" &&
            !element.forbiddenTo.contains(className))
        .toList();
    return list;
  }

  WeaponModel gettingMainWeapon(List<PhysicalStyleModel> allStyles,
      String charPhysical, List<WeaponModel> allWeapons, String className) {
    WeaponModel weapon;
    List<PhysicalStyleModel> style = allStyles;
    List<WeaponModel> possibleWeapons = [];
    if (charPhysical == "Berserker") {
      possibleWeapons = sortingWeapons(style[0], allWeapons, className);
    } else if (charPhysical == "Soldier") {
      possibleWeapons = sortingWeapons(style[1], allWeapons, className);
    } else if (charPhysical == "Knifeman") {
      possibleWeapons = allWeapons
          .where((element) =>
              element.type!.name == style[4].weaponType &&
              !element.forbiddenTo.contains(className))
          .toList();
    } else if (charPhysical == "Dual-wielder") {
      possibleWeapons = allWeapons
          .where((element) =>
              (element.type!.name == "Sword" ||
                  element.type!.name == "Axe" ||
                  element.type!.name == "Knife") &&
              element.type!.wielding == "One-handed" &&
              !element.forbiddenTo.contains(className))
          .toList();
    } else if (charPhysical == "Swordsman") {
      possibleWeapons = allWeapons
          .where((element) =>
              element.type!.name == "Sword" &&
              element.type!.wielding == "One-handed" &&
              !element.forbiddenTo.contains(className))
          .toList();
    } else if (charPhysical == "Martial") {
      possibleWeapons = allWeapons
          .where((element) =>
              element.type!.wielding == "One-handed" &&
              element.type!.name == "Fist" &&
              !element.forbiddenTo.contains(className))
          .toList();
    } else if (charPhysical == "Bowman") {
      possibleWeapons = allWeapons
          .where((element) =>
              element.name == "Composite longbow" &&
              !element.forbiddenTo.contains(className))
          .toList();
    } else if (charPhysical == "Marksman") {
      possibleWeapons = allWeapons
          .where((element) =>
              element.type!.name == "Crossbow" &&
              !element.forbiddenTo.contains(className))
          .toList();
    } else if (charPhysical == "Thrower") {
      possibleWeapons = allWeapons
          .where((element) =>
              element.type!.name == "Throwing" &&
              !element.forbiddenTo.contains(className))
          .toList();
    }
    var random = generateRandom(possibleWeapons.length);
    if ((className == "Barbarian" ||
            className == "Warrior" ||
            className == "Paladin" ||
            className == "Antipaladin" ||
            className == "Samurai") &&
        charPhysical == "Berserker") {
      var axeOrSwordOrMace = possibleWeapons
          .where((element) =>
              element.type!.name == "Axe" ||
              element.type!.name == "Sword" ||
              element.type!.name == "Mace")
          .toList();
      var random = generateRandom(axeOrSwordOrMace.length);
      weapon = axeOrSwordOrMace[random];
    } else {
      weapon = possibleWeapons[random];
    }
    return weapon;
  }

  WeaponModel generatingAlternativeWeapon(
      String charPhysical, List<WeaponModel> allWeapons, String className) {
    WeaponModel alternatiWeapon;
    if (charPhysical == "Bowman" ||
        charPhysical == "Marksman" ||
        charPhysical == "Thrower") {
      List<WeaponModel> weapons = allWeapons
          .where((element) =>
              element.type!.name == "Sword" &&
              !element.forbiddenTo.contains(className))
          .toList();
      var random = generateRandom(weapons.length);
      alternatiWeapon = weapons[random];
    } else {
      List<WeaponModel> weapons = allWeapons
          .where((element) =>
              (element.type!.name == "Bow" ||
                  element.type!.name == "Crossbow" ||
                  element.type!.name == "Throwing") &&
              !element.forbiddenTo.contains(className))
          .toList();
      var random = generateRandom(weapons.length);
      alternatiWeapon = weapons[random];
    }
    return alternatiWeapon;
  }

  WeaponModel generateGearForNonPhysicalStyleChars(
      List<WeaponModel> allWeapons, bool isMelee) {
    WeaponModel meleeWeapon;
    meleeWeapon = allWeapons.firstWhere((element) => element.name == "Dagger");

    WeaponModel rangeWeapon;
    rangeWeapon =
        allWeapons.firstWhere((element) => element.type!.name == "Crossbow");
    return isMelee ? meleeWeapon : rangeWeapon;
  }

  WeaponModel? applyMagicToWeapon(
      int level,
      List<EnchantModel> magicEnchantments,
      List<EnchantModel> weaponEnchants,
      String physicalStyle,
      WeaponModel range,
      WeaponModel melee,
      bool isMelee) {
    var minAvail = discoverMinAvailability(level);
    var checkAvailability = level < 14 ? 5 : minAvail;
    List<EnchantModel> enchantPowerLvs = magicEnchantments
        .where((element) =>
            element.availability <= level && element.availability >= minAvail)
        .toList();
    var enchants = weaponEnchants
        .where((element) => element.availability <= checkAvailability)
        .toList();
    WeaponModel meleeWeapon = melee;
    WeaponModel rangeWeapon = range;
    if (physicalStyle == "Bowman" ||
        physicalStyle == "Marksman" ||
        physicalStyle == "Thrower") {
      if (!isMelee) {
        rangeWeapon.enchantment = [enchantPowerLvs.last];
        rangeWeapon.enchantment = addOtherEnchantByChance(
            rangeWeapon.enchantment!, enchants, enchantPowerLvs);
        return rangeWeapon;
      } else {
        meleeWeapon.enchantment = [enchantPowerLvs.first];
        if (meleeWeapon.enchantment != [] && level > 7) {
          meleeWeapon.enchantment = addOtherEnchantByChance(
              meleeWeapon.enchantment!, enchants, enchantPowerLvs);
        }
        return meleeWeapon;
      }
    } else {
      if (isMelee) {
        meleeWeapon.enchantment = [enchantPowerLvs.last];
        meleeWeapon.enchantment = addOtherEnchantByChance(
            meleeWeapon.enchantment!, enchants, enchantPowerLvs);
        return meleeWeapon;
      } else {
        rangeWeapon.enchantment = [enchantPowerLvs.first];
        if (rangeWeapon.enchantment != [] && level > 7) {
          return rangeWeapon;
        } else {
          rangeWeapon.enchantment = addOtherEnchantByChance(
              rangeWeapon.enchantment!, enchants, enchantPowerLvs);
          return rangeWeapon;
        }
      }
    }
  }

  List<EnchantModel> addOtherEnchantByChance(List<EnchantModel> weaponEnchants,
      List<EnchantModel> enchants, List<EnchantModel> power) {
    var randomchance = generateRandom(7);
    if (randomchance > 2) {
      weaponEnchants.clear();
      weaponEnchants = [power.first];
      enchants.shuffle();
      weaponEnchants.add(enchants[randomchance]);
      return weaponEnchants;
    } else {
      return weaponEnchants;
    }
  }

  int calculateSpeed(List<RaceModel> races, int level, String charRace,
      String charClass, int speed, ArmorModel? armor) {
    var raceGotten = races.firstWhere((element) => element.name == charRace);
    var baseSpeed = raceGotten.speed;
    if (charClass == "Barbarian" && (armor!.type!.name == "Light")) {
      baseSpeed = baseSpeed + 10;
    }
    if (charClass == "Monk" && level > 2) {
      for (var i = 3; i <= level; i = i + 3) {
        baseSpeed = baseSpeed + 10;
      }
    }
    return speed = baseSpeed - armor!.speedPenalty;
  }

  int calculateBaseAttackBonus(
      List<ClassModel> classes, String className, int charLevel) {
    var baseAttackBonus = 0;
    var magicClasses =
        classes.where((element) => element.hitDice! < 7).toList();
    var physicalClasses =
        classes.where((element) => element.hitDice! > 9).toList();
    var mixedClasses =
        classes.where((element) => element.hitDice! == 8).toList();
    var isMagicCl = magicClasses.any((element) => element.name == className);
    var isMixCl = mixedClasses.any((element) => element.name == className);
    var isPhysCl = physicalClasses.any((element) => element.name == className);
    if (isPhysCl) {
      baseAttackBonus = charLevel;
    }
    if (isMagicCl) {
      baseAttackBonus = charLevel;
      baseAttackBonus = (baseAttackBonus / 2).floor();
    }
    if (isMixCl) {
      baseAttackBonus = 0;
      if (charLevel <= 4) {
        baseAttackBonus = charLevel - 1;
      } else if (charLevel >= 5 && charLevel <= 8) {
        baseAttackBonus = charLevel - 2;
      } else if (charLevel >= 9 && charLevel <= 12) {
        baseAttackBonus = charLevel - 3;
      } else if (charLevel >= 13 && charLevel <= 16) {
        baseAttackBonus = charLevel - 4;
      } else if (charLevel >= 17 && charLevel <= 20) {
        baseAttackBonus = charLevel - 5;
      } else if (charLevel >= 21 && charLevel <= 25) {
        baseAttackBonus = charLevel - 6;
      } else {
        baseAttackBonus = charLevel - 7;
      }
    }
    return baseAttackBonus;
  }

  int calculateCombatManeuvers(int bba, AttributeModel atrb, String race,
      List<TraitModel> charFeats, int level, bool isCmb) {
    var bAttackBonus = bba;
    var attributes = atrb;
    var cmb = 0;
    var cmd = 0;
    charFeats.any((element) => element.traiName == "Agile Maneuvers")
        ? cmb = bAttackBonus + attributes.dexterity
        : cmb = bAttackBonus + attributes.strength;
    charFeats.any((element) => element.traiName == "Defensive Combat Training")
        ? cmd = bAttackBonus + level + attributes.dexterity + 10
        : cmd = bAttackBonus + attributes.strength + attributes.dexterity + 10;
    RaceModel? charRace;
    var races = RaceData();
    charRace = races.races.firstWhere((element) => element.name == race);
    if (charRace.size == "Small") {
      cmb -= 1;
      cmd -= 1;
    }
    if (isCmb) {
      return cmb;
    } else {
      return cmd;
    }
  }

  int gettingInitiative(List<TraitModel> charFeats, int dex) {
    //Reactionary points
    int init = 2;
    init = charFeats.any((element) => element.traiName == "Initiative")
        ? init += 4
        : init;
    init += dex;
    return init;
  }

  int boostWeaponWithFeat(int melee, int range, String physical) {
    if (physical != "Bowman" ||
        physical != "Marksman" ||
        physical != "Thrower") {
      return melee;
    } else {
      return range;
    }
  }

  List<String> calculatingPhysicalAttack(
    String mainAtrb,
    AttributeModel atrb,
    int charBba,
    List<TraitModel> charFeats,
    String charClass,
    String physical,
    int level,
    int enchantPowerMelee,
    int enchantPowerRange,
  ) {
    String meleeAtk = "";
    int meleeAtkNum = 0;
    String rangeAtk = "";
    int rangeAtkNum = 0;
    int strOrWis = mainAtrb == "wisdom" ? atrb.wisdom : atrb.strength;
    int bba = charBba;
    if (charFeats.any((element) => element.traiName == "Weapon Finesse")) {
      meleeAtkNum += atrb.dexterity + bba;
    } else {
      meleeAtkNum += strOrWis + bba;
    }
    rangeAtkNum += atrb.dexterity + bba;
    if (level == 3 || level == 4) {
      meleeAtkNum++;
      rangeAtkNum++;
    } else if (level > 4) {
      meleeAtkNum += enchantPowerMelee;
      rangeAtkNum += enchantPowerRange;
    }
    // boost from aid potion
    if (level > 8) {
      meleeAtkNum++;
      rangeAtkNum++;
    }

    if (charClass == "Warrior") {
      for (var i = 5; i < level; i += 4) {
        meleeAtkNum++;
        rangeAtkNum++;
      }
    }
    if (charFeats.any((element) => element.traiName == "Weapon Focus")) {
      meleeAtkNum += boostWeaponWithFeat(1, 0, physical);
      rangeAtkNum += boostWeaponWithFeat(0, 1, physical);
    }
    if (charFeats
        .any((element) => element.traiName == "Greater Weapon Focus")) {
      meleeAtkNum += boostWeaponWithFeat(1, 0, physical);
      rangeAtkNum += boostWeaponWithFeat(0, 1, physical);
    }
    if (bba < 6) {
      meleeAtk = "+$meleeAtkNum";
      rangeAtk = "+$rangeAtkNum";
    } else if (bba > 5 && bba < 11) {
      meleeAtk = "+$meleeAtkNum / +${meleeAtkNum - 5}";
      rangeAtk = "+$rangeAtkNum / +${rangeAtkNum - 5}";
    } else if (bba > 10 && bba < 16) {
      meleeAtk = "+$meleeAtkNum / +${meleeAtkNum - 5} / +${meleeAtkNum - 10}";
      rangeAtk = "+$rangeAtkNum / +${rangeAtkNum - 5} / +${rangeAtkNum - 10}";
    } else {
      meleeAtk =
          "+$meleeAtkNum / +${meleeAtkNum - 5} / +${meleeAtkNum - 10} / +${meleeAtkNum - 15}";
      rangeAtk =
          "+$rangeAtkNum / +${rangeAtkNum - 5} / +${rangeAtkNum - 10} / +${rangeAtkNum - 15}";
    }
    List<String> attacks = [meleeAtk, rangeAtk];
    return attacks;
  }

  List<int> calculatingPhysicalDamage(
    String charClass,
    String mainAtrb,
    AttributeModel atrb,
    List<TraitModel> charFeats,
    String physical,
    int level,
    int enchantPowerMelee,
    int enchantPowerRange,
  ) {
    int meleeDamage = 0;
    int rangeDamage = 0;
    if (level > 4) {
      meleeDamage += atrb.strength + enchantPowerMelee;
      rangeDamage += atrb.strength + enchantPowerRange;
    } else {
      meleeDamage += atrb.strength;
      rangeDamage += atrb.strength;
    }
    if (physical == "Berserker") {
      meleeDamage = (meleeDamage * 1.5).floor();
    }
    if (charClass == "Warrior") {
      for (var i = 5; i < level; i += 4) {
        meleeDamage++;
        rangeDamage++;
      }
    }
    if (charFeats
        .any((element) => element.traiName == "Weapon Specialization")) {
      meleeDamage += boostWeaponWithFeat(2, 0, physical);
      rangeDamage += boostWeaponWithFeat(0, 2, physical);
    }
    if (charFeats.any(
        (element) => element.traiName == "Greater Weapon Specialization")) {
      meleeDamage += boostWeaponWithFeat(2, 0, physical);
      rangeDamage += boostWeaponWithFeat(0, 2, physical);
    }
    List<int> damages = [meleeDamage, rangeDamage];
    return damages;
  }

  int claculateWeaponPrice(WeaponModel weapon, int level) {
    int valueLabel = 0;
    if (weapon.enchantment == null) {
      return 0;
    } else if (level == 3 || level == 4) {
      return valueLabel = weapon.mundanePrice;
    } else if (weapon.enchantment!.isEmpty) {
      valueLabel = weapon.mundanePrice;
    } else if (weapon.enchantment!.length > 1) {
      var magicPrices = EnchantData();
      int price = (weapon.enchantment![0].power + weapon.enchantment![1].power);
      KeyValueModel priceAdded = magicPrices.pricingForMagicWeapons
          .firstWhere((element) => element.key == price);
      valueLabel = (weapon.mundanePrice + priceAdded.value + 300).toInt();
    } else {
      valueLabel =
          weapon.mundanePrice + weapon.enchantment![0].enchantPrice + 300;
    }
    return valueLabel;
  }
}
