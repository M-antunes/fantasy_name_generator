import '../../../models/class_models/traits_model.dart';

class ReariedCombatFeatsData {
  List<TraitModel> berserkerFeats = [
    TraitModel(
      traiName: "Power Attack",
      levelAcquired: 1,
      traiDescription:
          "You can choose to take a –1 penalty on all melee attack rolls and combat maneuver checks to gain a +2 bonus on all melee damage rolls. This bonus to damage is increased by half (+50%) if you are making an attack with a two-handed weapon, a one handed weapon using two hands, or a primary natural weapon that adds 1-1/2 times your Strength modifier on damage rolls. This bonus to damage is halved (–50%) if you are making an attack with an off-hand weapon or secondary natural weapon. When your base attack bonus reaches +4, and every 4 points thereafter, the penalty increases by –1 and the bonus to damage increases by +2. You must choose to use this feat before making an attack roll, and its effects last until your next turn. The bonus damage does not apply to touch attacks or effects that do not deal hit point damage.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Focus",
      levelAcquired: 1,
      traiDescription:
          "You gain a +1 bonus on all attack rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Specialization",
      levelAcquired: 4,
      traiDescription:
          "You gain a +2 bonus on all damage rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Toughness",
      levelAcquired: 1,
      traiDescription: "+3 hit points, +1 per Hit Die beyond 3",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Weapon Focus",
      levelAcquired: 8,
      traiDescription:
          "You gain a +1 bonus on all attack rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Weapon Specialization",
      levelAcquired: 12,
      traiDescription:
          "You gain a +2 bonus on all damage rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Iron Will",
      levelAcquired: 1,
      fitFor: "all",
      traiDescription: "+2 bonus on Will saves",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Penetrating Strike",
      levelAcquired: 1,
      traiDescription: "Your attacks ignore 5 points of damage reduction",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Critical Focus",
      levelAcquired: 9,
      traiDescription: "+4 bonus on attack rolls made to confirm critical hits",
      fitFor: "all",
      isSelected: false,
    ),
  ];

  final List<TraitModel> bowmanFeats = [
    TraitModel(
      traiName: "Weapon Focus",
      levelAcquired: 1,
      traiDescription:
          "You gain a +1 bonus on all attack rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Point-Blank Shot",
      levelAcquired: 1,
      traiDescription: "+1 attack and damage on targets within 30 feet",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Precise Shot",
      levelAcquired: 1,
      traiDescription: "No penalty for shooting into melee",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Specialization",
      levelAcquired: 4,
      traiDescription: "+2 bonus on damage rolls with one weapon",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Initiative",
      levelAcquired: 1,
      traiDescription: "+4 bonus on initiative checks",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Rapid Shot",
      levelAcquired: 1,
      traiDescription:
          "When making a full-attack action with a ranged weapon, you can fire one additional time this round at your highest bonus. All of your attack rolls take a –2 penalty when using Rapid Shot.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved PreciseShot",
      levelAcquired: 11,
      traiDescription: "No cover or concealment chance on ranged attacks",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Iron Will",
      levelAcquired: 1,
      fitFor: "all",
      traiDescription: "+2 bonus on Will saves",
      isSelected: false,
    ),
  ];

