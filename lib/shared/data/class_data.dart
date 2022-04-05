import 'package:fantasy_name_generator/models/class_model.dart';
import 'package:fantasy_name_generator/models/combat_style_choice_model.dart';
import 'package:fantasy_name_generator/models/level_model.dart';
import 'package:fantasy_name_generator/models/physical_style_model.dart';

class ClassData {
  final List<CombatStyleChoiceModel> combatStyles = [
    CombatStyleChoiceModel(
      name: "Physical",
      svg: "assets/images/physical.svg",
      descriptionTitle: "Physical Combat",
      description:
          "Physical combat style is focused on dealing damage, impairing or harming enemies through physical weapons, melee and range, or even bear fists, which makes a physical fighter also capable of enduring physical punishment. Style for the classes: Bandit, Barbarian, Commoner, Monk, Paladin, Antipaladin, Ranger, Rogue, Samurai, Warrior.",
      isSelected: true,
    ),
    CombatStyleChoiceModel(
      name: "Spellcaster",
      svg: "assets/images/spell.svg",
      descriptionTitle: "Spellcasting Combat",
      description:
          "Spellcasting combat style is focused on dealing damage, impairing or harming enemies through forms of arcane magic. Which makes a spellcaster very powerful in controlling battle space as well as dealing damage to masses of enemies. On the other hand, a spellcaster is very vulnerable to physical confrontation. Classes: Sorcerer and Wizard.",
      isSelected: false,
    ),
    CombatStyleChoiceModel(
      name: "Hybrid",
      svg: "assets/images/hybrid.svg",
      descriptionTitle: "Hybrid Combat",
      description:
          "Hybrid combat style is focused on dealing damage, impairing or harming enemies through both physical weapons and spellcasting, either divine or natural. Classes: Alchemist, Bard, Cleric, Druid and Summoner.",
      isSelected: false,
    ),
    CombatStyleChoiceModel(
      name: "Diplomat",
      svg: "assets/images/diplomat.svg",
      descriptionTitle: "Diplomat",
      description:
          "Diplomat are classes reserved to those who won't fight directly. Diplomats are skilled in knowledge and are financially resourceful. It is common to encounter them accompanied by body guards. Classes: Aristocrat and Noble.",
      isSelected: false,
    ),
  ];

  final List<PhysicalStyleModel> physicalStyles = [
    PhysicalStyleModel(
        name: "Berserker",
        svg: "assets/images/weapon_types/great-sword.svg",
        forbiddenClasses: [
          "Rogue",
          "Wizard",
          "Arcanist",
          "Sorcerer",
          "Aristocrat",
          "Noble",
          "Commoner"
        ],
        isSelected: false),
    PhysicalStyleModel(
        name: "Soldier",
        svg: "assets/images/weapon_types/soldier.svg",
        forbiddenClasses: [
          "Rogue",
          "Monk"
              "Wizard",
          "Arcanist",
          "Sorcerer",
          "Aristocrat",
          "Noble",
          "Commoner"
        ],
        isSelected: false),
    PhysicalStyleModel(
        name: "Dual-weilder",
        svg: "assets/images/weapon_types/axe-sword.svg",
        forbiddenClasses: [
          "Wizard",
          "Arcanist",
          "Sorcerer",
          "Aristocrat",
          "Noble",
          "Commoner"
        ],
        isSelected: false),
    PhysicalStyleModel(
        name: "Swordsman",
        svg: "assets/images/weapon_types/sword.svg",
        forbiddenClasses: [],
        isSelected: false),
    PhysicalStyleModel(
        name: "Knifeman",
        svg: "assets/images/weapon_types/knife.svg",
        forbiddenClasses: [],
        isSelected: false),
    PhysicalStyleModel(
        name: "Martial",
        svg: "assets/images/weapon_types/punch.svg",
        forbiddenClasses: [],
        isSelected: false),
    PhysicalStyleModel(
        name: "Bowman",
        svg: "assets/images/weapon_types/bow.svg",
        forbiddenClasses: [
          "Monk",
          "Wizard",
          "Arcanist",
          "Sorcerer",
          "Aristocrat",
          "Noble",
          "Commoner"
        ],
        isSelected: false),
    PhysicalStyleModel(
        name: "Marksman",
        svg: "assets/images/weapon_types/crossbow.svg",
        forbiddenClasses: [],
        isSelected: false),
    PhysicalStyleModel(
        name: "Thrower",
        svg: "assets/images/weapon_types/throwing.svg",
        forbiddenClasses: [
          "Wizard",
          "Arcanist",
          "Sorcerer",
          "Aristocrat",
          "Noble",
          "Commoner"
        ],
        isSelected: false),
  ];

