import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';

class MonkTraitsData {
  List<TraitModel> monkTraits = [
    TraitModel(
      isSelected: false,
      traiName: "AC Bonus +",
      levelAcquired: 4,
      multiplier: 4,
      traiDescription:
          "When unarmored and unencumbered, the monk adds his Wisdom bonus (if any) to his AC and his CMD. In addition, a monk gains a +1 bonus to AC and CMD at 4th level. This bonus increases by 1 for every four monk levels thereafter, up to a maximum of +5 at 20th level. These bonuses to AC apply even against touch attacks or when the monk is flat-footed. He loses these bonuses when he is immobilized or helpless, when he wears any armor, when he carries a shield, or when he carries a medium or heavy load.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Flurry of Blows",
      levelAcquired: 1,
      traiDescription:
          "Starting at 1st level, a monk can make a flurry of blows as a full-attack action. When doing so, he may make on additional attack, taking a -2 penalty on all of his attack rolls, as if using the Two-Weapon Fighting feat. These attacks can be any combination of unarmed strikes and attacks with a monk special weapon (he does not need to use two weapons to use this ability). For the purpose of these attacks, the monk's base attack bonus from his monk class levels is equal to his monk level. For all other purposes, such as qualifying for a feat or a prestige class, the monk uses his normal base attack bonus. At 8th level, the monk can make two additional attacks when he uses flurry of blows, as if using Improved Two-Weapon Fighting (even if the monk does not meet the prerequisites for the feat). At 15th level, the monk can make three additional attacks using flurry of blows, as if using Greater Two-Weapon Fighting (even if the monk does not meet the prerequisites for the feat). A monk applies his full Strength bonus to his damage rolls for all successful attacks made with flurry of blows, whether the attacks are made with an off-hand or with a weapon wielded in both hands. A monk may substitute disarm, sunder, and trip combat maneuvers for unarmed attacks as part of a flurry of blows. A monk cannot use any weapon other than an unarmed strike or a special monk weapon as part of a flurry of blows. A monk with natural weapons cannot use such weapons as part of a flurry of blows, nor can he make natural attacks in addition to his flurry of blows attacks.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Unarmed Strike",
      levelAcquired: 1,
      traiDescription:
          "At 1st level, a monk gains Improved Unarmed Strike as a bonus feat. A monk's attacks may be with fist, elbows, knees, and feet. This means that a monk may make unarmed strikes with his hands full. There is no such thing as an off-hand attack for a monk striking unarmed. A monk may thus apply his full Strength bonus on damage rolls for all his unarmed strikes. Usually a monk's unarmed strikes deal lethal damage, but he can choose to deal nonlethal damage instead with no penalty on his attack roll. He has the same choice to deal lethal or nonlethal damage while grappling. A monk's unarmed strike is treated as both a manufactured weapon and a natural weapon for the purpose of spells and effects that enhance or improve either manufactured weapons or natural weapons. A monk also deals more damage with his unarmed strikes than a normal person would. Level (1st–3rd) - 1d6; Level (4th–7th) - 1d8; Level (8th–11th) - 1d10; Level (12th–15th) - 2d6; Level (16th–19th) - 2d8; Level (20th) - 2d10;",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Bonus Feat",
      levelAcquired: 1,
      multiplier: 4,
      traiDescription:
          "At 1st level, 2nd level, and every 4 levels thereafter, a monk may select a bonus feat. These feats must be taken from the following list: Catch Off-Guard, Combat Reflexes, Deflect Arrows, Dodge, Improved Grapple, Scorpion Style, and Throw Anything. At 6th level, the following feats are added to the list: Gorgon's Fist, Improved Bull Rush, Improved Disarm, Improved Feint, Improved Trip, and Mobility. At 10th level, the following feats are added to the list: Improved Critical, Medusa's Wrath, Snatch Arrows, and Spring Attack. A monk need not have any of the prerequisites normally required for these feats to select them.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Stunning Fist",
      levelAcquired: 1,
      multiplier: 4,
      traiDescription:
          "At 1st level, the monk gains Stunning Fist as a bonus feat, even if he does not meet the prerequisites. At 4th level, and every 4 levels thereafter, the monk gains the ability to apply a new condition to the target of his Stunning Fist. This condition replaces stunning the target for 1 round, and a successful saving throw still negates the effect. At 4th level, he can choose to make the target fatigued. At 8th level, he can make the target sickened for 1 minute. At 12th level, he can make the target staggered for 1d6+1 rounds. At 16th level, he can permanently blind or deafen the target. At 20th level, he can paralyze the target for 1d6+1 rounds. The monk must choose which condition will apply before the attack roll is made. These effects do not stack with themselves (a creature sickened by Stunning Fist cannot become nauseated if hit by Stunning Fist again), but additional hits do increase the duration.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Evasion",
      levelAcquired: 2,
      traiDescription:
          "At 2nd level or higher, a monk can avoid damage from many area-effect attacks. If a monk makes a successful Reflex saving throw against an attack that normally deals half damage on a successful save, he instead takes no damage. Evasion can be used only if a monk is wearing light armor or no armor. A helpless monk does not gain the benefit of evasion.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Fast Movement",
      levelAcquired: 3,
      multiplier: 3,
      traiDescription:
          " At 3rd level, a monk gains an enhancement bonus to his land speed. A monk in armor or carrying a medium or heavy load loses this extra speed.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Maneuver Training",
      levelAcquired: 3,
      traiDescription:
          "At 3rd level, a monk uses his monk level in place of his base attack bonus when calculating his Combat Maneuver Bonus. Base attack bonuses granted from other classes are unaffected and are added normally.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Still Mind",
      levelAcquired: 3,
      traiDescription:
          "A monk of 3rd level or higher gains a +2 bonus on saving throws against enchantment spells and effects.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Ki Pool",
      levelAcquired: 4,
      traiDescription:
          " At 4th level, a monk gains a pool of ki points, supernatural energy he can use to accomplish amazing feats. The number of points in a monk's ki pool is equal to 1/2 his monk level + his Wisdom modifier. As long as he has at least 1 point in his ki pool, he can make a ki strike. At 4th level, ki strike allows his unarmed attacks to be treated as magic weapons for the purpose of overcoming damage reduction. At 7th level, his unarmed attacks are also treated as cold iron and silver for the purpose of overcoming damage reduction. At 10th level, his unarmed attacks are also treated as lawful weapons for the purpose of overcoming damage reduction. At 16th level, his unarmed attacks are treated as adamantine weapons for the purpose of overcoming damage reduction and bypassing hardness. By spending 1 point from his ki pool, a monk can make one additional attack at his highest attack bonus when making a flurry of blows attack. In addition, he can spend 1 point to increase his speed by 20 feet for 1 round. Finally, a monk can spend 1 point from his ki pool to give himself a +4 dodge bonus to AC for 1 round. Each of these powers is activated as a swift action. A monk gains additional powers that consume points from his ki pool as he gains levels. The ki pool is replenished each morning after 8 hours of rest or meditation; these hours do not need to be consecutive.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Slow Fall",
      levelAcquired: 4,
      multiplier: 2,
      traiDescription:
          "At 4th level or higher, a monk within arm's reach of a wall can use it to slow his descent. When first gaining this ability, he takes damage as if the fall were 20 feet shorter than it actually is. The monk's ability to slow his fall (that is, to reduce the effective distance of the fall when next to a wall) improves with his monk level until at 20th level he can use a nearby wall to slow his descent and fall any distance without harm.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "High Jump",
      levelAcquired: 1,
      traiDescription:
          "At 5th level, a monk adds his level to all Acrobatics checks made to jump, both for vertical jumps and horizontal jumps. In addition, he always counts as having a running start when making jump checks using Acrobatics. By spending 1 point from his ki pool as a swift action, a monk gains a +20 bonus on Acrobatics checks made to jump for 1 round.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Purity of Body",
      levelAcquired: 5,
      traiDescription:
          " At 5th level, a monk gains immunity to all diseases, including supernatural and magical diseases.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Wholeness of Body",
      levelAcquired: 7,
      traiDescription:
          "7th level or higher, a monk can heal his own wounds as a standard action. He can heal a number of hit points of damage equal to his monk level by using 2 points from his ki pool.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Improved Evasion",
      levelAcquired: 9,
      traiDescription:
          " At 9th level, a monk's evasion ability improves. He still takes no damage on a successful Reflex saving throw against attacks, but henceforth he takes only half damage on a failed save. A helpless monk does not gain the benefit of improved evasion.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Diamond Body",
      levelAcquired: 11,
      traiDescription:
          "At 11th level, a monk gains immunity to poisons of all kinds.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Abundant Step",
      levelAcquired: 12,
      traiDescription:
          " At 12th level or higher, a monk can slip magically between spaces, as if using the spell dimension door. Using this ability is a move action that consumes 2 points from his ki pool. His caster level for this effect is equal to his monk level. He cannot take other creatures with him when he uses this ability.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Diamond Soul",
      levelAcquired: 13,
      traiDescription:
          "At 13th level, a monk gains spell resistance equal to his current monk level + 10. In order to affect the monk with a spell, a spellcaster must get a result on a caster level check (1d20 + caster level) that equals or exceeds the monk's spell resistance.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Quivering Palm",
      levelAcquired: 15,
      traiDescription:
          "Starting at 15th level, a monk can set up vibrations within the body of another creature that can thereafter be fatal if the monk so desires. He can use this quivering palm attack once per day, and he must announce his intent before making his attack roll. Creatures immune to critical hits cannot be affected. Otherwise, if the monk strikes successfully and the target takes damage from the blow, the quivering palm attack succeeds. Thereafter, the monk can try to slay the victim at any later time, as long as the attempt is made within a number of days equal to his monk level. To make such an attempt, the monk merely wills the target to die (a free action), and unless the target makes a Fortitude saving throw (DC 10 + 1/2 the monk's level + the monk's Wis modifier), it dies. If the saving throw is successful, the target is no longer in danger from that particular quivering palm attack, but it may still be affected by another one at a later time. A monk can have no more than 1 quivering palm in effect at one time. If a monk uses quivering palm while another is still in effect, the previous effect is negated.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Timeless Body",
      levelAcquired: 17,
      traiDescription:
          "At 17th level, a monk no longer takes penalties to his ability scores for aging and cannot be magically aged. Any such penalties that he has already taken, however, remain in place. Age bonuses still accrue, and the monk still dies of old age when his time is up.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Tongue of the Sun and Moon",
      levelAcquired: 17,
      traiDescription:
          "A monk of 17th level or higher can speak with any living creature.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Empty Body",
      levelAcquired: 19,
      traiDescription:
          "At 19th level, a monk gains the ability to assume an ethereal state for 1 minute as though using the spell etherealness. Using this ability is a move action that consumes 3 points from his ki pool. This ability only affects the monk and cannot be used to make other creatures ethereal.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Perfect Self",
      levelAcquired: 20,
      traiDescription:
          "At 20th level, a monk becomes a magical creature. He is forevermore treated as an outsider rather than as a humanoid (or whatever the monk's creature type was) for the purpose of spells and magical effects. Additionally, the monk gains damage reduction 10/chaotic, which allows him to ignore the first 10 points of damage from any attack made by a nonchaotic weapon or by any natural attack made by a creature that doesn't have similar damage reduction. Unlike other outsiders, the monk can still be brought back from the dead as if he were a member of his previous creature type.",
    ),
  ];

  List<KeyValueModel> unarmedAtk = [
    KeyValueModel(key: "1 2 3", value: "1d6"),
    KeyValueModel(key: "4 5 6 7", value: "1d8"),
    KeyValueModel(key: "8 9 10 11", value: "1d10"),
    KeyValueModel(key: "12 13 14 15", value: "2d6"),
    KeyValueModel(key: "16 17 18 19", value: "2d8"),
    KeyValueModel(key: "20", value: "2d10"),
  ];
}