  final List<TraitModel> marksmanFeats = [
    TraitModel(
      traiName: "Point-Blank Shot",
      levelAcquired: 1,
      traiDescription: "+1 attack and damage on targets within 30 feet",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Precise Shot",
      levelAcquired: 1,
      traiDescription: "No penalty for shooting into melee",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Rapid Reload",
      levelAcquired: 1,
      traiDescription:
          "The time required for you to reload your chosen type of crossbow is reduced to a free action (for a hand or light crossbow) or a move action (for a heavy crossbow). Reloading a crossbow still provokes an attack of opportunity. If you have selected this feat for hand crossbow or light crossbow, you may fire that weapon as many times in a full-attack action as you could attack if you were using a bow.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Crossbow Mastery",
      levelAcquired: 4,
      traiDescription:
          " The time required for you to reload any type of crossbow is reduced to a free action, regardless of the type of crossbow used. You can fire a crossbow as many times in a full attack action as you could attack if you were using a bow. Reloading a crossbow for the type of crossbow you chose when you took Rapid Reload no longer provokes attacks of opportunity.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Focus",
      levelAcquired: 1,
      traiDescription:
          "You gain a +1 bonus on all attack rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Specialization",
      levelAcquired: 4,
      traiDescription: "+2 bonus on damage rolls with one weapon",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Initiative",
      levelAcquired: 1,
      traiDescription: "+4 bonus on initiative checks",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Rapid Shot",
      levelAcquired: 1,
      traiDescription:
          "When making a full-attack action with a ranged weapon, you can fire one additional time this round at your highest bonus. All of your attack rolls take a –2 penalty when using Rapid Shot.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved PreciseShot",
      levelAcquired: 11,
      traiDescription: "No cover or concealment chance on ranged attacks",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Iron Will",
      levelAcquired: 1,
      fitFor: "all",
      traiDescription: "+2 bonus on Will saves",
      isSelected: false,
    ),
  ];

  final List<TraitModel> dualWielderFeat = [
    TraitModel(
      traiName: "Weapon Focus",
      levelAcquired: 1,
      traiDescription:
          "You gain a +1 bonus on all attack rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Two-Weapon Fighting",
      levelAcquired: 1,
      traiDescription: "Reduce two-weapon fighting penalties",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Double Slice",
      levelAcquired: 1,
      traiDescription: "Add your Str bonus to off-hand damage rolls",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Two-Weapon Defense",
      levelAcquired: 1,
      traiDescription: "Gain +1 shield bonus when fighting with two weapons",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Two-Weapon Fighting",
      levelAcquired: 8,
      traiDescription: "Gain additional off-hand attack",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Weapon Focus",
      levelAcquired: 8,
      traiDescription: "",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Two-Weapon Fighting",
      levelAcquired: 10,
      traiDescription: "Gain a third off-hand attack",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Toughness",
      levelAcquired: 1,
      traiDescription: "+3 hit points, +1 per Hit Die beyond 3",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Two-Weapon Rend",
      levelAcquired: 111,
      traiDescription:
          "If you hit an opponent with both your primary hand and your off-hand weapon, you deal an additional 1d10 points of damage plus 1-1/2 times your Strength modifier. You can only deal this additional damage once each round.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Iron Will",
      levelAcquired: 1,
      fitFor: "all",
      traiDescription: "+2 bonus on Will saves",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Specialization",
      levelAcquired: 12,
      traiDescription:
          "You gain a +2 bonus on all damage rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Critical Focus",
      levelAcquired: 9,
      traiDescription: "+4 bonus on attack rolls made to confirm critical hits",
      isSelected: false,
    ),
  ];

