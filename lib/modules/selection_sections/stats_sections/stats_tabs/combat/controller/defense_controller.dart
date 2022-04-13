import 'package:fantasy_name_generator/models/base_atribute_model.dart';
import 'package:fantasy_name_generator/models/equip_models/equip_model.dart';
import 'package:fantasy_name_generator/shared/data/race_data.dart';

import '../../../../../../models/equip_models/armor_model.dart';
import '../../../../../../models/equip_models/enchant_model.dart';
import '../../../../../../models/equip_models/wonderous_items_model.dart';
import '../../../../../../models/level_model.dart';
import '../../../../../../models/race_model.dart';
import '../../../../../../models/resistance_model.dart';
import '../../../../../../models/traits_model.dart';
import '../../../../../../shared/utils/utils.dart';

class DefenseController {
  ArmorModel? generateShield(
      String physicalChar, String className, List<ArmorModel> shieldList) {
    if (physicalChar != "Soldier") {
      return null;
    } else {
      ArmorModel shield;
      List<ArmorModel> shields;
      if (className == "Druid") {
        shields =
            shieldList.where((element) => element.fitForDruid == true).toList();
      } else {
        shields = shieldList;
      }
      var random = generateRandom(shields.length);
      shield = shields[random];
      return shield;
    }
  }

  ArmorModel generateArmor(List<String> fobiddenTypes, String mainAtrb,
      String className, List<ArmorModel> shieldList) {
    ArmorModel armor;
    List<ArmorModel> armors;
    if (className == "Druid") {
      armors =
          shieldList.where((element) => element.fitForDruid == true).toList();
    } else if (mainAtrb == "dexterity") {
      armors =
          shieldList.where((element) => element.type!.name == "Light").toList();
    } else {
      armors = shieldList
          .where((element) => !fobiddenTypes.contains(element.type!.name))
          .toList();
    }
    armors.sort(((a, b) => a.defenseBonus.compareTo(b.defenseBonus)));
    var random = generateRandom(armors.length);
    random > (armors.length / 3).floor()
        ? armor = ArmorModel(
            name: armors[random].name,
            defenseBonus: armors[random].defenseBonus,
            checkPenalty: armors[random].checkPenalty,
            maxDexAllowed: armors[random].maxDexAllowed,
            speedPenalty: armors[random].speedPenalty,
            price: armors[random].price,
            type: armors[random].type,
          )
        : armor = ArmorModel(
            name: armors.last.name,
            defenseBonus: armors.last.defenseBonus,
            checkPenalty: armors.last.checkPenalty,
            maxDexAllowed: armors.last.maxDexAllowed,
            speedPenalty: armors.last.speedPenalty,
            price: armors.last.price,
            type: armors.last.type,
          );
    return armor;
  }

  ArmorModel applyMagicToArmorAndShield(
      int level, List<EnchantModel> list, ArmorModel equip) {
    var minAvail = discoverMinAvailability(level);
    var enchantPowerLvs = list
        .where((element) =>
            element.availability <= level && element.availability >= minAvail)
        .toList();
    equip = changeDefenseEquipToMagic(equip, enchantPowerLvs);
    return equip;
  }

  ArmorModel changeDefenseEquipToMagic(
      ArmorModel equip, List<EnchantModel> list) {
    equip.enchantment = [list.last];
    equip.defenseBonus = equip.defenseBonus + equip.enchantment![0].power;
    equip.maxDexAllowed = equip.maxDexAllowed + equip.enchantment![0].power;
    equip.checkPenalty = equip.checkPenalty > equip.enchantment![0].power
        ? equip.checkPenalty - equip.enchantment![0].power
        : 0;
    return equip;
  }

  int generateHitPoints(
      int level, int constitution, List<TraitModel> charFeats, int hitDice) {
    var hitPoints = level * constitution;
    var diceHitPoints = calculateHipPointsDicePerClass(hitDice, level);
    var toughness =
        charFeats.any((element) => element.traiName == "Toughness") ? level : 0;
    hitPoints += diceHitPoints + toughness;
    return hitPoints;
  }

  int calculateHipPointsDicePerClass(int hitDice, int level) {
    var dice = hitDice;
    var rollTimes = level - 1;
    var hitpoints = dice;
    if (level > 20 && level < 26) {
      dice = dice - 3;
      for (var i = 0; i < rollTimes; i++) {
        var sum = rollingDice(dice) + 3;
        hitpoints = hitpoints + sum;
      }
    } else if (level > 25) {
      dice = dice - 5;
      for (var i = 0; i < rollTimes; i++) {
        var sum = rollingDice(dice) + 5;
        hitpoints = hitpoints + sum;
      }
    } else {
      for (var i = 0; i < rollTimes; i++) {
        hitpoints = hitpoints + rollingDice(dice);
      }
    }
    return hitpoints;
  }

