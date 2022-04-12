import 'package:fantasy_name_generator/models/base_atribute_model.dart';

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
}
