import '../../../../../../../models/class_models/level_model.dart';
import '../../../../../../../models/class_models/traits_model.dart';
import '../../../../../../../models/combat_models/base_atribute_model.dart';
import '../../../../../../../models/combat_models/resistance_model.dart';
import '../../../../../../../models/equip_models/armor_models/armor_model.dart';
import '../../../../../../../models/equip_models/equip_model.dart';
import '../../../../../../../models/equip_models/magic_equip_models/enchant_model.dart';
import '../../../../../../../models/equip_models/magic_equip_models/wonderous_items_model.dart';
import '../../../../../../../models/key_value.model.dart';
import '../../../../../../../models/race_models/race_model.dart';
import '../../../../../../../shared/data/equip_data/enchant_data.dart';
import '../../../../../../../shared/data/race_data/race_data.dart';
import '../../../../../../../shared/utils/utils.dart';

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

  ArmorModel? generateArmor(List<String> fobiddenTypes, String mainAtrb,
      String className, List<ArmorModel> shieldList, String combatStyle) {
    ArmorModel armor;
    List<ArmorModel> armors;
    if (combatStyle == "Spellcaster") {
      return null;
    }
    if (className == "Monk") {
      return null;
    } else if (className == "Druid") {
      armors =
          shieldList.where((element) => element.fitForDruid == true).toList();
    } else if (mainAtrb == "dexterity" || className == "Bandit") {
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
            mundanePrice: armors[random].mundanePrice,
            type: armors[random].type,
          )
        : armor = ArmorModel(
            name: armors.last.name,
            defenseBonus: armors.last.defenseBonus,
            checkPenalty: armors.last.checkPenalty,
            maxDexAllowed: armors.last.maxDexAllowed,
            speedPenalty: armors.last.speedPenalty,
            mundanePrice: armors.last.mundanePrice,
            type: armors.last.type,
          );
    return armor;
  }

  ArmorModel? applyMagicToArmorAndShield(int level, List<EnchantModel> list,
      ArmorModel equip, String combatStyle) {
    if (level < 5) {
      return equip;
    }
    if (combatStyle == "Spellcaster") {
      return null;
    }
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
    // boost from aid potion
    if (level > 8) {
      hitPoints += rollingDice(8) + 10;
    }
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

  int findBoostyItem(List<WonderousItemsModel> list, String name) {
    WonderousItemsModel itemBoost;
    var boost = 0;
    if (list.any((element) => element.name!.contains(name))) {
      itemBoost = list.firstWhere((element) => element.name!.contains(name));
      boost = itemBoost.bonus!;
    }
    return boost;
  }

  List<int> claculatingHitDefense(
    EquipModel equip,
    int level,
    int dex,
    RaceModel race,
    String className,
    int wis,
    List<WonderousItemsModel> list,
    List<TraitModel> charFeats,
    String spellCaster,
  ) {
    int armorDefense = equip.armour != null ? equip.armour!.defenseBonus : 0;
    int shieldDefense = equip.shield != null ? equip.shield!.defenseBonus : 0;

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
      surprise += wis;
      for (var i = 3; i < level; i += 4) {
        armorAc++;
        touch++;
        surprise++;
      }
    }
    if (spellCaster == "Spellcaster") {
      var arcaneArmor = level > 5 ? 4 : 0;
      var arcaneShield = level > 7 ? 4 : 0;
      var bracersBoost = findBoostyItem(list, "Bracers of armor");
      armorAc += arcaneArmor + arcaneShield + bracersBoost;
      touch += arcaneArmor + arcaneShield;
      surprise += arcaneArmor + arcaneShield + bracersBoost;
    }

    if (charFeats.any((element) => element.traiName == "Dodge")) {
      armorAc++;
      touch++;
    }
    if (charFeats.any((element) => element.traiName == "Two-Weapon Defense")) {
      armorAc++;
      surprise++;
    }
    if (charFeats.any((element) => element.traiName == "Shield Focus")) {
      surprise++;
      armorAc++;
      var shieldFocusGreater =
          charFeats.any((element) => element.traiName == "Greater Shield Focus")
              ? 1
              : 0;
      armorAc += shieldFocusGreater;
      surprise += shieldFocusGreater;
    }
    if (charFeats.any((element) => element.traiName == "Armor Focus")) {
      armorAc++;
      surprise++;
    }
    var ringBoost = findBoostyItem(list, "Ring of protection");
    armorAc += ringBoost;
    touch += ringBoost;
    surprise += ringBoost;
    var amuletBoost = findBoostyItem(list, "Amulet of natural armor");
    armorAc += amuletBoost;
    surprise += amuletBoost;
    if (list.any((element) => element.name == "Vambraces of defense")) {
      armorAc++;
      surprise++;
    }
    //boost from mandatory iounstone for AC
    armorAc += level > 9 ? 1 : 0;
    surprise += level > 9 ? 1 : 0;
    touch += level > 9 ? 1 : 0;
    List<int> allDefenses = [armorAc, surprise, touch];
    return allDefenses;
  }

  ResistanceModel calculateResistances(
      List<LevelModel> goodOrBad,
      int level,
      String upgrade,
      String race,
      String className,
      List<TraitModel> charFeats,
      AttributeModel atrb,
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
      default:
        partialFort = bonusAtLevel.good;
        partialRef = bonusAtLevel.good;
        partialWill = bonusAtLevel.good;
    }
    if (race == "Halfling") {
      partialFort += 1;
      partialRef += 1;
      partialWill += 1;
    }
    if ((className == "Paladin" || className == "Antipaladin") && level > 1) {
      partialFort += atrb.charisma;
      partialWill += atrb.charisma;
      partialRef += atrb.charisma;
    }
    if (charFeats.any((element) => element.traiName == "Lightning Reflexes")) {
      partialRef += 2;
    }
    if (charFeats.any((element) => element.traiName == "Iron Will")) {
      partialWill += 2;
    }
    if (charFeats.any((element) => element.traiName == "Great Fortitude")) {
      partialFort += 2;
    }
    if (items.any((element) => element.name!.contains("Pale green"))) {
      partialFort++;
      partialWill++;
      partialRef++;
    }
    var boost = findBoostyItem(items, "Cloak of resistance");
    resists.fortitude = partialFort + atrb.constitution + boost;
    resists.reflex = partialRef + atrb.dexterity + boost;
    if (charFeats
        .any((element) => element.traiName == "Steadfast Personality")) {
      resists.will = partialWill + atrb.charisma + boost;
    } else {
      resists.will = partialWill + atrb.wisdom + boost;
    }
    if (charFeats.any((element) => element.traiName == "Twist Away")) {
      resists.fortitude = resists.reflex;
    }
    return resists;
  }

  int claculateMagicEquipPrice(ArmorModel defenseEquip, int level) {
    int valueLabel = defenseEquip.mundanePrice;
    if (level < 3) {
      return valueLabel;
    } else if (level == 3 || level == 4) {
      return valueLabel += 150;
    } else if (defenseEquip.enchantment!.isEmpty) {
      return valueLabel;
    } else if (defenseEquip.enchantment!.length > 1) {
      var magicPrices = EnchantData();
      int price = (defenseEquip.enchantment![0].power +
          defenseEquip.enchantment![1].power);
      KeyValueModel priceAdded = magicPrices.pricingForMagicWeapons
          .firstWhere((element) => element.key == price);
      valueLabel += (150 + (priceAdded.value / 2)).toInt();
    } else {
      valueLabel +=
          (defenseEquip.enchantment![0].enchantPrice / 2).floor() + 150;
    }
    return valueLabel;
  }
}