  int findBoostyItem(int level, List<WonderousItemsModel> list, String name) {
    WonderousItemsModel itemBoost;
    var boost = 0;
    if (level > 2) {
      itemBoost = list.firstWhere((element) => element.name!.contains(name));
      boost = itemBoost.bonus!;
    }
    return boost;
  }

  int claculatingHitDefense(
      EquipModel equip,
      int level,
      int dex,
      RaceModel race,
      String className,
      int wis,
      List<WonderousItemsModel> list,
      bool isAc,
      isSur,
      isTch) {
    int armorDefense = equip.armour != null ? equip.armour!.defenseBonus : 0;
    int shieldDefense = equip.shield != null ? equip.shield!.defenseBonus : 0;
    int maxDex = equip.armour != null ? equip.armour!.maxDexAllowed : 0;
    if (maxDex < dex) {
      dex = maxDex;
    }
    int armorAc = 0;
    int touch = 0;
    int surprise = 0;
    armorAc = 10 + armorDefense + shieldDefense + dex;
    touch = 10 + dex;
    surprise = 10 + armorDefense + shieldDefense;
    RaceModel? charRace;
    var races = RaceData();
    charRace = races.races.firstWhere((element) => element.name == race.name);
    if (charRace.size == "Small") {
      armorAc++;
      touch++;
      surprise++;
    }
    if (className == "Monk") {
      armorAc += wis;
      touch += wis;
      surprise += wis;
    }
    var ringBoost = findBoostyItem(level, list, "Ring of protection");
    armorAc += ringBoost;
    touch += ringBoost;
    surprise += ringBoost;
    var amuletBoost = findBoostyItem(level, list, "Amulet of natural armor");
    armorAc += amuletBoost;
    touch += amuletBoost;
    surprise += amuletBoost;
    if (list.any((element) => element.name == "Vambraces of defense")) {
      armorAc++;
      surprise++;
    }
    //boost from mandatory iounstone for AC
    armorAc += level > 9 ? 1 : 0;
    surprise += level > 9 ? 1 : 0;
    touch += level > 9 ? 1 : 0;
    if (isAc) {
      return armorAc;
    } else if (isSur) {
      return surprise;
    } else if (isTch) {
      return touch;
    }
    return 0;
  }

  ResistanceModel calculateResistances(
      List<LevelModel> goodOrBad,
      int level,
      String upgrade,
      String race,
      String className,
      List<TraitModel> charFeats,
      AtributeModel atrb,
      List<WonderousItemsModel> items) {
    ResistanceModel resists = ResistanceModel();
    int partialFort = 0;
    int partialRef = 0;
    int partialWill = 0;
    var bonusAtLevel = goodOrBad[level - 1];
    switch (upgrade) {
      case "fort":
        partialFort = bonusAtLevel.good;
        partialRef = bonusAtLevel.bad;
        partialWill = bonusAtLevel.bad;
        break;
      case "ref":
        partialFort = bonusAtLevel.bad;
        partialRef = bonusAtLevel.good;
        partialWill = bonusAtLevel.bad;
        break;
      case "will":
        partialFort = bonusAtLevel.bad;
        partialRef = bonusAtLevel.bad;
        partialWill = bonusAtLevel.good;
        break;
      case "fort, will":
        partialFort = bonusAtLevel.good;
        partialRef = bonusAtLevel.bad;
        partialWill = bonusAtLevel.good;
        break;
      case "fort, ref":
        partialFort = bonusAtLevel.good;
        partialRef = bonusAtLevel.good;
        partialWill = bonusAtLevel.bad;
        break;
      case "ref, will":
        partialFort = bonusAtLevel.bad;
        partialRef = bonusAtLevel.good;
        partialWill = bonusAtLevel.good;
        break;
      case "all":
        partialFort = bonusAtLevel.good;
        partialRef = bonusAtLevel.good;
        partialWill = bonusAtLevel.good;
        break;
      default:
    }
    if (race == "Hafling") {
      partialFort += 1;
      partialRef += 1;
      partialWill += 1;
    }
    if (className == "Paladin" || className == "Antipaladin") {
      partialFort += atrb.charisma;
      partialWill += atrb.charisma;
      partialRef += atrb.charisma;
    }
    if (charFeats.any((element) => element.traiName == "Iron Will")) {
      partialWill += 2;
    }
    if (charFeats.any((element) => element.traiName == "Great Fortitude")) {
      partialFort += 2;
    }
    if (charFeats.any((element) => element.traiName == "Lightning Reflexes")) {
      partialRef += 2;
    }

    var boost = findBoostyItem(level, items, "Cloak of resistance");
    resists.fortitude = partialFort + atrb.constitution + boost;
    resists.reflex = partialRef + atrb.dexterity + boost;
    resists.will = partialWill + atrb.wisdom + boost;
    return resists;
  }
}