  final List<ClassModel> allClasses = [
    ClassModel(
        isSelected: true,
        hitDice: 8,
        combatStyle: "Hybrid",
        mainAtrb: "Int",
        classIcon: "assets/images/classes/alchemist.svg",
        resistUpgrade: "fort, ref",
        forbidenArmorType: ["Heavy"],
        permittedAligments: [
          "Lawful Good",
          "Lawful Neutral",
          "Lawful Evil",
          "Neutral Good",
          "Neutral",
          "Neutral Evil",
          "Chaotic Good",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        description:
            "Whether secreted away in a smoky basement laboratory or gleefully experimenting in a well-respected school of magic, the alchemist is often regarded as being just as unstable, unpredictable, and dangerous as the concoctions he brews. While some creators of alchemical items content themselves with sedentary lives as merchants, providing tindertwigs and smokesticks, the true alchemist answers a deeper calling. Rather than cast magic like a spellcaster, the alchemist captures his own magic potential within liquids and extracts he creates, infusing his chemicals with virulent power to grant him impressive skill with poisons, explosives, and all manner of self-transformative magic.",
        name: "Alchemist"),
    ClassModel(
        isSelected: false,
        hitDice: 10,
        combatStyle: "Physical",
        mainAtrb: "Str",
        classIcon: "assets/images/classes/antipaladin.svg",
        resistUpgrade: "fort, will",
        forbidenArmorType: [],
        permittedAligments: ["Chaotic Evil"],
        description:
            "Although it is a rare occurrence, paladins do sometimes stray from the path of righteousness. Most of these wayward holy warriors seek out redemption and forgiveness for their misdeeds, regaining their powers through piety, charity, and powerful magic. Yet there are others, the dark and disturbed few, who turn actively to evil, courting the dark powers they once railed against in order to take vengeance on their former brothers. It's said that those who climb the farthest have the farthest to fall, and antipaladins are living proof of this fact, their pride and hatred blinding them to the glory of their forsaken patrons. Antipaladins become the antithesis of their former selves. They make pacts with fiends, take the lives of the innocent, and put nothing ahead of their personal power and wealth. Champions of evil, they often lead armies of evil creatures and work with other villains to bring ruin to the holy and tyranny to the weak. Not surprisingly, paladins stop at nothing to put an end to such nefarious antiheroes.",
        name: "Antipaladin"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/arcanist.svg",
        resistUpgrade: "will",
        forbidenArmorType: ["Light", "Medium", "Heavy"],
        permittedAligments: [
          "Lawful Good",
          "Lawful Neutral",
          "Lawful Evil",
          "Neutral Good",
          "Neutral",
          "Neutral Evil",
          "Chaotic Good",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        hitDice: 6,
        combatStyle: "Spellcaster",
        mainAtrb: "Int",
        description:
            "Some spellcasters seek the secrets of magic, pursuing the power to make the impossible possible. Others are born with magic in their blood, commanding unbelievable forces as effortlessly as they breathe. Yet still others seek to meld the science of arcane scholars with the natural might of innate casters. These arcanists seek to discover the mysterious laws of magic and through will and expertise bend those forces to their whims. Arcanists are the shapers and tinkers of the arcane world, and no magic can resist their control.  Arcanists are scholars of all things magical. They constantly seek out new forms of magic to discover how they work, and in many cases, to collect the energy of such magic for their own uses. Many arcanists are seen as reckless, more concerned with the potency of magic than the ramifications of unleashing such power.",
        name: "Arcanist"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/aristocrat.svg",
        resistUpgrade: "will",
        forbidenArmorType: ["Light", "Medium", "Heavy"],
        permittedAligments: [
          "Lawful Good",
          "Lawful Neutral",
          "Lawful Evil",
          "Neutral Good",
          "Neutral",
          "Neutral Evil",
          "Chaotic Good",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        hitDice: 4,
        combatStyle: "Diplomat",
        mainAtrb: "Int",
        description:
            "A member of the ruling class, but no so high in hierarchy. Aristocrats are NPCs that can be used to help players with insights, strategies and whatever is needed from them. They are skilled in knowledge and wisdom. They are not fit for confrontation. They are usually found in large cities and moderately wealthy surroundings. They might have one or two body guards who will fight for them if necessary.",
        name: "Aristocrat"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/bandit.svg",
        resistUpgrade: "fort, ref",
        forbidenArmorType: [],
        permittedAligments: [
          "Neutral",
          "Neutral Evil",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        hitDice: 8,
        combatStyle: "Physical",
        mainAtrb: "Str",
        description:
            "This is an NPC class that serves as antagonist to either heroes or anti heroes. Bandits are found everywhere, can belong to any race and their only interest is to rip off the belongings of incautious people where they are found. They usually come in packs or crews to foray, murder and take whatever they desire. They will attack cowardly, deceive for personal gain and hardly ever fight to the death. However the most dangerous bandits will form organizations that rise above common crimes and become Crime Lords, real menace to entire villages, counties or cities.",
        name: "Bandit"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/barbarian.svg",
        resistUpgrade: "fort",
        forbidenArmorType: [],
        permittedAligments: [
          "Neutral Good",
          "Neutral",
          "Neutral Evil",
          "Chaotic Good",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        hitDice: 12,
        combatStyle: "Physical",
        mainAtrb: "Str",
        description:
            "For some, there is only rage. In the ways of their people, in the fury of their passion, in the howl of battle, conflict is all these brutal souls know. Savages, hired muscle, masters of vicious martial techniques, they are not soldiers or professional warriors. They are the battle possessed, creatures of slaughter and spirits of war. Known as barbarians, these warmongers know little of training, preparation, or the rules of warfare; for them, only the moment exists, with the foes that stand before them and the knowledge that the next moment might hold their death. They possess a sixth sense in regard to danger and the endurance to weather all that might entail. These brutal warriors might rise from all walks of life, both civilized and savage, though whole societies embracing such philosophies roam the wild places of the world. Within barbarians storms the primal spirit of battle, and woe to those who face their rage.",
        name: "Barbarian"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/bard.svg",
        resistUpgrade: "ref, will",
        forbidenArmorType: ["Light", "Medium"],
        permittedAligments: [
          "Lawful Good",
          "Lawful Neutral",
          "Lawful Evil",
          "Neutral Good",
          "Neutral",
          "Neutral Evil",
          "Chaotic Good",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        hitDice: 8,
        combatStyle: "Hybrid",
        mainAtrb: "Wis",
        description:
            "Untold wonders and secrets exist for those skillful enough to discover them. Through cleverness, talent, and magic, these cunning few unravel the wiles of the world, becoming adept in the arts of persuasion, manipulation, and inspiration. Typically masters of one or many forms of artistry, bards possess an uncanny ability to know more than they should and use what they learn to keep themselves and their allies ever one step ahead of danger. Bards are quick-witted and captivating, and their skills might lead them down many paths, be they gamblers or jacks-of-all-trades, scholars or performers, leaders or scoundrels, or even all of the above. For bards, every day brings its own opportunities, adventures, and challenges, and only by bucking the odds, knowing the most, and being the best might they claim the treasures of each.",
        name: "Bard"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/cleric.svg",
        resistUpgrade: "fort, will",
        forbidenArmorType: [],
        permittedAligments: [
          "Lawful Good",
          "Lawful Evil",
          "Chaotic Good",
          "Chaotic Evil"
        ],
        hitDice: 8,
        combatStyle: "Hybrid",
        mainAtrb: "Wis",
        description:
            "In faith and the miracles of the divine, many find a greater purpose. Called to serve powers beyond most mortal understanding, all priests preach wonders and provide for the spiritual needs of their people. Clerics are more than mere priests, though; these emissaries of the divine work the will of their deities through strength of arms and the magic of their gods. Devoted to the tenets of the religions and philosophies that inspire them, these ecclesiastics quest to spread the knowledge and influence of their faith. Yet while they might share similar abilities, clerics prove as different from one another as the divinities they serve, with some offering healing and redemption, others judging law and truth, and still others spreading conflict and corruption. The ways of the cleric are varied, yet all who tread these paths walk with the mightiest of allies and bear the arms of the gods themselves.",
        name: "Cleric"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/commoner.svg",
        resistUpgrade: "ref",
        forbidenArmorType: ["Light", "Medium", "Heavy"],
        permittedAligments: [
          "Lawful Good",
          "Lawful Neutral",
          "Lawful Evil",
          "Neutral Good",
          "Neutral",
          "Neutral Evil",
          "Chaotic Good",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        hitDice: 4,
        combatStyle: "Physical",
        mainAtrb: "Dex",
        description:
            "Commoners are the mundane folks. The men and women that have nothing special for themselves. They are villagers, workers, fishermen, etc. They represent the majority of people that will be encountered in all places. They might stand their ground if protected by soldiers or if the rule of law applies where they are. In any other case, they will absolutely run from confrontation and surrender if there is no other way out.",
        name: "Commoner"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/druid.svg",
        resistUpgrade: "fort, will",
        forbidenArmorType: [],
        permittedAligments: ["Neutral Good", "Neutral", "Neutral Evil"],
        hitDice: 8,
        combatStyle: "Hybrid",
        mainAtrb: "Wis",
        description:
            "Within the purity of the elements and the order of the wilds lingers a power beyond the marvels of civilization. Furtive yet undeniable, these primal magics are guarded over by servants of philosophical balance known as druids. Allies to beasts and manipulators of nature, these often misunderstood protectors of the wild strive to shield their lands from all who would threaten them and prove the might of the wilds to those who lock themselves behind city walls. Rewarded for their devotion with incredible powers, druids gain unparalleled shape-shifting abilities, the companionship of mighty beasts, and the power to call upon nature's wrath. The mightiest temper powers akin to storms, earthquakes, and volcanoes with primeval wisdom long abandoned and forgotten by civilization.",
        name: "Druid"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/monk.svg",
        resistUpgrade: "all",
        forbidenArmorType: ["Light", "Medium", "Heavy"],
        permittedAligments: ["Lawful Good", "Lawful Neutral", "Lawful Evil"],
        hitDice: 8,
        combatStyle: "Physical",
        mainAtrb: "Dex",
        description:
            "For the truly exemplary, martial skill transcends the battlefield—it is a lifestyle, a doctrine, a state of mind. These warrior-artists search out methods of battle beyond swords and shields, finding weapons within themselves just as capable of crippling or killing as any blade. These monks (so called since they adhere to ancient philosophies and strict martial disciplines) elevate their bodies to become weapons of war, from battle-minded ascetics to self-taught brawlers. Monks tread the path of discipline, and those with the will to endure that path discover within themselves not what they are, but what they are meant to be.",
        name: "Monk"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/noble.svg",
        resistUpgrade: "will",
        forbidenArmorType: ["Light", "Medium", "Heavy"],
        permittedAligments: [
          "Lawful Good",
          "Lawful Neutral",
          "Lawful Evil",
          "Neutral Good",
          "Neutral",
          "Neutral Evil",
          "Chaotic Good",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        hitDice: 4,
        combatStyle: "Diplomat",
        mainAtrb: "Cha",
        description:
            "A member of the ruling class. Very high in hierarchy. nobles are NPCs that can be used to help players with insights, strategies and whatever is needed from them. They are very skilled in knowledge, diplomacy and wisdom. They are not fit for confrontation. They are usually found in large cities and highly wealthy surroundings. They will never be found without a handful of powerful body guards who will fight for them if necessary.",
        name: "Noble"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/paladin.svg",
        resistUpgrade: "fort, will",
        forbidenArmorType: [],
        permittedAligments: ["Lawful Good"],
        hitDice: 10,
        combatStyle: "Physical",
        mainAtrb: "Str",
        description:
            "Through a select, worthy few shines the power of the divine. Called paladins, these noble souls dedicate their swords and lives to the battle against evil. Knights, crusaders, and law-bringers, paladins seek not just to spread divine justice but to embody the teachings of the virtuous deities they serve. In pursuit of their lofty goals, they adhere to ironclad laws of morality and discipline. As reward for their righteousness, these holy champions are blessed with boons to aid them in their quests: powers to banish evil, heal the innocent, and inspire the faithful. Although their convictions might lead them into conflict with the very souls they would save, paladins weather endless challenges of faith and dark temptations, risking their lives to do right and fighting to bring about a brighter future.",
        name: "Paladin"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/ranger.svg",
        resistUpgrade: "fort, ref",
        forbidenArmorType: [],
        permittedAligments: [
          "Lawful Good",
          "Lawful Neutral",
          "Lawful Evil",
          "Neutral Good",
          "Neutral",
          "Neutral Evil",
          "Chaotic Good",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        hitDice: 10,
        combatStyle: "Physical",
        mainAtrb: "Dex",
        description:
            "For those who relish the thrill of the hunt, there are only predators and prey. Be they scouts, trackers, or bounty hunters, rangers share much in common: unique mastery of specialized weapons, skill at stalking even the most elusive game, and the expertise to defeat a wide range of quarries. Knowledgeable, patient, and skilled hunters, these rangers hound man, beast, and monster alike, gaining insight into the way of the predator, skill in varied environments, and ever more lethal martial prowess. While some track man-eating creatures to protect the frontier, others pursue more cunning game—even fugitives among their own people.",
        name: "Ranger"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/rogue.svg",
        resistUpgrade: "ref",
        forbidenArmorType: ["Light"],
        permittedAligments: [
          "Neutral Good",
          "Neutral",
          "Neutral Evil",
          "Chaotic Good",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        hitDice: 8,
        combatStyle: "Physical",
        mainAtrb: "Dex",
        description:
            "Life is an endless adventure for those who live by their wits. Ever just one step ahead of danger, rogues bank on their cunning, skill, and charm to bend fate to their favor. Never knowing what to expect, they prepare for everything, becoming masters of a wide variety of skills, training themselves to be adept manipulators, agile acrobats, shadowy stalkers, or masters of any of dozens of other professions or talents. Thieves and gamblers, fast talkers and diplomats, bandits and bounty hunters, and explorers and investigators all might be considered rogues, as well as countless other professions that rely upon wits, prowess, or luck. Although many rogues favor cities and the innumerable opportunities of civilization, some embrace lives on the road, journeying far, meeting exotic people, and facing fantastic danger in pursuit of equally fantastic riches. In the end, any who desire to shape their fates and live life on their own terms might come to be called rogues.",
        name: "Rogue"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/samurai.svg",
        resistUpgrade: "fort",
        forbidenArmorType: [],
        permittedAligments: [
          "Lawful Good",
          "Lawful Neutral",
          "Lawful Evil",
          "Neutral Good",
          "Neutral",
          "Neutral Evil",
          "Chaotic Good",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        hitDice: 10,
        combatStyle: "Physical",
        mainAtrb: "Str",
        description:
            "Few warriors are more dedicated to honor and the code of the warrior than the samurai. Trained from an early age in the art of war and sworn to the service of a lord, the samurai holds a position of power and respect in many lands, often serving as the voice and justice of the local noble. The samurai takes on his training with zeal, learning the way of the blade (typically a katana), the bow, and the horse. Some even learn how to effectively use firearms, if they are available. The samurai is often the most trusted soldier in his lord's employ. In him, the common folk see honor and sacrifice. He is an honorable warrior, dedicated to the realm and the leaders that guide it.",
        name: "Samurai"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/sorcerer.svg",
        resistUpgrade: "will",
        forbidenArmorType: ["Light", "Medium", "Heavy"],
        permittedAligments: [
          "Lawful Good",
          "Lawful Neutral",
          "Lawful Evil",
          "Neutral Good",
          "Neutral",
          "Neutral Evil",
          "Chaotic Good",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        hitDice: 6,
        combatStyle: "Spellcaster",
        mainAtrb: "Cha",
        description:
            "Scions of innately magical bloodlines, the chosen of deities, the spawn of monsters, pawns of fate and destiny, or simply flukes of fickle magic, sorcerers look within themselves for arcane prowess and draw forth might few mortals can imagine. Emboldened by lives ever threatening to be consumed by their innate powers, these magic-touched souls endlessly indulge in and refine their mysterious abilities, gradually learning how to harness their birthright and coax forth ever greater arcane feats. Just as varied as these innately powerful spellcasters' abilities and inspirations are the ways in which they choose to utilize their gifts. While some seek to control their abilities through meditation and discipline, becoming masters of their fantastic birthright, others give in to their magic, letting it rule their lives with often explosive results. Regardless, sorcerers live and breathe that which other spellcasters devote their lives to mastering, and for them magic is more than a boon or a field of study; it is life itself.",
        name: "Sorcerer"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/summoner.svg",
        resistUpgrade: "will",
        forbidenArmorType: ["Light", "Medium"],
        permittedAligments: [
          "Lawful Good",
          "Lawful Neutral",
          "Lawful Evil",
          "Neutral Good",
          "Neutral",
          "Neutral Evil",
          "Chaotic Good",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        hitDice: 8,
        combatStyle: "Hybrid",
        mainAtrb: "Cha",
        description:
            "While many who dabble in the arcane become adept at beckoning monsters from the farthest reaches of the planes, none are more skilled at it than the summoner. This practitioner of the arcane arts forms a close bond with one particular outsider, known as an eidolon, who gains power as the summoner becomes more proficient at his summoning. Over time, the two become linked, eventually even sharing a shard of the same soul. But this power comes with a price: the summoner’s spells and abilities are limited due to his time spent enhancing the power and exploring the nature of his eidolon.",
        name: "Summoner"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/warrior.svg",
        resistUpgrade: "fort",
        forbidenArmorType: [],
        permittedAligments: [
          "Lawful Good",
          "Lawful Neutral",
          "Lawful Evil",
          "Neutral Good",
          "Neutral",
          "Neutral Evil",
          "Chaotic Good",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        hitDice: 10,
        combatStyle: "Physical",
        mainAtrb: "Str",
        description:
            "Some take up arms for glory, wealth, or revenge. Others do battle to prove themselves, to protect others, or because they know nothing else. Still others learn the ways of weaponcraft to hone their bodies in battle and prove their mettle in the forge of war. Lords of the battlefield, warriors are a disparate lot, training with many weapons or just one, perfecting the uses of armor, learning the fighting techniques of exotic masters, and studying the art of combat, all to shape themselves into living weapons. Far more than mere thugs, these skilled warriors reveal the true deadliness of their weapons, turning hunks of metal into arms capable of taming kingdoms, slaughtering monsters, and rousing the hearts of armies. Soldiers, knights, hunters, and artists of war, warriors are unparalleled champions, and woe to those who dare stand against them.",
        name: "Warrior"),
    ClassModel(
        isSelected: false,
        classIcon: "assets/images/classes/wizard.svg",
        resistUpgrade: "will",
        forbidenArmorType: ["Light", "Medium", "Heavy"],
        permittedAligments: [
          "Lawful Good",
          "Lawful Neutral",
          "Lawful Evil",
          "Neutral Good",
          "Neutral",
          "Neutral Evil",
          "Chaotic Good",
          "Chaotic Neutral",
          "Chaotic Evil"
        ],
        hitDice: 6,
        combatStyle: "Spellcaster",
        mainAtrb: "Int",
        description:
            "Beyond the veil of the mundane hide the secrets of absolute power. The works of beings beyond mortals, the legends of realms where gods and spirits tread, the lore of creations both wondrous and terrible—such mysteries call to those with the ambition and the intellect to rise above the common folk to grasp true might. Such is the path of the wizard. These shrewd magic-users seek, collect, and covet esoteric knowledge, drawing on cultic arts to work wonders beyond the abilities of mere mortals. While some might choose a particular field of magical study and become masters of such powers, others embrace versatility, reveling in the unbounded wonders of all magic. In either case, wizards prove a cunning and potent lot, capable of smiting their foes, empowering their allies, and shaping the world to their every desire.",
        name: "Wizard"),
  ];

  List<LevelModel> goodOrBad = [
    LevelModel(level: 1, good: 2, bad: 0),
    LevelModel(level: 2, good: 3, bad: 0),
    LevelModel(level: 3, good: 3, bad: 1),
    LevelModel(level: 4, good: 4, bad: 1),
    LevelModel(level: 5, good: 4, bad: 1),
    LevelModel(level: 6, good: 5, bad: 2),
    LevelModel(level: 7, good: 5, bad: 2),
    LevelModel(level: 8, good: 6, bad: 2),
    LevelModel(level: 9, good: 6, bad: 3),
    LevelModel(level: 10, good: 7, bad: 3),
    LevelModel(level: 11, good: 7, bad: 3),
    LevelModel(level: 12, good: 8, bad: 4),
    LevelModel(level: 13, good: 8, bad: 4),
    LevelModel(level: 14, good: 9, bad: 4),
    LevelModel(level: 15, good: 9, bad: 5),
    LevelModel(level: 16, good: 10, bad: 5),
    LevelModel(level: 17, good: 10, bad: 5),
    LevelModel(level: 18, good: 11, bad: 6),
    LevelModel(level: 19, good: 11, bad: 6),
    LevelModel(level: 20, good: 12, bad: 6),
    LevelModel(level: 21, good: 13, bad: 7),
    LevelModel(level: 22, good: 13, bad: 8),
    LevelModel(level: 23, good: 14, bad: 8),
    LevelModel(level: 24, good: 15, bad: 8),
    LevelModel(level: 25, good: 15, bad: 9),
    LevelModel(level: 26, good: 16, bad: 10),
    LevelModel(level: 27, good: 17, bad: 10),
    LevelModel(level: 28, good: 17, bad: 11),
    LevelModel(level: 29, good: 18, bad: 11),
    LevelModel(level: 30, good: 19, bad: 12),
  ];
}
