import 'package:fantasy_name_generator/models/skill_model.dart';

class SkillData {
  List<SkillModel> skills = [
    SkillModel(
      name: "Acobatics",
      atributeUsed: "dexterity",
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
      atributeUsed: "intelligence",
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
      atributeUsed: "charisma",
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
      atributeUsed: "strength",
      hasPenalty: false,
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
      atributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: ["all"],
    ),
    SkillModel(
      name: "Diplomacy",
      atributeUsed: "charisma",
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
      atributeUsed: "dexterity",
      hasPenalty: true,
      checkPenalty: 0,
      skillOfClasses: ["Rogue", "Bandit"],
    ),
    SkillModel(
      name: "Disguise",
      atributeUsed: "charisma",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: ["Bard", "Rogue"],
    ),
    SkillModel(
      name: "Escape Artist",
      atributeUsed: "dexterity",
      hasPenalty: true,
      checkPenalty: 0,
      skillOfClasses: ["Bard", "Rogue", "Bandit", "Alchemist", "Monk"],
    ),
    SkillModel(
      name: "Fly",
      atributeUsed: "dexterity",
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
      atributeUsed: "charisma",
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
      atributeUsed: "wisdom",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: ["Cleric", "Druid", "Paladin"],
    ),
    SkillModel(
      name: "Intimidate",
      atributeUsed: "charisma",
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
      atributeUsed: "intelligence",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: ["Cleric", "Sorcerer", "Wizard", "Arcanist", "Alchemist"],
    ),
    SkillModel(
      name: "Knowledge (dungeoneering)",
      atributeUsed: "intelligence",
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
      atributeUsed: "intelligence",
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
      atributeUsed: "intelligence",
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
      atributeUsed: "intelligence",
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
      atributeUsed: "intelligence",
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
      atributeUsed: "intelligence",
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
      atributeUsed: "intelligence",
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
      atributeUsed: "intelligence",
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
      atributeUsed: "intelligence",
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
      atributeUsed: "intelligence",
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
      atributeUsed: "wisdom",
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
      atributeUsed: "charisma",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: ["Bard", "Monk", "Rogue", "Aristocrat", "Noble"],
    ),
    SkillModel(
      name: "Profession",
      atributeUsed: "wis",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: ["all"],
    ),
    SkillModel(
      name: "Ride",
      atributeUsed: "dexterity",
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
      atributeUsed: "wisdom",
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
      atributeUsed: "dexterity",
      hasPenalty: true,
      checkPenalty: 0,
      skillOfClasses: ["Bard", "Rogue", "Bandit"],
    ),
    SkillModel(
      name: "Spellcraft",
      atributeUsed: "intelligence",
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
      atributeUsed: "dexterity",
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
      atributeUsed: "wisdom",
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
      atributeUsed: "strength",
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
      atributeUsed: "charisma",
      hasPenalty: false,
      checkPenalty: 0,
      skillOfClasses: ["Bard", "Rogue", "Sorcerer", "Alchemist"],
    ),
  ];
}