  final List<TraitModel> knifemanFeats = [
    TraitModel(
      traiName: "Weapon Finesse",
      levelAcquired: 1,
      traiDescription:
          "Use Dex instead of Str on attack rolls with light weapons",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Focus",
      levelAcquired: 1,
      traiDescription:
          "You gain a +1 bonus on all attack rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Twist Away",
      levelAcquired: 1,
      traiDescription:
          " While you are wearing light armor or no armor, if you are forced to attempt a Fortitude saving throw, you can use an immediate action to instead attempt a Reflex saving throw (at the same DC). If you succeed at this saving throw and the attack has a reduced effect on a successful save, you avoid the effect entirely. Whether the saving throw is successful or not, you are staggered until the end of your next turn. If you are prevented from becoming staggered, you can't use Twist Away , nor can you ignore the staggered condition from Twist Away or remove it early.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Steadfast Personality",
      levelAcquired: 1,
      fitFor: "Rogue",
      traiDescription:
          "Add your Charisma modifier instead of your Wisdom bonus to Will saves. If you have a Wisdom penalty, you must apply both your Wisdom penalty and your Charisma modifier.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Dodge",
      levelAcquired: 1,
      traiDescription: "+1 dodge bonus to AC",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Initiative",
      levelAcquired: 1,
      traiDescription: "+4 bonus on initiative checks",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Nimble Moves",
      levelAcquired: 1,
      traiDescription: "Ignore 5 feet of difficult terrain when you move",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Specialization",
      levelAcquired: 4,
      traiDescription: "+2 bonus on damage rolls with one weapon",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Mobility",
      levelAcquired: 1,
      traiDescription: "+4 AC against attacks of opportunity from movement",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Combat Reflexes",
      levelAcquired: 1,
      traiDescription:
          "You may make a number of additional attacks of opportunity per round equal to your Dexterity bonus. With this feat, you may also make attacks of opportunity while flat-footed.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Iron Will",
      levelAcquired: 1,
      fitFor: "all",
      traiDescription: "+2 bonus on Will saves",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Critical Focus",
      levelAcquired: 9,
      traiDescription: "+4 bonus on attack rolls made to confirm critical hits",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Feint",
      levelAcquired: 1,
      traiDescription:
          "You can make a Bluff check to feint in combat as a move action.",
      isSelected: false,
    ),
  ];

  final List<TraitModel> martialFeats = [
    TraitModel(
      traiName: "Weapon Finesse",
      levelAcquired: 1,
      traiDescription:
          "Use Dex instead of Str on attack rolls with light weapons",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Focus",
      levelAcquired: 1,
      traiDescription:
          "You gain a +1 bonus on all attack rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Defensive Combat Training",
      levelAcquired: 1,
      traiDescription:
          " You treat your total Hit Dice as your base attack bonus when calculating your Combat Maneuver Defense",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Deflect Arrows",
      levelAcquired: 1,
      traiDescription:
          "You must have at least one hand free (holding nothing) to use this feat. Once per round when you would normally be hit with an attack from a ranged weapon, you may deflect it so that you take no damage from it. You must be aware of the attack and not flat-footed. Attempting to deflect a ranged attack doesn't count as an action. Unusually massive ranged weapons (such as boulders or ballista bolts) and ranged attacks generated by natural attacks or spell effects can't be deflected.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Feint",
      levelAcquired: 1,
      traiDescription:
          "You can make a Bluff check to feint in combat as a move action.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Throw Anything",
      levelAcquired: 1,
      traiDescription:
          "You do not suffer any penalties for using an improvised ranged weapon. You receive a +1 circumstance bonus on attack rolls made with thrown splash weapons.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Specialization",
      levelAcquired: 4,
      traiDescription: "+2 bonus on damage rolls with one weapon",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Critical",
      levelAcquired: 4,
      traiDescription:
          " When using the weapon you selected, your threat range is doubled.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Initiative",
      levelAcquired: 1,
      traiDescription: "+4 bonus on initiative checks",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Dodge",
      levelAcquired: 1,
      traiDescription: "+1 dodge bonus to AC",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Mobility",
      levelAcquired: 1,
      traiDescription: "+4 AC against attacks of opportunity from movement",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Combat Reflexes",
      levelAcquired: 1,
      traiDescription:
          "You may make a number of additional attacks of opportunity per round equal to your Dexterity bonus. With this feat, you may also make attacks of opportunity while flat-footed.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Combat Expertise",
      levelAcquired: 1,
      traiDescription:
          "You can choose to take a –1 penalty on melee attack rolls and combat maneuver checks to gain a +1 dodge bonus to your Armor Class. When your base attack bonus reaches +4, and every +4 thereafter, the penalty increases by –1 and the dodge bonus increases by +1. You can only choose to use this feat when you declare that you are making an attack or a full-attack action with a melee weapon. The effects of this feat last until your next turn.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Disarm",
      levelAcquired: 1,
      traiDescription:
          "You do not provoke an attack of opportunity when performing a disarm combat maneuver. In addition, you receive a +2 bonus on checks made to disarm a foe. You also receive a +2 bonus to your Combat Maneuver Defense whenever an opponent tries to disarm you.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Grapple",
      levelAcquired: 1,
      traiDescription:
          "You do not provoke an attack of opportunity when performing a grapple combat maneuver. In addition, you receive a +2 bonus on checks made to grapple a foe. You also receive a +2 bonus to your Combat Maneuver Defense whenever an opponent tries to grapple you.",
      isSelected: false,
    ),
  ];

