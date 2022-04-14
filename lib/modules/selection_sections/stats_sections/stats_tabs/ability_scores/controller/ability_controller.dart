import 'package:fantasy_name_generator/models/combat_models/base_atribute_model.dart';

import '../../../../../../shared/utils/utils.dart';

class AbilityController {
  AtributeModel atribute = AtributeModel();

  AtributeModel ajustStatsToLevel(
      AtributeModel atrb, int level, String atrbString) {
    int mainAtributeIncrement = 0;
    double secondaryAtributeIncrement = 0.0;
    var atrbValues = atrb;
    for (var i = 4; i <= level; i = i + 4) {
      mainAtributeIncrement++;
      secondaryAtributeIncrement = secondaryAtributeIncrement + 0.5;
    }
    atrb.strength = atrbString == "strength"
        ? atrbValues.strength + mainAtributeIncrement
        : atrbValues.strength + secondaryAtributeIncrement.floor();
    atrb.dexterity = atrbString == "dexterity"
        ? atrbValues.dexterity + mainAtributeIncrement
        : atrbValues.dexterity + secondaryAtributeIncrement.floor();
    atrb.constitution =
        atrbValues.constitution + secondaryAtributeIncrement.floor();
    atrb.intelligence = atrbString == "intelligence"
        ? atrbValues.intelligence + mainAtributeIncrement
        : atrbValues.intelligence + secondaryAtributeIncrement.floor();
    atrb.wisdom = atrbString == "wisdom"
        ? atrbValues.wisdom + mainAtributeIncrement
        : atrbValues.wisdom + secondaryAtributeIncrement.floor();
    atrb.charisma = atrbString == "charisma"
        ? atrbValues.charisma + mainAtributeIncrement
        : atrbValues.charisma + secondaryAtributeIncrement.floor();
    return atrbValues;
  }

