import 'package:fantasy_name_generator/models/class_models/skill_model.dart';

class SkillData {
  List<SkillModel> skills = [
    SkillModel(
      name: "Acobatics",
      attributeUsed: "dexterity",
      hasPenalty: true,
      checkPenalty: 0,
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
      skillOfClasses: ["all"],
    ),
    SkillModel(
      name: "Diplomacy",
      attributeUsed: "charisma",
      hasPenalty: false,
      checkPenalty: 0,
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
      checkPenalty: 0,
      skillOfClasses: ["Rogue", "Bandit"],
    ),
    SkillModel(
      name: "Disguise",
      attributeUsed: "charisma",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: ["Bard", "Rogue"],
    ),
    SkillModel(
      name: "Escape Artist",
      attributeUsed: "dexterity",
      hasPenalty: true,
      checkPenalty: 0,
      skillOfClasses: ["Bard", "Rogue", "Bandit", "Alchemist", "Monk"],
    ),
    SkillModel(
      name: "Fly",
      attributeUsed: "dexterity",
      hasPenalty: true,
      checkPenalty: 0,
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
      skillOfClasses: ["Cleric", "Druid", "Paladin"],
    ),
    SkillModel(
      name: "Intimidate",
      attributeUsed: "charisma",
      hasPenalty: false,
      checkPenalty: 0,
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
        "",
        "",
        "",
        ""
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
      skillOfClasses: ["Bard", "Rogue", "Bandit"],
    ),
    SkillModel(
      name: "Spellcraft",
      attributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
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
