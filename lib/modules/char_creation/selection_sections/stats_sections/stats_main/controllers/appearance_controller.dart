import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';

class AppearanceController {
  applyHeightAndWeight(
      List<RaceModel> raceList,
      List<ClassModel> classList,
      String raceName,
      String className,
      int level,
      RaceModel race,
      String mainAtrb) {
    var increment = 0;
    var raceGotten =
        raceList.firstWhere((element) => element.name == race.name);
    int baseInches = raceGotten.height!.value;
    int baseFeet = raceGotten.height!.key;
    var baseWeight = raceGotten.weight;
    if (raceGotten.name == "Dwarf" || raceGotten.size == "Small") {
      increment = rollingDice(4) + rollingDice(4);
      baseInches += increment;
      if (raceGotten.name == "Dwarf") {
        baseWeight += (increment * 7);
      } else {
        baseWeight += (increment * 1.5);
      }
    } else if (raceGotten.name == "Half-elf" || raceGotten.name == "Elf") {
      increment = rollingDice(8) + rollingDice(8);
      baseInches += increment;
      baseWeight += (increment * 7);
    } else if (raceGotten.name == "Half-orc" || raceGotten.name == "Human") {
      increment = rollingDice(10) + rollingDice(10);
      baseInches += increment;
      baseWeight += (increment * 7);
    } else {
      increment = rollingDice(12) + rollingDice(12);
      baseInches += increment;
      baseWeight += (increment * 9);
    }
    if (mainAtrb == "strength" && race.size != "Small") {
      baseInches += rollingDice(4);
      baseWeight += rollingDice(20) + rollingDice(20);
    }
    race = upDateSizeAndSenses(raceList, race.name);
    race.age = claculateAge(classList, raceList, raceName, className, level);
    race.height!.value = baseInches;
    race.height!.key = baseFeet;
    race.weight = baseWeight;
    race = transformInchToFoot(race);
    return race;
  }

  /// changes inches to foot
  RaceModel transformInchToFoot(RaceModel race) {
    if (race.height!.value > 10) {
      while (race.height!.value > 10) {
        race.height!.value -= 10;
        race.height!.key += 1;
      }
    }
    return race;
  }

  int ajustAgeAccordingtoRace(List<ClassModel> classList, String className,
      int level, int physClassDif, int mentClassDif) {
    double baseAge = 0;
    var ageIncrement = 0;
    int dif = 0;
    bool containsPhys =
        classList.any((element) => element.combatStyle == "Physical");
    if (containsPhys) {
      if (className == "Barbarian" || className == "Rogue") {
        double youngClassDif = physClassDif * 0.6;
        dif = youngClassDif.toInt();
        ageIncrement = generateRandom(dif);
        baseAge = baseAge + ageIncrement;
      } else {
        ageIncrement = generateRandom(physClassDif);
        baseAge = baseAge + ageIncrement;
      }
    }
    bool containsMent = classList.any((element) =>
        element.combatStyle == "Hybrid" || element.combatStyle == "Spellcater");
    if (containsMent) {
      ageIncrement = generateRandom(mentClassDif);
      baseAge = baseAge + ageIncrement;
    }
    if (level > 4) {
      for (var i = 4; i < level; i = i + 4) {
        baseAge = baseAge + 1;
      }
    }
    return baseAge.toInt();
  }

  ///calculate character's Age
  int claculateAge(List<ClassModel> classList, List<RaceModel> raceList,
      String raceName, String className, int level) {
    var raceGotten = raceList.firstWhere((element) => element.name == raceName);
    var baseAge = raceGotten.age;
    var tempRaceAge = 0;
    switch (raceName) {
      case "Dwarf":
        tempRaceAge =
            ajustAgeAccordingtoRace(classList, className, level, 30, 60);
        break;
      case "Elf":
        tempRaceAge =
            ajustAgeAccordingtoRace(classList, className, level, 30, 60);
        break;
      case "Gnome":
        tempRaceAge =
            ajustAgeAccordingtoRace(classList, className, level, 20, 40);
        break;
      case "Hafling":
        tempRaceAge =
            ajustAgeAccordingtoRace(classList, className, level, 10, 20);
        break;
      case "Half-elf":
        tempRaceAge =
            ajustAgeAccordingtoRace(classList, className, level, 10, 20);
        break;
      case "Half-orc":
        tempRaceAge =
            ajustAgeAccordingtoRace(classList, className, level, 7, 14);
        break;
      case "Human":
        tempRaceAge =
            ajustAgeAccordingtoRace(classList, className, level, 8, 14);
        break;
      case "Orc":
        tempRaceAge =
            ajustAgeAccordingtoRace(classList, className, level, 4, 12);
        break;
      default:
    }
    return baseAge + tempRaceAge;
  }

  RaceModel upDateSizeAndSenses(List<RaceModel> races, String charRace) {
    RaceModel race = races.firstWhere((element) => element.name == charRace);
    RaceModel raceAjust = RaceModel(
        name: race.name,
        isSelected: false,
        initialIdiom: race.initialIdiom,
        size: race.size,
        senses: race.senses,
        height: KeyValueModel(key: 0, value: 0));
    return raceAjust;
  }
}
