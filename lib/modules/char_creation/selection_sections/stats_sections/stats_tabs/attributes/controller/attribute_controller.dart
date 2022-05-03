import 'package:fantasy_name_generator/shared/data/language_data.dart';

import '../../../../../../../models/char_personal_models/language_model.dart';
import '../../../../../../../models/class_models/skill_model.dart';
import '../../../../../../../models/combat_models/base_atribute_model.dart';
import '../../../../../../../shared/utils/utils.dart';

class AttributeController {
  AttributeModel attribute = AttributeModel();

  AttributeModel ajustStatsToLevel(
      AttributeModel atrb, int level, String atrbString) {
    int mainAttributeIncrement = 0;
    double secondaryAttributeIncrement = 0.0;
    var atrbValues = atrb;
    for (var i = 4; i <= level; i = i + 4) {
      mainAttributeIncrement++;
      secondaryAttributeIncrement = secondaryAttributeIncrement + 0.5;
    }
    atrb.strength = atrbString == "strength"
        ? atrbValues.strength + mainAttributeIncrement
        : atrbValues.strength + secondaryAttributeIncrement.floor();
    atrb.dexterity = atrbString == "dexterity"
        ? atrbValues.dexterity + mainAttributeIncrement
        : atrbValues.dexterity + secondaryAttributeIncrement.floor();
    atrb.constitution =
        atrbValues.constitution + secondaryAttributeIncrement.floor();
    atrb.intelligence = atrbString == "intelligence"
        ? atrbValues.intelligence + mainAttributeIncrement
        : atrbValues.intelligence + secondaryAttributeIncrement.floor();
    atrb.wisdom = atrbString == "wisdom"
        ? atrbValues.wisdom + mainAttributeIncrement
        : atrbValues.wisdom + secondaryAttributeIncrement.floor();
    atrb.charisma = atrbString == "charisma"
        ? atrbValues.charisma + mainAttributeIncrement
        : atrbValues.charisma + secondaryAttributeIncrement.floor();
    return atrbValues;
  }

  AttributeModel ajustStatsToRace(
      String race, String mainAtrb, AttributeModel atrb) {
    if (race == "Human" || race == "Half-elf" || race == "Half-orc") {
      switch (mainAtrb) {
        case "strength":
          atrb = calculateAjustToRace(atrb, 2, 0, 0, 0, 0, 0);
          break;
        case "dexterity":
          atrb = calculateAjustToRace(atrb, 0, 2, 0, 0, 0, 0);
          break;
        case "intelligence":
          atrb = calculateAjustToRace(atrb, 0, 0, 0, 2, 0, 0);
          break;
        case "wisdom":
          atrb = calculateAjustToRace(atrb, 0, 0, 0, 0, 2, 0);
          break;
        default:
          atrb = calculateAjustToRace(atrb, 0, 0, 0, 0, 0, 2);
      }
    }
    switch (race) {
      case "Orc":
        atrb = calculateAjustToRace(atrb, 4, 0, 2, -2, -2, -2);
        break;
      case "Elf":
        atrb = calculateAjustToRace(atrb, 0, 2, -2, 2, 0, 0);
        break;
      case "Dwarf":
        atrb = calculateAjustToRace(atrb, 0, 0, 2, 0, 2, -2);
        break;
      case "Gnome":
        atrb = calculateAjustToRace(atrb, -2, 0, 2, 0, 0, 2);
        break;
      case "Halfling":
        atrb = calculateAjustToRace(atrb, -2, 2, 0, 0, 0, 2);
        break;
      default:
    }
    return atrb;
  }

  AttributeModel calculateAjustToRace(
    AttributeModel atrb,
    int adjutStr,
    int ajustDex,
    int ajustCon,
    int adjustInt,
    int ajustWis,
    int ajustCha,
  ) {
    var ajustedAtrb = atrb;
    atrb.strength = ajustedAtrb.strength + adjutStr;
    atrb.dexterity = ajustedAtrb.dexterity + ajustDex;
    atrb.constitution = ajustedAtrb.constitution + ajustCon;
    atrb.intelligence = ajustedAtrb.intelligence + adjustInt;
    atrb.wisdom = ajustedAtrb.wisdom + ajustWis;
    atrb.charisma = ajustedAtrb.charisma + ajustCha;
    return atrb;
  }

  bool findIfItIsRangeCombatDistribution(String physicalStyle) {
    if (physicalStyle == "Bowman" ||
        physicalStyle == "Marksman" ||
        physicalStyle == "Thrower") {
      return true;
    } else {
      return false;
    }
  }