  final List<TraitModel> soldierFeats = [
    TraitModel(
      traiName: "Power Attack",
      levelAcquired: 1,
      traiDescription:
          "You can choose to take a –1 penalty on all melee attack rolls and combat maneuver checks to gain a +2 bonus on all melee damage rolls. This bonus to damage is increased by half (+50%) if you are making an attack with a two-handed weapon, a one handed weapon using two hands, or a primary natural weapon that adds 1-1/2 times your Strength modifier on damage rolls. This bonus to damage is halved (–50%) if you are making an attack with an off-hand weapon or secondary natural weapon. When your base attack bonus reaches +4, and every 4 points thereafter, the penalty increases by –1 and the bonus to damage increases by +2. You must choose to use this feat before making an attack roll, and its effects last until your next turn. The bonus damage does not apply to touch attacks or effects that do not deal hit point damage.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Focus",
      levelAcquired: 1,
      traiDescription:
          "You gain a +1 bonus on all attack rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Specialization",
      levelAcquired: 4,
      traiDescription:
          "You gain a +2 bonus on all damage rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Toughness",
      levelAcquired: 1,
      traiDescription: "+3 hit points, +1 per Hit Die beyond 3",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Shield Focus",
      levelAcquired: 1,
      traiDescription: "Gain a +1 bonus to your AC when using a shield",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Shield Focus",
      levelAcquired: 8,
      traiDescription: "Gain a +1 bonus to your AC when using a shield",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Weapon Focus",
      levelAcquired: 8,
      traiDescription: "",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Iron Will",
      levelAcquired: 1,
      fitFor: "all",
      traiDescription: "+2 bonus on Will saves",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Critical Focus",
      levelAcquired: 9,
      traiDescription: "+4 bonus on attack rolls made to confirm critical hits",
      isSelected: false,
    ),
  ];

  final List<TraitModel> swordsmanFeat = [
    TraitModel(
      traiName: "Weapon Focus",
      levelAcquired: 1,
      traiDescription:
          "You gain a +1 bonus on all attack rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Nimble Moves",
      levelAcquired: 1,
      traiDescription: "Ignore 5 feet of difficult terrain when you move",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Specialization",
      levelAcquired: 4,
      traiDescription: "+2 bonus on damage rolls with one weapon",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Initiative",
      levelAcquired: 1,
      traiDescription: "+4 bonus on initiative checks",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Dodge",
      levelAcquired: 1,
      traiDescription: "+1 dodge bonus to AC",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Mobility",
      levelAcquired: 1,
      traiDescription: "+4 AC against attacks of opportunity from movement",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Combat Reflexes",
      levelAcquired: 1,
      traiDescription:
          "You may make a number of additional attacks of opportunity per round equal to your Dexterity bonus. With this feat, you may also make attacks of opportunity while flat-footed.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Critical Focus",
      levelAcquired: 9,
      traiDescription: "+4 bonus on attack rolls made to confirm critical hits",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Penetrating Strike",
      levelAcquired: 1,
      traiDescription: "Your attacks ignore 5 points of damage reduction",
      isSelected: false,
    ),
  ];

