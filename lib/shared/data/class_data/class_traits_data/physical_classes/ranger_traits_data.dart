import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';

class RangerTraitsData {
  List<TraitModel> rangerTraits = [
    TraitModel(
      traiName: "Favored enemy",
      levelAcquired: 1,
      multiplier: 5,
      traiDescription:
          "At 1st level, a ranger gets a +2 bonus on Bluff, Knowledge, Perception, Sense Motive, and Survival checks against creatures of his selected type. Likewise, he gets a +2 bonus on weapon attack and damage rolls against them. A ranger may make Knowledge skill checks untrained when attempting to identify these creatures. At 5th level and every five levels thereafter (10th, 15th, and 20th level), the ranger gets an additional favored enemy. In addition, at each such interval, the bonus against any one favored enemy (including the one just selected, if so desired) increases by +2. If a specific creature falls into more than one category of favored enemy, the ranger's bonuses do not stack; he simply uses whichever bonus is higher.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Track",
      levelAcquired: 1,
      traiDescription:
          "A ranger adds half his level (minimum 1) to Survival skill checks made to follow tracks.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Wild Empathy",
      levelAcquired: 1,
      traiDescription:
          "A ranger can improve the initial attitude of an animal. This ability functions just like a Diplomacy check to improve the attitude of a person (see Using Skills). The ranger rolls 1d20 and adds his ranger level and his Charisma bonus to determine the wild empathy check result. The typical domestic animal has a starting attitude of indifferent, while wild animals are usually unfriendly. To use wild empathy, the ranger and the animal must be within 30 feet of one another under normal visibility conditions. Generally, influencing an animal in this way takes 1 minute, but, as with influencing people, it might take more or less time. The ranger can also use this ability to influence a magical beast with an Intelligence score of 1 or 2, but he takes a –4 penalty on the check.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Combat Style Feat",
      levelAcquired: 2,
      multiplier: 4,
      traiDescription:
          "At 2nd level, a ranger must select one of two combat styles to pursue: archery or two-weapon combat. The ranger's expertise manifests in the form of bonus feats at 2nd, 6th, 10th, 14th, and 18th level. He can choose feats from his selected combat style, even if he does not have the normal prerequisites.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Endurance",
      levelAcquired: 3,
      traiDescription: "A ranger gains Endurance as a bonus feat at 3rd level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Favored terrain",
      levelAcquired: 3,
      multiplier: 5,
      traiDescription:
          "At 3rd level, a ranger gets a type of terrain from the Favored Terrains table. The ranger gains a +2 bonus on initiative checks and Knowledge (geography), Perception, Stealth, and Survival skill checks when he is in this terrain. A ranger traveling through his favored terrain normally leaves no trail and cannot be tracked (though he may leave a trail if he so chooses). At 8th level and every five levels thereafter, the ranger gets an additional favored terrain. In addition, at each such interval, the skill bonus and initiative bonus in any one favored terrain (including the one just selected, if so desired), increases by +2. If a specific terrain falls into more than one category of favored terrain, the ranger's bonuses do not stack; he simply uses whichever bonus is higher.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Hunter's Bond",
      levelAcquired: 4,
      traiDescription:
          " At 4th level, a ranger forms a bond with his hunting companions. This bond can take one of two forms. Once the form is chosen, it cannot be changed. The first is a bond to his companions. This bond allows him to spend a move action to grant half his favored enemy bonus against a single target of the appropriate type to all allies within 30 feet who can see or hear him. This bonus lasts for a number of rounds equal to the ranger's Wisdom modifier (minimum 1). This bonus does not stack with any favored enemy bonuses possessed by his allies; they use whichever bonus is higher. The second option is to form a close bond with an animal companion. A ranger who selects an animal companion can choose from the following list: badger, bird, camel, cat (small), dire rat, dog, horse, pony, snake (viper or constrictor), or wolf. If the campaign takes place wholly or partly in an aquatic environment, the ranger may choose a shark instead. This animal is a loyal companion that accompanies the ranger on his adventures as appropriate for its kind. A ranger's animal companion shares his favored enemy and favored terrain bonuses. This ability functions like the druid animal companion ability (which is part of the Nature Bond class feature), except that the ranger's effective druid level is equal to his ranger level – 3.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Spells",
      levelAcquired: 4,
      traiDescription:
          "Beginning at 4th level, a ranger gains the ability to cast a small number of divine spells. Like other spellcasters, a ranger can cast only a certain number of spells of each spell level per day. A ranger must spend 1 hour per day in quiet meditation to regain his daily allotment of spells. Through 3rd level, a ranger has no caster level. At 4th level and higher, his caster level is equal to his ranger level – 3.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Woodland Stride",
      levelAcquired: 7,
      traiDescription:
          " Starting at 7th level, a ranger may move through any sort of undergrowth (such as natural thorns, briars, overgrown areas, and similar terrain) at his normal speed and without taking damage or suffering any other impairment. Thorns, briars, and overgrown areas that are enchanted or magically manipulated to impede motion, however, still affect him.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Swift Tracker",
      levelAcquired: 1,
      traiDescription:
          "Beginning at 8th level, a ranger can move at his normal speed while using Survival to follow tracks without taking the normal –5 penalty. He takes only a –10 penalty (instead of the normal –20) when moving at up to twice normal speed while tracking.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Evasion",
      levelAcquired: 9,
      traiDescription:
          "When he reaches 9th level, a ranger can avoid even magical and unusual attacks with great agility. If he makes a successful Reflex saving throw against an attack that normally deals half damage on a successful save, he instead takes no damage. Evasion can be used only if the ranger is wearing light armor, medium armor, or no armor. A helpless ranger does not gain the benefit of evasion.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Quarry",
      levelAcquired: 11,
      traiDescription:
          "At 11th level, a ranger can, as a standard action, denote one target within his line of sight as his quarry. Whenever he is following the tracks of his quarry, a ranger can take 10 on his Survival skill checks while moving at normal speed, without penalty. In addition, he receives a +2 insight bonus on attack rolls made against his quarry, and all critical threats are automatically confirmed. A ranger can have no more than one quarry at a time and the creature's type must correspond to one of his favored enemy types. He can dismiss this effect at any time as a free action, but he cannot select a new quarry for 24 hours. If the ranger sees proof that his quarry is dead, he can select a new quarry after waiting 1 hour.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Camouflage",
      levelAcquired: 12,
      traiDescription:
          "A ranger of 12th level or higher can use the Stealth skill to hide in any of his favored terrains, even if the terrain doesn't grant cover or concealment.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Evasion",
      levelAcquired: 16,
      traiDescription:
          "At 16th level, a ranger's evasion improves. This ability works like evasion, except that while the ranger still takes no damage on a successful Reflex saving throw against attacks, he henceforth takes only half damage on a failed save. A helpless ranger does not gain the benefit of improved evasion.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Hide in Plain Sight",
      levelAcquired: 17,
      traiDescription:
          "While in any of his favored terrains, a ranger of 17th level or higher can use the Stealth skill even while being observed.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Quarry",
      levelAcquired: 19,
      traiDescription:
          "At 19th level, the ranger's ability to hunt his quarry improves. He can now select a quarry as a free action, and can now take 20 while using Survival to track his quarry, while moving at normal speed without penalty. His insight bonus to attack his quarry increases to +4. If his quarry is killed or dismissed, he can select a new one after 10 minutes have passed.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Master Hunte",
      levelAcquired: 20,
      traiDescription:
          " ranger of 20th level becomes a master hunter. He can always move at full speed while using Survival to follow tracks without penalty. He can, as a standard action, make a single attack against a favored enemy at his full attack bonus. If the attack hits, the target takes damage normally and must make a Fortitude save or die. The DC of this save is equal to 10 + 1/2 the ranger's level + the ranger's Wisdom modifier. A ranger can choose instead to deal an amount of nonlethal damage equal to the creature's current hit points. A successful save negates this damage. A ranger can use this ability once per day against each favored enemy type he possesses, but not against the same creature more than once in a 24-hour period.",
      isSelected: false,
    ),
  ];

