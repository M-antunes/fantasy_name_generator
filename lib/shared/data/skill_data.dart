import 'package:fantasy_name_generator/models/skill_model.dart';

class SkillData {
  List<SkillModel> skills = [
    SkillModel(
      name: "Acobatics",
      atributeUsed: "dexterity",
      checkPenalty: true,
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
      atributeUsed: "intelligence",
      checkPenalty: false,
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
      atributeUsed: "charisma",
      checkPenalty: false,
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
      atributeUsed: "strength",
      checkPenalty: true,
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
      atributeUsed: "intelligence",
      checkPenalty: false,
      skillOfClasses: ["all"],
    ),
    SkillModel(
      name: "Diplomacy",
      atributeUsed: "",
      checkPenalty: false,
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
      atributeUsed: "dexterity",
      checkPenalty: true,
      skillOfClasses: ["Rogue", "Bandit"],
    ),
    SkillModel(
      name: "Disguise",
      atributeUsed: "charisma",
      checkPenalty: false,
      skillOfClasses: ["Bard", "Rogue"],
    ),
    SkillModel(
      name: "Escape Artist",
      atributeUsed: "dexterity",
      checkPenalty: true,
      skillOfClasses: ["Bard", "Rogue", "Bandit", "Alchemist", "Monk"],
    ),
    SkillModel(
      name: "Fly",
      atributeUsed: "dexterity",
      checkPenalty: true,
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
      atributeUsed: "charisma",
      checkPenalty: false,
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
      atributeUsed: "wisdom",
      checkPenalty: false,
      skillOfClasses: ["Cleric", "Druid", "Paladin"],
    ),
    SkillModel(
      name: "Intimidate",
      atributeUsed: "charisma",
      checkPenalty: false,
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
      atributeUsed: "intelligence",
      checkPenalty: false,
      skillOfClasses: ["Cleric", "Sorcerer", "Wizard", "Arcanist", "Alchemist"],
    ),
    SkillModel(
      name: "Knowledge (dungeoneering)",
      atributeUsed: "intelligence",
      checkPenalty: false,
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
      atributeUsed: "intelligence",
      checkPenalty: false,
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
      atributeUsed: "intelligence",
      checkPenalty: false,
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
      atributeUsed: "intelligence",
      checkPenalty: false,
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
      atributeUsed: "intelligence",
      checkPenalty: false,
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
      atributeUsed: "intelligence",
      checkPenalty: false,
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
      atributeUsed: "intelligence",
      checkPenalty: false,
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
      atributeUsed: "intelligence",
      checkPenalty: false,
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
      atributeUsed: "intelligence",
      checkPenalty: false,
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
      atributeUsed: "intelligence",
      checkPenalty: false,
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
      atributeUsed: "wisdom",
      checkPenalty: false,
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
      atributeUsed: "charisma",
      checkPenalty: false,
      skillOfClasses: ["Bard", "Monk", "Rogue", "Aristocrat", "Noble"],
    ),
    SkillModel(
      name: "Profession",
      atributeUsed: "wis",
      checkPenalty: false,
      skillOfClasses: ["all"],
    ),
    SkillModel(
      name: "Ride",
      atributeUsed: "dexterity",
      checkPenalty: true,
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
      atributeUsed: "wisdom",
      checkPenalty: false,
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
      atributeUsed: "dexterity",
      checkPenalty: true,
      skillOfClasses: ["Bard", "Rogue", "Bandit"],
    ),
    SkillModel(
      name: "Spellcraft",
      atributeUsed: "intelligence",
      checkPenalty: false,
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
      atributeUsed: "dexterity",
      checkPenalty: true,
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
      atributeUsed: "wisdom",
      checkPenalty: false,
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
      atributeUsed: "strength",
      checkPenalty: true,
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
      atributeUsed: "charisma",
      checkPenalty: false,
      skillOfClasses: ["Bard", "Rogue", "Sorcerer", "Alchemist"],
    ),
  ];
}