  final List<TraitModel> throwerFeats = [
    TraitModel(
      traiName: "Weapon Focus",
      levelAcquired: 1,
      traiDescription:
          "You gain a +1 bonus on all attack rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Point-Blank Shot",
      levelAcquired: 1,
      traiDescription: "+1 attack and damage on targets within 30 feet",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Precise Shot",
      levelAcquired: 1,
      traiDescription: "No penalty for shooting into melee",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Combat Reflexes",
      levelAcquired: 1,
      traiDescription:
          "You may make a number of additional attacks of opportunity per round equal to your Dexterity bonus. With this feat, you may also make attacks of opportunity while flat-footed.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Specialization",
      levelAcquired: 4,
      traiDescription: "+2 bonus on damage rolls with one weapon",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Initiative",
      levelAcquired: 1,
      traiDescription: "+4 bonus on initiative checks",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Dodge",
      levelAcquired: 1,
      traiDescription: "+1 dodge bonus to AC",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved PreciseShot",
      levelAcquired: 11,
      traiDescription: "No cover or concealment chance on ranged attacks",
      isSelected: false,
    ),
  ];

  List<TraitModel> hybridFeats = [
    TraitModel(
      traiName: "Alignment Channel",
      levelAcquired: 1,
      traiDescription:
          "Instead of its normal effect, you can choose to have your ability to channel energy heal or harm outsiders of the chosen alignment subtype. You must make this choice each time you channel energy. If you choose to heal or harm creatures of the chosen alignment subtype, your channel energy has no effect on other creatures. The amount of damage healed or dealt and the DC to halve the damage is otherwise unchanged.",
      isSelected: false,
      fitFor: "Paladin, Antipaladin, Cleric",
    ),
    TraitModel(
      traiName: "Augment Summoning",
      levelAcquired: 1,
      traiDescription:
          ": Each creature you conjure with any summon spell gains a +4 enhancement bonus to Strength and Constitution for the duration of the spell that summoned it.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Channel Smite",
      levelAcquired: 1,
      traiDescription:
          " Before you make a melee attack roll, you can choose to spend one use of your channel energy ability as a swift action. If you channel positive energy and you hit an undead creature, that creature takes an amount of additional damage equal to the damage dealt by your channel positive energy ability. If you channel negative energy and you hit a living creature, that creature takes an amount of additional damage equal to the damage dealt by your channel negative energy ability. Your target can make a Will save, as normal, to halve this additional damage. If your attack misses, the channel energy ability is still expended with no effect.",
      isSelected: false,
      fitFor: "Paladin, Antipaladin, Cleric",
    ),
    TraitModel(
      traiName: "Combat Casting",
      levelAcquired: 1,
      traiDescription:
          "You get a +4 bonus on concentration checks made to cast a spell or use a spell-like ability when casting on the defensive or while grappled.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Eschew Materials",
      levelAcquired: 1,
      traiDescription:
          "You can cast any spell with a material component costing 1 gp or less without needing that component. The casting of the spell still provokes attacks of opportunity as normal. If the spell requires a material component that costs more than 1 gp, you must have the material component on hand to cast the spell, as normal.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Extra Channel",
      levelAcquired: 1,
      traiDescription:
          "You can channel energy two additional times per day. Special: If a paladin with the ability to channel positive energy takes this feat, she can use lay on hands four additional times a day, but only to channel positive energy.",
      isSelected: false,
      fitFor: "Paladin, Antipaladin, Cleric",
    ),
    TraitModel(
      traiName: "Extra Ki",
      levelAcquired: 1,
      traiDescription:
          ": Your ki pool increases by 2. Special: You can gain Extra Ki multiple times. Its effects stack.",
      isSelected: false,
      fitFor: "Monk",
    ),
    TraitModel(
      traiName: "Natural Spell",
      levelAcquired: 1,
      traiDescription:
          " You can complete the verbal and somatic components of spells while using wild shape. You substitute various noises and gestures for the normal verbal and somatic components of a spell. You can also use any material components or focuses you possess, even if such items are melded within your current form. This feat does not permit the use of magic items while you are in a form that could not ordinarily use them, and you do not gain the ability to speak while using wild shape.",
      isSelected: false,
      fitFor: "Druid",
    ),
    TraitModel(
      traiName: "Selective Channeling",
      levelAcquired: 1,
      traiDescription:
          " When you channel energy, you can choose a number of targets in the area up to your Charisma modifier. These targets are not affected by your channeled energy.",
      isSelected: false,
      fitFor: "Paladin, Antipaladin, Cleric",
    ),
    TraitModel(
      traiName: "Spell Focus",
      levelAcquired: 1,
      traiDescription:
          " Add +1 to the Difficulty Class for all saving throws against spells from the school of magic you select.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Spell Focus",
      levelAcquired: 1,
      traiDescription:
          " Add +1 to the Difficulty Class for all saving throws against spells from the school of magic you select. This bonus stacks with the bonus from Spell Focus.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Spell Penetration",
      levelAcquired: 1,
      traiDescription:
          "You get a +2 bonus on caster level checks (1d20 + caster level) made to overcome a creature's spell resistance.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Spell Penetration",
      levelAcquired: 1,
      traiDescription:
          "  You get a +2 bonus on caster level checks (1d20 + caster level) made to overcome a creature's spell resistance. This bonus stacks with the one from Spell Penetration.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Elemental Focus",
      levelAcquired: 1,
      traiDescription: "+1 bonus on save DCs for one energy type",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Elemental Focus",
      levelAcquired: 1,
      traiDescription: "+1 bonus on save DCs for one energy type",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Spell Perfection",
      levelAcquired: 10,
      traiDescription:
          "Apply any metamagic feat to one spell without penalty, up to 9th level",
      isSelected: false,
    ),
  ];