  List<String> favoriteEnemies = [
    "Aberration",
    "Animal",
    "Construct",
    "Dragon",
    "Fey",
    "Humanoid (aquatic)",
    "Humanoid (dwarf)",
    "Humanoid (elf)",
    "Humanoid (giant)",
    "Humanoid (goblinoid)",
    "Humanoid (gnoll)",
    "Humanoid (gnome)",
    "Humanoid (halfling)",
    "Humanoid (human)",
    "Humanoid (orc)",
    "Humanoid (reptilian)",
    "Humanoid (other subtype)",
    "Magical beast",
    "Monstrous humanoid",
    "Ooze",
    "Outsider (air)",
    "Outsider (chaotic)",
    "Outsider (earth)",
    "Outsider (evil)",
    "Outsider (fire)",
    "Outsider (good)",
    "Outsider (lawful)",
    "Outsider (native)",
    "Outsider (water)",
    "Plant",
    "Undead",
    "Vermin",
  ];

  List<String> favoriteTerrains = [
    "Cold (ice, glaciers, snow, and tundra)",
    "Desert (sand and wastelands)",
    "Forest (coniferous and deciduous)",
    "Jungle",
    "Mountain (including hills)",
    "Plains",
    "Planes (pick one, other than Material Plane)",
    "Swamp",
    "Underground (caves and dungeons)",
    "Urban (buildings, streets, and sewers)",
    "Water (above and below the surface)",
  ];
}