  AtributeModel ajustStatsToRace(
      String race, String mainAtrb, AtributeModel atrb) {
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
      case "Hafling":
        atrb = calculateAjustToRace(atrb, -2, 2, 0, 0, 0, 2);
        break;
      default:
    }
    return atrb;
  }

  AtributeModel calculateAjustToRace(
    AtributeModel atrb,
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

  AtributeModel generateAllAtributes(
      int level, String className, String physicalStyle, AtributeModel atrb) {
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
    AtributeModel diceAtrb = AtributeModel();
    switch (className) {
      case "Barbarian":
        isRange
            ? diceAtrb = sortAtributesToClass(
                atrb,
                atrbValues[2],
                atrbValues[0],
                atrbValues[1],
                atrbValues[4],
                atrbValues[3],
                atrbValues[5])
            : diceAtrb = sortAtributesToClass(
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
            ? diceAtrb = sortAtributesToClass(
                atrb,
                atrbValues[2],
                atrbValues[0],
                atrbValues[1],
                atrbValues[4],
                atrbValues[3],
                atrbValues[5])
            : diceAtrb = sortAtributesToClass(
                atrb,
                atrbValues[0],
                atrbValues[2],
                atrbValues[1],
                atrbValues[4],
                atrbValues[3],
                atrbValues[5]);
        break;
      case "Arcanist":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[5], atrbValues[2],
            atrbValues[4], atrbValues[0], atrbValues[3], atrbValues[1]);
        break;
      case "Alchemist":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[5], atrbValues[2],
            atrbValues[3], atrbValues[0], atrbValues[1], atrbValues[4]);
        break;
      case "Wizard":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[5], atrbValues[3],
            atrbValues[2], atrbValues[0], atrbValues[1], atrbValues[4]);
        break;
      case "Cleric":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[2], atrbValues[3],
            atrbValues[1], atrbValues[4], atrbValues[0], atrbValues[5]);
        break;
      case "Druid":
        isRange
            ? diceAtrb = sortAtributesToClass(
                atrb,
                atrbValues[3],
                atrbValues[2],
                atrbValues[1],
                atrbValues[5],
                atrbValues[0],
                atrbValues[4])
            : diceAtrb = sortAtributesToClass(
                atrb,
                atrbValues[2],
                atrbValues[3],
                atrbValues[1],
                atrbValues[5],
                atrbValues[0],
                atrbValues[4]);
        break;
      case "Rogue":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[3], atrbValues[0],
            atrbValues[5], atrbValues[2], atrbValues[4], atrbValues[1]);
        break;
      case "Ranger":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[1], atrbValues[0],
            atrbValues[3], atrbValues[5], atrbValues[2], atrbValues[4]);
        break;
      case "Paladin":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[0], atrbValues[4],
            atrbValues[2], atrbValues[5], atrbValues[3], atrbValues[1]);
        break;
      case "Bard":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[5], atrbValues[3],
            atrbValues[4], atrbValues[2], atrbValues[1], atrbValues[0]);
        break;
      case "Sorcerer":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[5], atrbValues[4],
            atrbValues[2], atrbValues[3], atrbValues[1], atrbValues[0]);
        break;
      case "Monk":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[2], atrbValues[0],
            atrbValues[3], atrbValues[4], atrbValues[1], atrbValues[5]);
        break;
      case "Noble":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[4], atrbValues[4],
            atrbValues[4], atrbValues[2], atrbValues[2], atrbValues[1]);
        break;
      case "Aristocrat":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[4], atrbValues[4],
            atrbValues[4], atrbValues[0], atrbValues[1], atrbValues[3]);
        break;
      case "Bandit":
        isRange
            ? diceAtrb = sortAtributesToClass(
                atrb,
                atrbValues[0],
                atrbValues[1],
                atrbValues[2],
                atrbValues[5],
                atrbValues[3],
                atrbValues[4])
            : diceAtrb = sortAtributesToClass(
                atrb,
                atrbValues[1],
                atrbValues[0],
                atrbValues[2],
                atrbValues[5],
                atrbValues[3],
                atrbValues[4]);
        break;
      case "Samurai":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[0], atrbValues[1],
            atrbValues[2], atrbValues[5], atrbValues[3], atrbValues[4]);
        break;
      case "Summoner":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[1], atrbValues[2],
            atrbValues[3], atrbValues[5], atrbValues[4], atrbValues[0]);
        break;
      case "Antipaladin":
        diceAtrb = sortAtributesToClass(atrb, atrbValues[0], atrbValues[4],
            atrbValues[2], atrbValues[5], atrbValues[3], atrbValues[1]);
        break;
      default:
        diceAtrb = sortAtributesToClass(atrb, atrbValues[3], atrbValues[3],
            atrbValues[3], atrbValues[3], atrbValues[3], atrbValues[3]);
    }
    return diceAtrb;
  }

  AtributeModel sortAtributesToClass(
      AtributeModel atrb, int v0, int v1, int v2, int v3, int v4, int v5) {
    atrb.strength = v0;
    atrb.dexterity = v1;
    atrb.constitution = v2;
    atrb.intelligence = v3;
    atrb.wisdom = v4;
    atrb.charisma = v5;
    return atrb;
  }

  AtributeModel calculateAllModifiers(AtributeModel baseAtrb) {
    var atributes = baseAtrb;
    AtributeModel modAtrb = AtributeModel();
    modAtrb.strength = calculateModifier(atributes.strength);
    modAtrb.dexterity = calculateModifier(atributes.dexterity);
    modAtrb.constitution = calculateModifier(atributes.constitution);
    modAtrb.intelligence = calculateModifier(atributes.intelligence);
    modAtrb.wisdom = calculateModifier(atributes.wisdom);
    modAtrb.charisma = calculateModifier(atributes.charisma);
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

  AtributeModel addUpAtributeValues(int level, String className, String race,
      String mainAtrb, String physicalStyle) {
    AtributeModel atrbByDice = AtributeModel();
    AtributeModel atrbByRace = AtributeModel();
    AtributeModel atrbByLevel = AtributeModel();
    AtributeModel charAtrb = AtributeModel();
    atrbByDice =
        generateAllAtributes(level, className, physicalStyle, atrbByDice);
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
}
