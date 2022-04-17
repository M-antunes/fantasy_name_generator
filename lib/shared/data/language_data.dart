import 'package:fantasy_name_generator/models/char_personal_models/language_model.dart';

class LanguageData {
  List<LanguageModel> allLanguagues = [
    LanguageModel(
        name: "Abyssal",
        probability: 2,
        spokenBy: "demons and other chaotic evil outsiders"),
    LanguageModel(
        name: "Aklo",
        probability: 1,
        spokenBy: "derros, inhuman or otherworldly monsters, evil fey"),
    LanguageModel(
        name: "Aquan",
        probability: 2,
        spokenBy: "aquatic creatures, water-based creatures"),
    LanguageModel(
        name: "Auran",
        probability: 2,
        spokenBy: "flying creatures, air-based creatures"),
    LanguageModel(
        name: "Celestial",
        probability: 3,
        spokenBy: "angels and other good outsiders"),
    LanguageModel(
        name: "Common",
        probability: 5,
        spokenBy: "humans and the core races from Races"),
    LanguageModel(
        name: "Draconic",
        probability: 4,
        spokenBy: "dragons, reptilian humanoids"),
    LanguageModel(
      name: "Druidic",
      probability: 10,
      spokenBy: "druids only",
    ),
    LanguageModel(
      name: "Dwarven",
      probability: 5,
      spokenBy: "dwarves",
    ),
    LanguageModel(
      name: "Elven",
      probability: 5,
      spokenBy: "elves, half-elves",
    ),
    LanguageModel(
        name: "Giant",
        probability: 4,
        spokenBy: "cyclopses, ettins, giants, ogres, trolls"),
    LanguageModel(
      name: "Gnome",
      probability: 5,
      spokenBy: "gnomes",
    ),
    LanguageModel(
        name: "Goblin",
        probability: 5,
        spokenBy: "bugbears, goblins, hobgoblins"),
    LanguageModel(
      name: "Gnoll",
      probability: 4,
      spokenBy: "gnolls",
    ),
    LanguageModel(
      name: "Halfling",
      probability: 5,
      spokenBy: "halflings",
    ),
    LanguageModel(
      name: "Ignan",
      probability: 3,
      spokenBy: "fire-based creatures",
    ),
    LanguageModel(
      name: "Infernal",
      probability: 2,
      spokenBy: "devils and other lawful evil outsiders",
    ),
    LanguageModel(
      name: "Orc",
      probability: 5,
      spokenBy: "orcs, half-orcs",
    ),
    LanguageModel(
      name: "Sylvan",
      probability: 3,
      spokenBy: "centaurs, fey creatures, plant creatures, unicorns",
    ),
    LanguageModel(
      name: "Terran",
      probability: 2,
      spokenBy: "earth-based creatures",
    ),
    LanguageModel(
      name: "Undercommon",
      probability: 2,
      spokenBy: "drow, duergar, morlocks, svirfneblin",
    ),
  ];
}
