import 'package:fantasy_name_generator/models/class_models/skill_model.dart';

import '../../../../models/key_value.model.dart';

class SkillData {
  List<SkillModel> skills = [
    SkillModel(
      name: "Acobatics",
      attributeUsed: "dexterity",
      hasPenalty: true,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Daredevil boots", value: 5),
        KeyValueModel(key: "Boots of elvenkind", value: 5),
        KeyValueModel(key: "Boots of striding and springing", value: 5),
        KeyValueModel(key: "Ring of jumping", value: 5),
        KeyValueModel(key: "Claws of the ice bear", value: 2),
        KeyValueModel(key: "Besmara's bicorne", value: 2),
      ],
      boostRaceList: [
        KeyValueModel(key: "Halfling", value: 2),
      ],
      skillOfClasses: [
        "Barbarian",
        "Bard",
        "Monk",
        "Samurai",
        "Rogue",
        "Ranger",
        "Alchemist",
        "Bandit"
      ],
    ),
    SkillModel(
      name: "Appraise",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Miser's mask", value: 5),
        KeyValueModel(key: "Gloves of the keen evaluator", value: 4),
      ],
      boostRaceList: [
        KeyValueModel(key: "Dwarf", value: 2),
      ],
      skillOfClasses: [
        "Bard",
        "Cleric",
        "Rogue",
        "Sorcerer",
        "Wizard",
        "Arcanist",
        "Bandit",
        "Alchemist",
        "Noble",
        "Aristocrat"
      ],
    ),
    SkillModel(
      name: "Bluff",
      attributeUsed: "charisma",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Bracelet of bargaining", value: 5),
        KeyValueModel(key: "Circlet of persuasion", value: 3),
      ],
      boostRaceList: [
        KeyValueModel(key: "", value: 2),
      ],
      skillOfClasses: [
        "Bard",
        "Alchemist",
        "Summoner",
        "Antipaladin",
        "Rogue",
        "Aristocrat",
        "Sorcerer",
        "Noble",
        "Bandit"
      ],
    ),
    SkillModel(
      name: "Climb",
      attributeUsed: "strength",
      hasPenalty: true,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Gloves of swimming and climbing", value: 5),
        KeyValueModel(key: "Ring of climbing", value: 5),
        KeyValueModel(key: "Claws of the ice bear", value: 2),
        KeyValueModel(key: "Besmara's bicorne", value: 2),
      ],
      boostRaceList: [
        KeyValueModel(key: "Halfling", value: 2),
      ],
      skillOfClasses: [
        "Barbarian",
        "Bard",
        "Druid",
        "Warrior",
        "Monk",
        "Rogue",
        "Ranger",
        "Bandit",
        "Samurai"
      ],
    ),
    SkillModel(
      name: "Craft",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Engineer's workgloves", value: 2),
        KeyValueModel(key: "Demonic smith's gloves", value: 4),
      ],
      boostRaceList: [
        KeyValueModel(key: "Gnome", value: 2),
      ],
      skillOfClasses: ["all"],
    ),
    SkillModel(
      name: "Diplomacy",
      attributeUsed: "charisma",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Diplomatist's vest", value: 12),
        KeyValueModel(key: "Judge's wig", value: 4),
        KeyValueModel(key: "Bracelet of bargaining", value: 5),
        KeyValueModel(key: "Living garments", value: 5),
        KeyValueModel(key: "Circlet of persuasion", value: 3),
      ],
      skillOfClasses: [
        "Bard",
        "Cleric",
        "Paladin",
        "Antipaladin",
        "Rogue",
        "Aristocrat",
        "Noble",
        "Samurai"
      ],
    ),
    SkillModel(
      name: "Disable device",
      attributeUsed: "dexterity",
      hasPenalty: true,
      boostedByItems: [
        KeyValueModel(key: "Trapspringer's gloves", value: 5),
        KeyValueModel(key: "Vest of escape", value: 4),
      ],
      checkPenalty: 0,
      skillOfClasses: ["Rogue", "Bandit"],
    ),
    SkillModel(
      name: "Disguise",
      attributeUsed: "charisma",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Circlet of persuasion", value: 3),
      ],
      skillOfClasses: ["Bard", "Rogue"],
    ),
    SkillModel(
      name: "Escape Artist",
      attributeUsed: "dexterity",
      hasPenalty: true,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Corset of the Vishkanya", value: 5),
        KeyValueModel(key: "Rootsense boots", value: 4),
        KeyValueModel(key: "Vest of escape", value: 6),
      ],
      skillOfClasses: ["Bard", "Rogue", "Bandit", "Alchemist", "Monk"],
    ),
    SkillModel(
      name: "Fly",
      attributeUsed: "dexterity",
      hasPenalty: true,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Winged boots", value: 4),
        KeyValueModel(key: "Wings of flying", value: 5),
      ],
      skillOfClasses: [
        "Druid",
        "Sorcerer",
        "Wizard",
        "Arcanist",
        "Alchemist",
        "Summoner"
      ],
    ),
    SkillModel(
      name: "Handle animal",
      attributeUsed: "charisma",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Ring of sacred mistletoe", value: 2),
        KeyValueModel(key: "Circlet of persuasion", value: 3),
      ],
      skillOfClasses: [
        "Druid",
        "Barbarian",
        "Paladin",
        "Antipaladin",
        "Ranger",
        "Summoner"
      ],
    ),
    SkillModel(
      name: "Heal",
      attributeUsed: "wisdom",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Healer's gloves", value: 5),
      ],
      skillOfClasses: ["Cleric", "Druid", "Paladin"],
    ),
    SkillModel(
      name: "Intimidate",
      attributeUsed: "charisma",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Circlet of persuasion", value: 3),
        KeyValueModel(key: "Maw of the wyrm", value: 4),
        KeyValueModel(key: "Judge's wig", value: 4),
      ],
      boostRaceList: [
        KeyValueModel(key: "Half-orc", value: 2),
      ],
      skillOfClasses: [
        "Barbarian",
        "Bard",
        "Warrior",
        "Monk",
        "Ranger",
        "Rogue",
        "Bandit",
        "Alchemist",
        "Sorcerer",
        "Summoner",
        "Samurai"
      ],
    ),
    SkillModel(
      name: "Knowledge (arcane)",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: ["Cleric", "Sorcerer", "Wizard", "Arcanist", "Alchemist"],
    ),
    SkillModel(
      name: "Knowledge (dungeoneering)",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: [
        "Bard",
        "Wizard",
        "Warrior",
        "Ranger",
        "Rogue",
        "Alchemist",
        "Arcanist"
      ],
    ),
    SkillModel(
      name: "Knowledge (engineering)",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Engineer's workgloves", value: 5),
      ],
      skillOfClasses: [
        "Bard",
        "Warrior",
        "Wizard",
        "Arcanist",
        "Alchemist",
        "Aristocrat",
        "Noble"
      ],
    ),
    SkillModel(
      name: "Knowledge (geography)",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: [
        "Bard",
        "Wizard",
        "Druid",
        "Ranger",
        "Samurai",
        "Arcanist",
        "Alchemist",
        "Aristocrat",
        "Noble"
      ],
    ),
    SkillModel(
      name: "Knowledge (history)",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [KeyValueModel(key: "Scholar's ring", value: 5)],
      skillOfClasses: [
        "Bard",
        "Wizard",
        "Arcanist",
        "Aristocrat",
        "Noble",
        "Cleric",
        "Monk",
        "Alchemist"
      ],
    ),
    SkillModel(
      name: "Knowledge (local)",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: [
        "Bard",
        "Wizard",
        "Arcanist",
        "Aristocrat",
        "Noble",
        "Rogue",
        "Bandit"
      ],
    ),
    SkillModel(
      name: "Knowledge (nature)",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      boostRaceList: [
        KeyValueModel(key: "Elf", value: 2),
        KeyValueModel(key: "Gnome", value: 2),
      ],
      boostedByItems: [
        KeyValueModel(key: "Ring of sacred mistletoe", value: 2),
      ],
      skillOfClasses: [
        "Bard",
        "Wizard",
        "Arcanist",
        "Aristocrat",
        "Noble",
        "Druid",
        "Barbarian",
        "Ranger",
        "Alchemist",
        "",
        ""
      ],
    ),
    SkillModel(
      name: "Knowledge (nobility)",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: [
        "Bard",
        "Wizard",
        "Arcanist",
        "Aristocrat",
        "Noble",
        "Cleric",
        "Paladin",
        "Alchemist"
      ],
    ),
    SkillModel(
      name: "Knowledge (planes)",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: [
        "Bard",
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Cleric",
      ],
    ),
    SkillModel(
      name: "Knowledge (religion)",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: [
        "Bard",
        "Wizard",
        "Arcanist",
        "Monk",
        "Cleric",
        "Paladin",
        "Antipaladin",
        "Aristocrat",
        "Noble"
      ],
    ),
    SkillModel(
      name: "Linguistics",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(
            key: "Helm of comprehend languages and read magic", value: 5)
      ],
      skillOfClasses: [
        "Bard",
        "Wizard",
        "Arcanist",
        "Cleric",
        "Rogue",
        "Aristocrat",
        "Noble"
      ],
    ),
    SkillModel(
      name: "Perception",
      attributeUsed: "wisdom",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Eyes of the eagle", value: 5),
        KeyValueModel(key: "Lenses of detection", value: 5),
        KeyValueModel(key: "", value: ""),
      ],
      boostRaceList: [
        KeyValueModel(key: "Elf", value: 2),
        KeyValueModel(key: "Gnome", value: 2),
        KeyValueModel(key: "Halfling", value: 2),
        KeyValueModel(key: "Half-elf", value: 2),
      ],
      skillOfClasses: [
        "Barbarian",
        "Bard",
        "Druid",
        "Monk",
        "Ranger",
        "Rogue",
        "Bandit",
        "Samurai",
        "Alchemist"
      ],
    ),
    SkillModel(
      name: "Perform",
      attributeUsed: "charisma",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Bracers of the glib entertainer", value: 5),
      ],
      skillOfClasses: ["Bard", "Monk", "Rogue", "Aristocrat", "Noble"],
    ),
    SkillModel(
      name: "Profession",
      attributeUsed: "wis",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: ["all"],
    ),
    SkillModel(
      name: "Ride",
      attributeUsed: "dexterity",
      hasPenalty: true,
      checkPenalty: 0,
      skillOfClasses: [
        "Barbarian",
        "Druid",
        "Warrior",
        "Monk",
        "Paladin",
        "Ranger",
        "Samurai",
        "Summoner"
      ],
    ),
    SkillModel(
      name: "Sense Motive",
      attributeUsed: "wisdom",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Bracelet of bargaining", value: 5),
      ],
      skillOfClasses: [
        "Bard",
        "Cleric",
        "Monk",
        "Paladin",
        "Antipaladin",
        "Rogue",
        "Noble",
        "Aristocrat"
      ],
    ),
    SkillModel(
      name: "Sleight of Hand",
      attributeUsed: "dexterity",
      hasPenalty: true,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Gloves of larceny", value: 5),
        KeyValueModel(key: "Coat of pockets", value: 5),
        KeyValueModel(key: "Masterful gray gloves", value: 10),
      ],
      skillOfClasses: ["Bard", "Rogue", "Bandit"],
    ),
    SkillModel(
      name: "Spellcraft",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Goggles of elvenkind", value: 5),
      ],
      boostRaceList: [
        KeyValueModel(key: "Elf", value: 2),
      ],
      skillOfClasses: [
        "Bard",
        "Cleric",
        "Druid",
        "Paladin",
        "Antipaladin",
        "Summoner",
        "Sorcerer",
        "Wizard",
        "Arcanist",
        "Alchemist",
        ""
      ],
    ),
    SkillModel(
      name: "Stealth",
      attributeUsed: "dexterity",
      hasPenalty: true,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Ring of chameleon power", value: 10),
        KeyValueModel(key: "Shozoku of the night wind", value: 10),
      ],
      boostRaceList: [
        KeyValueModel(key: "Gnome", value: 4),
        KeyValueModel(key: "Halfling", value: 4),
      ],
      skillOfClasses: [
        "Bard",
        "Rogue",
        "Alchemist",
        "Ranger",
        "Monk",
        "Bandit"
      ],
    ),
    SkillModel(
      name: "Survival",
      attributeUsed: "wisdom",
      hasPenalty: false,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Lenses of detection", value: 5),
        KeyValueModel(key: "Fervent searcher's gloves", value: 5),
      ],
      skillOfClasses: [
        "Barbarian",
        "Druid",
        "Warrior",
        "Ranger",
        "Samurai",
        "Summoner"
      ],
    ),
    SkillModel(
      name: "Swim",
      attributeUsed: "strength",
      hasPenalty: true,
      checkPenalty: 0,
      boostedByItems: [
        KeyValueModel(key: "Slippers of the triton", value: 10),
        KeyValueModel(key: "Ring of swimming", value: 5),
        KeyValueModel(key: "Ring of the sea strider", value: 8),
        KeyValueModel(key: "Gloves of swimming and climbing", value: 5),
        KeyValueModel(key: "Traveler's wet suit", value: 2),
      ],
      skillOfClasses: [
        "Barbarian",
        "Warrior",
        "Monk",
        "Rogue",
        "Bandit",
        "Ranger",
        "Samurai"
      ],
    ),
    SkillModel(
      name: "Use Magic Device",
      attributeUsed: "charisma",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: ["Bard", "Rogue", "Sorcerer", "Alchemist"],
    ),
  ];
}
