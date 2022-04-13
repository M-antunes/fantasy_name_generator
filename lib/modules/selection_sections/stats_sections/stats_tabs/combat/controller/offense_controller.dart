import 'package:fantasy_name_generator/models/equip_models/armor_model.dart';

import '../../../../../../models/equip_models/enchant_model.dart';
import '../../../../../../models/equip_models/weapon_model.dart';
import '../../../../../../models/key_value.model.dart';
import '../../../../../../models/physical_style_model.dart';
import '../../../../../../shared/data/enchant_data.dart';
import '../../../../../../shared/utils/utils.dart';

class OffenseController {
  int meleePrice = 0;
  int rangePrice = 0;

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
    } else if (charPhysical == "Dual-weilder") {
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
          rangeWeapon.enchantment = addOtherEnchantByChance(
              rangeWeapon.enchantment!, enchants, enchantPowerLvs);
          return rangeWeapon;
        }
      }
    }
    return null;
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
}