  List<TraitModel> spellCaster = [
    TraitModel(
      traiName: "Spell Focus",
      levelAcquired: 1,
      traiDescription:
          " Add +1 to the Difficulty Class for all saving throws against spells from the school of magic you select.",
      isSelected: false,
      fitFor: "Spellcaster",
    ),
    TraitModel(
      traiName: "Eschew Materials",
      levelAcquired: 1,
      traiDescription:
          "You can cast any spell with a material component costing 1 gp or less without needing that component. The casting of the spell still provokes attacks of opportunity as normal. If the spell requires a material component that costs more than 1 gp, you must have the material component on hand to cast the spell, as normal.",
      isSelected: false,
      fitFor: "Spellcaster",
    ),
    TraitModel(
      traiName: "Combat Casting",
      levelAcquired: 1,
      traiDescription:
          "You get a +4 bonus on concentration checks made to cast a spell or use a spell-like ability when casting on the defensive or while grappled.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Spell Focus",
      levelAcquired: 1,
      traiDescription:
          " Add +1 to the Difficulty Class for all saving throws against spells from the school of magic you select. This bonus stacks with the bonus from Spell Focus.",
      isSelected: false,
      fitFor: "Spellcaster",
    ),
    TraitModel(
      traiName: "Spell Penetration",
      levelAcquired: 1,
      traiDescription:
          "You get a +2 bonus on caster level checks (1d20 + caster level) made to overcome a creature's spell resistance.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Spell Penetration",
      levelAcquired: 1,
      traiDescription:
          "  You get a +2 bonus on caster level checks (1d20 + caster level) made to overcome a creature's spell resistance. This bonus stacks with the one from Spell Penetration.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Elemental Focus",
      levelAcquired: 1,
      traiDescription: "+1 bonus on save DCs for one energy type",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Elemental Focus",
      levelAcquired: 1,
      traiDescription: "+1 bonus on save DCs for one energy type",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Spell Perfection",
      levelAcquired: 10,
      traiDescription:
          "Apply any metamagic feat to one spell without penalty, up to 9th level",
      isSelected: false,
      fitFor: "Spellcaster",
    ),
    TraitModel(
      traiName: "Improved Initiative",
      levelAcquired: 1,
      traiDescription: "+4 bonus on initiative checks",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Dodge",
      levelAcquired: 1,
      traiDescription: "+1 dodge bonus to AC",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Toughness",
      levelAcquired: 1,
      traiDescription: "+3 hit points, +1 per Hit Die beyond 3",
      isSelected: false,
    ),
  ];
}
