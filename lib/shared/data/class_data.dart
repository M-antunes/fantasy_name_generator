import 'package:fantasy_name_generator/models/class_model.dart';
import 'package:fantasy_name_generator/models/level_model.dart';

class ClassData {
  final List<ClassModel> allClasses = [
    ClassModel(
        isSelected: true,
        hitDice: 8,
        mainAtrb: "Int",
        resistUpgrade: "fort, ref",
        description:
            "Whether secreted away in a smoky basement laboratory or gleefully experimenting in a well-respected school of magic, the alchemist is often regarded as being just as unstable, unpredictable, and dangerous as the concoctions he brews. While some creators of alchemical items content themselves with sedentary lives as merchants, providing tindertwigs and smokesticks, the true alchemist answers a deeper calling. Rather than cast magic like a spellcaster, the alchemist captures his own magic potential within liquids and extracts he creates, infusing his chemicals with virulent power to grant him impressive skill with poisons, explosives, and all manner of self-transformative magic.",
        name: "Alchemist"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "will",
        hitDice: 4,
        mainAtrb: "Int",
        description:
            "A member of the ruling class, but no so high in hierarchy. Aristocrats are NPCs that can be used to help players with insights, strategies and whatever is needed from them. They are skilled in knowledge and wisdom. They are not fit for confrontation. They are usually found in large cities and moderately wealthy surroundings. They might have one or two body guards who will fight for them if necessary.",
        name: "Aristocrat"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort",
        hitDice: 12,
        mainAtrb: "Str",
        description:
            "For some, there is only rage. In the ways of their people, in the fury of their passion, in the howl of battle, conflict is all these brutal souls know. Savages, hired muscle, masters of vicious martial techniques, they are not soldiers or professional warriors. They are the battle possessed, creatures of slaughter and spirits of war. Known as barbarians, these warmongers know little of training, preparation, or the rules of warfare; for them, only the moment exists, with the foes that stand before them and the knowledge that the next moment might hold their death. They possess a sixth sense in regard to danger and the endurance to weather all that might entail. These brutal warriors might rise from all walks of life, both civilized and savage, though whole societies embracing such philosophies roam the wild places of the world. Within barbarians storms the primal spirit of battle, and woe to those who face their rage.",
        name: "Barbarian"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, ref",
        hitDice: 8,
        mainAtrb: "Str",
        description:
            "This is an NPC class that serves as antagonist to either heroes or anti heroes. Bandits are found everywhere, can belong to any race and their only interest is to rip off the belongings of incautious people where they are found. They usually come in packs or crews to foray, murder and take whatever they desire. They will attack cowardly, deceive for personal gain and hardly ever fight to the death. However the most dangerous bandits will form organizations that rise above common crimes and become Crime Lords, real menace to entire villages, counties or cities.",
        name: "Bandit"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "ref, will",
        hitDice: 8,
        mainAtrb: "Wis",
        description:
            "Untold wonders and secrets exist for those skillful enough to discover them. Through cleverness, talent, and magic, these cunning few unravel the wiles of the world, becoming adept in the arts of persuasion, manipulation, and inspiration. Typically masters of one or many forms of artistry, bards possess an uncanny ability to know more than they should and use what they learn to keep themselves and their allies ever one step ahead of danger. Bards are quick-witted and captivating, and their skills might lead them down many paths, be they gamblers or jacks-of-all-trades, scholars or performers, leaders or scoundrels, or even all of the above. For bards, every day brings its own opportunities, adventures, and challenges, and only by bucking the odds, knowing the most, and being the best might they claim the treasures of each.",
        name: "Bard"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, will",
        hitDice: 8,
        mainAtrb: "Wis",
        description:
            "In faith and the miracles of the divine, many find a greater purpose. Called to serve powers beyond most mortal understanding, all priests preach wonders and provide for the spiritual needs of their people. Clerics are more than mere priests, though; these emissaries of the divine work the will of their deities through strength of arms and the magic of their gods. Devoted to the tenets of the religions and philosophies that inspire them, these ecclesiastics quest to spread the knowledge and influence of their faith. Yet while they might share similar abilities, clerics prove as different from one another as the divinities they serve, with some offering healing and redemption, others judging law and truth, and still others spreading conflict and corruption. The ways of the cleric are varied, yet all who tread these paths walk with the mightiest of allies and bear the arms of the gods themselves.",
        name: "Cleric"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "ref",
        hitDice: 4,
        mainAtrb: "Dex",
        description:
            "Commoners are the mundane folks. The men and women that have nothing special for themselves. They are villagers, workers, fishermen, etc. They represent the majority of people that will be encountered in all places. They might stand their ground if protected by soldiers or if the rule of law applies where they are. In any other case, they will absolutely run from confrontation and surrender if there is no other way out.",
        name: "Commoner"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, will",
        hitDice: 8,
        mainAtrb: "Wis",
        description:
            "Within the purity of the elements and the order of the wilds lingers a power beyond the marvels of civilization. Furtive yet undeniable, these primal magics are guarded over by servants of philosophical balance known as druids. Allies to beasts and manipulators of nature, these often misunderstood protectors of the wild strive to shield their lands from all who would threaten them and prove the might of the wilds to those who lock themselves behind city walls. Rewarded for their devotion with incredible powers, druids gain unparalleled shape-shifting abilities, the companionship of mighty beasts, and the power to call upon nature's wrath. The mightiest temper powers akin to storms, earthquakes, and volcanoes with primeval wisdom long abandoned and forgotten by civilization.",
        name: "Druid"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "all",
        hitDice: 8,
        mainAtrb: "Dex",
        description:
            "For the truly exemplary, martial skill transcends the battlefield—it is a lifestyle, a doctrine, a state of mind. These warrior-artists search out methods of battle beyond swords and shields, finding weapons within themselves just as capable of crippling or killing as any blade. These monks (so called since they adhere to ancient philosophies and strict martial disciplines) elevate their bodies to become weapons of war, from battle-minded ascetics to self-taught brawlers. Monks tread the path of discipline, and those with the will to endure that path discover within themselves not what they are, but what they are meant to be.",
        name: "Monk"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "will",
        hitDice: 4,
        mainAtrb: "Cha",
        description:
            "A member of the ruling class. Very high in hierarchy. nobles are NPCs that can be used to help players with insights, strategies and whatever is needed from them. They are very skilled in knowledge, diplomacy and wisdom. They are not fit for confrontation. They are usually found in large cities and highly wealthy surroundings. They will never be found without a handful of powerful body guards who will fight for them if necessary.",
        name: "Noble"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, will",
        hitDice: 10,
        mainAtrb: "Str",
        description:
            "Through a select, worthy few shines the power of the divine. Called paladins, these noble souls dedicate their swords and lives to the battle against evil. Knights, crusaders, and law-bringers, paladins seek not just to spread divine justice but to embody the teachings of the virtuous deities they serve. In pursuit of their lofty goals, they adhere to ironclad laws of morality and discipline. As reward for their righteousness, these holy champions are blessed with boons to aid them in their quests: powers to banish evil, heal the innocent, and inspire the faithful. Although their convictions might lead them into conflict with the very souls they would save, paladins weather endless challenges of faith and dark temptations, risking their lives to do right and fighting to bring about a brighter future.",
        name: "Paladin"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, ref",
        hitDice: 10,
        mainAtrb: "Dex",
        description:
            "For those who relish the thrill of the hunt, there are only predators and prey. Be they scouts, trackers, or bounty hunters, rangers share much in common: unique mastery of specialized weapons, skill at stalking even the most elusive game, and the expertise to defeat a wide range of quarries. Knowledgeable, patient, and skilled hunters, these rangers hound man, beast, and monster alike, gaining insight into the way of the predator, skill in varied environments, and ever more lethal martial prowess. While some track man-eating creatures to protect the frontier, others pursue more cunning game—even fugitives among their own people.",
        name: "Ranger"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "ref",
        hitDice: 8,
        mainAtrb: "Dex",
        description:
            "Life is an endless adventure for those who live by their wits. Ever just one step ahead of danger, rogues bank on their cunning, skill, and charm to bend fate to their favor. Never knowing what to expect, they prepare for everything, becoming masters of a wide variety of skills, training themselves to be adept manipulators, agile acrobats, shadowy stalkers, or masters of any of dozens of other professions or talents. Thieves and gamblers, fast talkers and diplomats, bandits and bounty hunters, and explorers and investigators all might be considered rogues, as well as countless other professions that rely upon wits, prowess, or luck. Although many rogues favor cities and the innumerable opportunities of civilization, some embrace lives on the road, journeying far, meeting exotic people, and facing fantastic danger in pursuit of equally fantastic riches. In the end, any who desire to shape their fates and live life on their own terms might come to be called rogues.",
        name: "Rogue"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "will",
        hitDice: 6,
        mainAtrb: "Cha",
        description:
            "Scions of innately magical bloodlines, the chosen of deities, the spawn of monsters, pawns of fate and destiny, or simply flukes of fickle magic, sorcerers look within themselves for arcane prowess and draw forth might few mortals can imagine. Emboldened by lives ever threatening to be consumed by their innate powers, these magic-touched souls endlessly indulge in and refine their mysterious abilities, gradually learning how to harness their birthright and coax forth ever greater arcane feats. Just as varied as these innately powerful spellcasters' abilities and inspirations are the ways in which they choose to utilize their gifts. While some seek to control their abilities through meditation and discipline, becoming masters of their fantastic birthright, others give in to their magic, letting it rule their lives with often explosive results. Regardless, sorcerers live and breathe that which other spellcasters devote their lives to mastering, and for them magic is more than a boon or a field of study; it is life itself.",
        name: "Sorcerer"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort",
        hitDice: 10,
        mainAtrb: "Str",
        description:
            "Some take up arms for glory, wealth, or revenge. Others do battle to prove themselves, to protect others, or because they know nothing else. Still others learn the ways of weaponcraft to hone their bodies in battle and prove their mettle in the forge of war. Lords of the battlefield, warriors are a disparate lot, training with many weapons or just one, perfecting the uses of armor, learning the fighting techniques of exotic masters, and studying the art of combat, all to shape themselves into living weapons. Far more than mere thugs, these skilled warriors reveal the true deadliness of their weapons, turning hunks of metal into arms capable of taming kingdoms, slaughtering monsters, and rousing the hearts of armies. Soldiers, knights, hunters, and artists of war, warriors are unparalleled champions, and woe to those who dare stand against them.",
        name: "Warrior"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "will",
        hitDice: 6,
        mainAtrb: "Int",
        description:
            "Beyond the veil of the mundane hide the secrets of absolute power. The works of beings beyond mortals, the legends of realms where gods and spirits tread, the lore of creations both wondrous and terrible—such mysteries call to those with the ambition and the intellect to rise above the common folk to grasp true might. Such is the path of the wizard. These shrewd magic-users seek, collect, and covet esoteric knowledge, drawing on cultic arts to work wonders beyond the abilities of mere mortals. While some might choose a particular field of magical study and become masters of such powers, others embrace versatility, reveling in the unbounded wonders of all magic. In either case, wizards prove a cunning and potent lot, capable of smiting their foes, empowering their allies, and shaping the world to their every desire.",
        name: "Wizard"),
  ];