  AttributeModel generateAllAttributes(
      int level, String className, String physicalStyle, AttributeModel atrb) {
    List<int> atrbValues = [];
    for (var i = 0; i < 6; i++) {
      var atrbValue = rollingDice(10) + rollingDice(10) + rollingDice(10);
      if (level <= 20) {
        while (atrbValue < 6) {
          atrbValue = rollingDice(10) + rollingDice(10) + rollingDice(10);
        }
        atrbValue = atrbValue > 18 ? 18 : atrbValue;
      } else if (level > 20 && level < 26) {
        while (atrbValue < 10) {
          atrbValue = rollingDice(10) + rollingDice(10) + rollingDice(10);
        }
        atrbValue = atrbValue > 18 ? 18 : atrbValue;
      } else {
        atrbValue = 18;
      }
      atrbValues.add(atrbValue);
    }
    atrbValues.sort((b, a) => a.compareTo(b));
    bool isRange = findIfItIsRangeCombatDistribution(physicalStyle);
    AttributeModel diceAtrb = AttributeModel();
    switch (className) {
      case "Barbarian":
        isRange
            ? diceAtrb = sortAttributesToClass(
                atrb,
                atrbValues[2],
                atrbValues[0],
                atrbValues[1],
                atrbValues[4],
                atrbValues[3],
                atrbValues[5])
            : diceAtrb = sortAttributesToClass(
                atrb,
                atrbValues[0],
                atrbValues[2],
                atrbValues[1],
                atrbValues[4],
                atrbValues[3],
                atrbValues[5]);
        break;
      case "Warrior":
        isRange
            ? diceAtrb = sortAttributesToClass(
                atrb,
                atrbValues[2],
                atrbValues[0],
                atrbValues[1],
                atrbValues[4],
                atrbValues[3],
                atrbValues[5])
            : diceAtrb = sortAttributesToClass(
                atrb,
                atrbValues[0],
                atrbValues[2],
                atrbValues[1],
                atrbValues[4],
                atrbValues[3],
                atrbValues[5]);
        break;
      case "Arcanist":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[5], atrbValues[2],
            atrbValues[4], atrbValues[0], atrbValues[3], atrbValues[1]);
        break;
      case "Alchemist":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[5], atrbValues[2],
            atrbValues[3], atrbValues[0], atrbValues[1], atrbValues[4]);
        break;
      case "Wizard":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[5], atrbValues[3],
            atrbValues[2], atrbValues[0], atrbValues[1], atrbValues[4]);
        break;
      case "Cleric":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[2], atrbValues[3],
            atrbValues[1], atrbValues[4], atrbValues[0], atrbValues[5]);
        break;
      case "Druid":
        isRange
            ? diceAtrb = sortAttributesToClass(
                atrb,
                atrbValues[3],
                atrbValues[2],
                atrbValues[1],
                atrbValues[5],
                atrbValues[0],
                atrbValues[4])
            : diceAtrb = sortAttributesToClass(
                atrb,
                atrbValues[2],
                atrbValues[3],
                atrbValues[1],
                atrbValues[5],
                atrbValues[0],
                atrbValues[4]);
        break;
      case "Rogue":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[3], atrbValues[0],
            atrbValues[4], atrbValues[2], atrbValues[5], atrbValues[1]);
        break;
      case "Ranger":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[1], atrbValues[0],
            atrbValues[3], atrbValues[5], atrbValues[2], atrbValues[4]);
        break;
      case "Paladin":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[0], atrbValues[4],
            atrbValues[2], atrbValues[5], atrbValues[3], atrbValues[1]);
        break;
      case "Bard":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[5], atrbValues[3],
            atrbValues[4], atrbValues[2], atrbValues[1], atrbValues[0]);
        break;
      case "Sorcerer":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[5], atrbValues[4],
            atrbValues[2], atrbValues[3], atrbValues[1], atrbValues[0]);
        break;
      case "Monk":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[2], atrbValues[0],
            atrbValues[3], atrbValues[4], atrbValues[1], atrbValues[5]);
        break;
      case "Noble":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[4], atrbValues[4],
            atrbValues[4], atrbValues[2], atrbValues[2], atrbValues[1]);
        break;
      case "Aristocrat":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[4], atrbValues[4],
            atrbValues[4], atrbValues[0], atrbValues[1], atrbValues[3]);
        break;
      case "Bandit":
        isRange
            ? diceAtrb = sortAttributesToClass(
                atrb,
                atrbValues[0],
                atrbValues[1],
                atrbValues[2],
                atrbValues[5],
                atrbValues[3],
                atrbValues[4])
            : diceAtrb = sortAttributesToClass(
                atrb,
                atrbValues[1],
                atrbValues[0],
                atrbValues[2],
                atrbValues[5],
                atrbValues[3],
                atrbValues[4]);
        break;
      case "Samurai":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[0], atrbValues[1],
            atrbValues[2], atrbValues[5], atrbValues[3], atrbValues[4]);
        break;
      case "Summoner":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[1], atrbValues[2],
            atrbValues[3], atrbValues[5], atrbValues[4], atrbValues[0]);
        break;
      case "Antipaladin":
        diceAtrb = sortAttributesToClass(atrb, atrbValues[0], atrbValues[4],
            atrbValues[2], atrbValues[5], atrbValues[3], atrbValues[1]);
        break;
      default:
        diceAtrb = sortAttributesToClass(atrb, atrbValues[3], atrbValues[3],
            atrbValues[3], atrbValues[3], atrbValues[3], atrbValues[3]);
    }
    return diceAtrb;
  }

  AttributeModel sortAttributesToClass(
      AttributeModel atrb, int v0, int v1, int v2, int v3, int v4, int v5) {
    atrb.strength = v0;
    atrb.dexterity = v1;
    atrb.constitution = v2;
    atrb.intelligence = v3;
    atrb.wisdom = v4;
    atrb.charisma = v5;
    return atrb;
  }

  AttributeModel calculateAllModifiers(AttributeModel baseAtrb) {
    var attributes = baseAtrb;
    AttributeModel modAtrb = AttributeModel();
    modAtrb.strength = calculateModifier(attributes.strength);
    modAtrb.dexterity = calculateModifier(attributes.dexterity);
    modAtrb.constitution = calculateModifier(attributes.constitution);
    modAtrb.intelligence = calculateModifier(attributes.intelligence);
    modAtrb.wisdom = calculateModifier(attributes.wisdom);
    modAtrb.charisma = calculateModifier(attributes.charisma);
    return modAtrb;
  }

  int calculateModifier(int baseValue) {
    double doubleValue = baseValue.toDouble();
    doubleValue = (doubleValue - 10) / 2;
    if (baseValue <= 9 && baseValue >= 8) {
      doubleValue = -1;
    }
    if (baseValue <= 7 && baseValue >= 6) {
      doubleValue = -2;
    }
    return doubleValue.toInt();
  }

  AttributeModel addUpAttributeValues(int level, String className, String race,
      String mainAtrb, String physicalStyle) {
    AttributeModel atrbByDice = AttributeModel();
    AttributeModel atrbByRace = AttributeModel();
    AttributeModel atrbByLevel = AttributeModel();
    AttributeModel charAtrb = AttributeModel();
    atrbByDice =
        generateAllAttributes(level, className, physicalStyle, atrbByDice);
    atrbByRace = ajustStatsToRace(race, mainAtrb, atrbByRace);
    atrbByLevel = ajustStatsToLevel(atrbByLevel, level, mainAtrb);
    charAtrb.strength =
        atrbByDice.strength + atrbByRace.strength + atrbByLevel.strength;
    charAtrb.dexterity =
        atrbByDice.dexterity + atrbByRace.dexterity + atrbByLevel.dexterity;
    charAtrb.constitution = atrbByDice.constitution +
        atrbByRace.constitution +
        atrbByLevel.constitution;
    charAtrb.intelligence = atrbByDice.intelligence +
        atrbByRace.intelligence +
        atrbByLevel.intelligence;
    charAtrb.wisdom =
        atrbByDice.wisdom + atrbByRace.wisdom + atrbByLevel.wisdom;
    charAtrb.charisma =
        atrbByDice.charisma + atrbByRace.charisma + atrbByLevel.charisma;

    return charAtrb;
  }

  List<LanguageModel> calculatingLanguages(
      List<SkillModel> skills, int intelligence, String initialIdiom) {
    List<LanguageModel> allIdioms = [];
    allIdioms = LanguageData().allLanguagues;
    int idiomsQnt = intelligence +
        (skills
                    .firstWhere((element) => element.name == "Linguistics")
                    .pointsAdded /
                5)
            .floor();
    List<LanguageModel> idioms = [];
    idioms = allIdioms
        .where((element) =>
            element.name == initialIdiom || element.name == "Common")
        .toList();

    for (var i = 0; i < idiomsQnt; i++) {
      var chance = rollingDice(100);
      if (chance > 40) {
        idioms.add(sortingOutIdiomsByProbability(allIdioms, 5, idioms));
      } else if (chance < 41 && chance > 20) {
        idioms.add(sortingOutIdiomsByProbability(allIdioms, 4, idioms));
      } else if (chance < 21 && chance > 10) {
        idioms.add(sortingOutIdiomsByProbability(allIdioms, 3, idioms));
      } else if (chance < 9 && chance > 3) {
        idioms.add(sortingOutIdiomsByProbability(allIdioms, 2, idioms));
      } else {
        idioms.add(sortingOutIdiomsByProbability(allIdioms, 1, idioms));
      }
    }
    return idioms;
  }

  LanguageModel sortingOutIdiomsByProbability(List<LanguageModel> allIdioms,
      int idiomDifficulty, List<LanguageModel> idioms) {
    List<LanguageModel> newIdioms = allIdioms
        .where((element) => element.probability == idiomDifficulty)
        .toList();
    LanguageModel newIdiom =
        LanguageModel(name: "", spokenBy: "", probability: 0);
    newIdioms.shuffle();
    for (var i = 0; i < newIdioms.length; i++) {
      if (!idioms.contains(newIdioms[i])) {
        newIdiom = newIdioms[i];
        return newIdiom;
      }
    }
    if (newIdiom.name == "") {
      allIdioms.shuffle();
      for (var i = 0; i < allIdioms.length; i++) {
        if (!idioms.contains(allIdioms[i])) {
          newIdiom = allIdioms[i];
          return newIdiom;
        }
      }
    }
    return newIdiom;
  }
}