  final List<ClassModel> physicalClasses = [
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort",
        hitDice: 12,
        mainAtrb: "Str",
        name: "Barbarian"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort",
        hitDice: 8,
        mainAtrb: "Str",
        name: "Bandit"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort",
        hitDice: 10,
        mainAtrb: "Str",
        name: "Paladin"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort",
        hitDice: 10,
        mainAtrb: "Str",
        name: "Warrior"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "ref",
        hitDice: 8,
        mainAtrb: "Dex",
        name: "Rogue"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, ref",
        hitDice: 10,
        mainAtrb: "Dex",
        name: "Ranger"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "all",
        hitDice: 8,
        mainAtrb: "Dex",
        name: "Monk"),
  ];

  final List<ClassModel> mentalClasses = [
    ClassModel(
        isSelected: false,
        resistUpgrade: "will",
        hitDice: 4,
        mainAtrb: "Int",
        name: "Aristocrat"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "will",
        hitDice: 4,
        mainAtrb: "Cha",
        name: "Noble"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "will",
        hitDice: 6,
        mainAtrb: "Cha",
        name: "Sorcerer"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "will",
        hitDice: 6,
        mainAtrb: "Int",
        name: "Wizard"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "ref, will",
        hitDice: 8,
        mainAtrb: "Wis",
        name: "Bard"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, ref",
        hitDice: 8,
        mainAtrb: "Int",
        name: "Alchemist"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, will",
        hitDice: 8,
        mainAtrb: "Wis",
        name: "Cleric"),
    ClassModel(
        isSelected: false,
        resistUpgrade: "fort, will",
        hitDice: 8,
        mainAtrb: "Wis",
        name: "Druid"),
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
    LevelModel(level: 28, good: 17, bad: 10),
    LevelModel(level: 29, good: 18, bad: 10),
    LevelModel(level: 30, good: 19, bad: 11),
  ];
}
