import 'package:fantasy_name_generator/models/class_models/traits_model.dart';

class AllFeatsData {
  TraitModel reactionary = TraitModel(
    traiName: "Reactionary (trait)",
    levelAcquired: 100,
    traiDescription: "You gain a +2 trait bonus on initiative checks.",
    isSelected: false,
  );
  List<TraitModel> combatFeats = [
    TraitModel(
      traiName: "Focused Shot",
      levelAcquired: 1,
      traiDescription:
          "Add Int modifier on damage rolls with bows or crossbows.",
      fitFor: "Bowman, Marksman",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Deadly Aim",
      levelAcquired: 1,
      traiDescription:
          "You can choose to take a –1 penalty on all ranged attack rolls to gain a +2 bonus on all ranged damage rolls. When your base attack bonus reaches +4, and every +4 thereafter, the penalty increases by –1 and the bonus to damage increases by +2. You must choose to use this feat before making an attack roll and its effects last until your next turn. The bonus damage does not apply to touch attacks or effects that do not deal hit point damage.",
      fitFor: "Bowman, Marksman, Thrower",
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
      traiName: "Nimble Moves",
      levelAcquired: 1,
      traiDescription: "Ignore 5 feet of difficult terrain when you move",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Bullseye Shot",
      levelAcquired: 1,
      traiDescription: "Gain +4 bonus on next ranged attack as a move action.",
      fitFor: "Bowman, Marksman",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Armor Focus",
      levelAcquired: 1,
      traiDescription: "Increase one type of armor's AC bonus by 1.",
      fitFor: "Berserker, Soldier, Swordman, Dual-wielder",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Initiative",
      levelAcquired: 1,
      traiDescription: "You get a +4 bonus on initiative checks.",
      fitFor: "all",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Quick Draw",
      levelAcquired: 1,
      fitFor: "all",
      traiDescription: "Draw weapon as a free action",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Step Up",
      levelAcquired: 1,
      traiDescription: "Take a 5-foot step as an immediate action",
      fitFor: "Berserker, Soldier, Swordman, Dual-wielder",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Vital Strike",
      levelAcquired: 1,
      traiDescription:
          "When you use the attack action, you can make one attack at your highest base attack bonus that deals additional damage. Roll the weapon's damage dice for the attack twice and add the results together before adding bonuses from Strength, weapon abilities (such as flaming), precision based damage, and other damage bonuses. These extra weapon damage dice are not multiplied on a critical hit, but are added to the total.",
      fitFor: "Berserker, Soldier, Swordman",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Blind-Fight",
      levelAcquired: 1,
      traiDescription:
          " In melee, every time you miss because of concealment (see Combat), you can reroll your miss chance percentile roll one time to see if you actually hit. An invisible attacker gets no advantages related to hitting you in melee. That is, you don't lose your Dexterity bonus to Armor Class, and the attacker doesn't get the usual +2 bonus for being invisible. The invisible attacker's bonuses do still apply for ranged attacks, however. You do not need to make Acrobatics skill checks to move at full speed while blinded.",
      fitFor: "Berserker, Soldier, Swordman, Dual-wielder, Knifeman",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Lunge",
      levelAcquired: 1,
      traiDescription:
          "You can increase the reach of your melee attacks by 5 feet until the end of your turn by taking a –2 penalty to your AC until your next turn. You must decide to use this ability before any attacks are made.",
      fitFor: "Berserker, Soldier, Swordman, Dual-wielder",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Great Cleave",
      levelAcquired: 1,
      traiDescription:
          "As a standard action, you can make a single attack at your full base attack bonus against a foe within reach. If you hit, you deal damage normally and can make an additional attack (using your full base attack bonus) against a foe that is adjacent to the previous foe and also within reach. If you hit, you can continue to make attacks against foes adjacent to the previous foe, so long as they are within your reach. You cannot attack an individual foe more than once during this attack action. When you use this feat, you take a –2 penalty to your Armor Class until your next turn.",
      fitFor: "Berserker, Soldier, Swordman",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Critical Focus",
      levelAcquired: 9,
      traiDescription: "+4 bonus on attack rolls made to confirm critical hits",
      fitFor: "all",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Improved Critical",
      levelAcquired: 1,
      traiDescription: "Double the threat range of one weapon",
      fitFor: "all",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Bleeding Critical",
      levelAcquired: 11,
      fitFor: "all",
      traiDescription:
          "Whenever you score a critical hit with a slashing or piercing weapon, your opponent takes 2d6 points of bleed damage (see Conditions) each round on his turn, in addition to the damage dealt by the critical hit. Bleed damage can be stopped by a DC 15 Heal skill check or through any magical healing. The effects of this feat stack.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Iron Will",
      fitFor: "all",
      levelAcquired: 1,
      traiDescription: "+2 bonus on Will saves",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Great Fortitude",
      fitFor: "all",
      levelAcquired: 1,
      traiDescription: "+2 bonus on fortitude saves",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Lightning Reflexes",
      fitFor: "all",
      levelAcquired: 1,
      traiDescription: "+2 bonus on reflex saves",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Critical Focus",
      fitFor: "all",
      levelAcquired: 9,
      traiDescription: "+4 bonus on attack rolls made to confirm critical hits",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Weapon Focus",
      levelAcquired: 8,
      fitFor: "all",
      traiDescription:
          "You gain a +1 bonus on all attack rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Weapon Specialization",
      levelAcquired: 12,
      fitFor: "all",
      traiDescription:
          "You gain a +2 bonus on all damage rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Toughness",
      levelAcquired: 1,
      traiDescription: "+3 hit points, +1 per Hit Die beyond 3",
      fitFor: "all",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Weapon Specialization",
      levelAcquired: 4,
      fitFor: "all",
      traiDescription:
          "You gain a +2 bonus on all damage rolls you make using the selected weapon.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Blinding Critical",
      levelAcquired: 1,
      fitFor: "all",
      traiDescription:
          "Whenever you score a critical hit, your opponent is permanently blinded. A successful Fortitude save reduces this to dazzled for 1d4 rounds. The DC of this Fortitude save is equal to 10 + your base attack bonus. This feat has no effect on creatures that do not rely on eyes for sight or creatures with more than two eyes (although multiple critical hits might cause blindness, at the GM's discretion). Blindness can be cured by heal, regeneration, remove blindness, or similar abilities.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Critical Mastery",
      levelAcquired: 8,
      fitFor: "all",
      traiDescription:
          "When you score a critical hit, you can apply the effects of two critical feats in addition to the damage dealt.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Deafening Critical",
      levelAcquired: 9,
      fitFor: "all",
      traiDescription:
          "Whenever you score a critical hit against an opponent, the victim is permanently deafened. A successful Fortitude save reduces the deafness to 1 round. The DC of this Fortitude save is equal to 10 + your base attack bonus. This feat has no effect on deaf creatures. This deafness can be cured by heal, regeneration, remove deafness, or a similar ability.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Sickening Critical",
      levelAcquired: 9,
      fitFor: "all",
      traiDescription:
          "Whenever you score a critical hit, your opponent becomes sickened for 1 minute. The effects of this feat do not stack. Additional hits instead add to the effect's duration.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Staggering Critical",
      levelAcquired: 9,
      fitFor: "all",
      traiDescription:
          "Whenever you score a critical hit, your opponent becomes staggered for 1d4+1 rounds. A successful Fortitude save reduces the duration to 1 round. The DC of this Fortitude save is equal to 10 + your base attack bonus. The effects of this feat do not stack. Additional hits instead add to the duration.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Stunning Critical",
      levelAcquired: 9,
      fitFor: "all",
      traiDescription:
          "You must declare that you are using this feat before you make your attack roll (thus, a failed attack roll ruins the attempt). Stunning Fist forces a foe damaged by your unarmed attack to make a Fortitude saving throw (DC 10 + 1/2 your character level + your Str modifier), in addition to dealing damage normally. A defender who fails this saving throw is stunned for 1 round (until just before your next turn). A stunned character drops everything held, can't take actions, loses any Dexterity bonus to AC, and takes a –2 penalty to AC. You may attempt a stunning attack once per day for every four levels you have attained (but see Special), and no more than once per round. Constructs, oozes, plants, undead, incorporeal creatures, and creatures immune to critical hits cannot be stunned.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Tiring Critical",
      levelAcquired: 9,
      fitFor: "all",
      traiDescription:
          "Whenever you score a critical hit, your opponent becomes fatigued. This feat has no additional effect on a fatigued or exhausted creature.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Exhausting Critical",
      levelAcquired: 9,
      fitFor: "all",
      traiDescription:
          "When you score a critical hit on a foe, your target immediately becomes exhausted. This feat has no effect on exhausted creatures.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Dodge",
      levelAcquired: 1,
      fitFor: "all",
      traiDescription: "+1 dodge bonus to AC",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Bodyguard",
      levelAcquired: 1,
      traiDescription:
          " When an adjacent ally is attacked, you may use an attack of opportunity to attempt the aid another action to improve your ally's AC. You may not use the aid another action to improve your ally's attack roll with this attack.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Furious Focus",
      levelAcquired: 1,
      traiDescription:
          "Do not take the Power Attack penalty on the first attack each round",
      isSelected: false,
    ),
    TraitModel(
        traiName: "Pushing Assault",
        levelAcquired: 1,
        traiDescription: "Push a foe back with a two-handed weapon",
        isSelected: false,
        fitFor: "Berserker"),
    TraitModel(
      traiName: "Stunning Assault",
      levelAcquired: 1,
      traiDescription:
          "You can choose to take a –5 penalty on all melee attack rolls and combat maneuver checks to stun targets you hit with your melee attacks for 1 round. A successful Fortitude save negates the effect. The DC of this save is 10 + your base attack bonus. You must choose to use this feat before making the attack roll, and its effects last until your next turn.",
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
  ];

  List<TraitModel> metamagicFeats = [
    TraitModel(
      traiName: "Bouncing Spell",
      levelAcquired: 1,
      traiDescription:
          "Whenever a bouncing spell targeting a single creature has no effect on its intended target (whether due to spell resistance or a successful saving throw) you may, as a swift action, redirect it to target another eligible creature within range. The redirected spell behaves in all ways as if its new target were the original target for the spell. Spells that affect a target in any way (including a lesser effect from a successful saving throw) may not be redirected in this manner. A bouncing spell uses up a spell slot one level higher than the spell's actual level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Dazing Spell",
      levelAcquired: 1,
      traiDescription:
          "You can modify a spell to daze a creature damaged by the spell. When a creature takes damage from this spell, they become dazed for a number of rounds equal to the original level of the spell. If the spell allows a saving throw, a successful save negates the daze effect. If the spell does not allow a save, the target can make a Will save to negate the daze effect. If the spell effect also causes the creature to become dazed, the duration of this metamagic effect is added to the duration of the spell. A dazing spell uses up a spell slot three levels higher than the spell's actual level. Spells that do not inflict damage do not benefit from this feat.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Disruptive Spell",
      levelAcquired: 1,
      traiDescription:
          "Targets affected by a disruptive spell must make concentration checks when using spells or spell-like abilities (DC equals the save DC of the disruptive spell plus the level of the spell being cast) for 1 round. Targets that avoid the spell's effects avoid this feat's effect as well. A disruptive spell uses up a spell slot one level higher than the spell's actual level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Ectoplasmic Spell",
      levelAcquired: 1,
      traiDescription:
          "An ectoplasmic spell has full effect against incorporeal or ethereal creatures. An ectoplasmic spell uses up a spell slot one level higher than the spell's actual level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Elemental Spell",
      levelAcquired: 1,
      traiDescription:
          "Choose one energy type: acid, cold, electricity, or fire. You may replace a spell's normal damage with that energy type or split the spell's damage, so that half is of that energy type and half is of its normal type. An elemental spell uses up a spell slot one level higher than the spell's actual level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Focused Spell",
      levelAcquired: 1,
      traiDescription:
          "When casting a spell that affects or targets more than one creature, you can choose one target or creature within the spell effect. That creature's saving throw DC to resist the spell is increased by +2. You must choose which target to focus the spell on before casting the spell. A focused spell uses up a spell slot one level higher than the spell's actual level. Spells that do not require a saving throw to resist or lessen the spell's effect do not benefit from this feat.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Intensified Spell",
      levelAcquired: 1,
      traiDescription:
          " An intensified spell increases the maximum number of damage dice by 5 levels. You must actually have sufficient caster levels to surpass the maximum in order to benefit from this feat. No other variables of the spell are affected, and spells that inflict damage that is not modified by caster level are not affected by this feat. An intensified spell uses up a spell slot one level higher than the spell's actual level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Lingering Spell",
      levelAcquired: 1,
      traiDescription:
          " You may cause an instantaneous spell that affects an area to persist until the beginning of your next turn. Those already in the area suffer no additional harm, but other creatures or objects entering the area are subject to its effects. A lingering spell with a visual manifestation obscures vision, providing concealment (20% miss chance) beyond 5 feet and total concealment (50% miss chance) beyond 20 feet. A lingering spell uses up a spell slot one level higher than the spell's actual level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Merciful Spell",
      levelAcquired: 1,
      traiDescription:
          " You can alter spells that inflict damage to inflict nonlethal damage instead. Spells that inflict damage of a particular type (such as fire) inflict nonlethal damage of that same type. A merciful spell does not use up a higher-level spell slot than the spell's actual level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Persistent Spell",
      levelAcquired: 1,
      traiDescription:
          " Whenever a creature targeted by a persistent spell or within its area succeeds on its saving throw against the spell, it must make another saving throw against the effect. If a creature fails this second saving throw, it suffers the full effects of the spell, as if it had failed its first saving throw. A persistent spell uses up a spell slot two levels higher than the spell's actual level. Spells that do not require a saving throw to resist or lessen the spell's effect do not benefit from this feat.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Reach Spell",
      levelAcquired: 1,
      traiDescription:
          " You can alter a spell with a range of touch, close, or medium to increase its range to a higher range category, using the following order: touch, close, medium, and long. A reach spell uses up a spell slot one level higher than the spell's actual level for each increase in range category. For example, a spell with a range of touch increased to long range uses up a spell slot three levels higher. Spells modified by this feat that require melee touch attacks instead require ranged touch attacks. Spells that do not have a range of touch, close, or medium do not benefit from this feat.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Selective Spell",
      levelAcquired: 1,
      traiDescription:
          " When casting a selective spell with an area effect and a duration of instantaneous, you can choose a number of targets in the area equal to the ability score modifier used to determine bonus spells of the same type (Charisma for bards, oracles, paladins, sorcerers, and summoners; Intelligence for witches and wizards; Wisdom for clerics, druids, inquisitors, and rangers). These targets are excluded from the effects of your spell. A selective spell uses up a spell slot one level higher than the spell's actual level. Spells that do not have an area of effect or a duration of instantaneous do not benefit from this feat.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Sickening Spell",
      levelAcquired: 1,
      traiDescription:
          " You can modify a spell to sicken a creature damaged by the spell. When a creature takes damage from this spell, they become sickened for a number of rounds equal to the original level of the spell. If the spell allows a saving throw, a successful save negates the sickening effect. If the spell does not allow a save, the target can make a Fortitude save to negate the sickening effect. If the spell effect also causes the creature to become sickened, the duration of this metamagic effect is added on to the duration of the spell. A sickening spell uses up a spell slot two levels higher than the spell's actual level. Spells that do not inflict damage do not benefit from this feat.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Thundering Spell",
      levelAcquired: 1,
      traiDescription:
          "You can modify a spell to deafen a creature damaged by the spell. When a creature takes damage from this spell, it becomes deafened for a number of rounds equal to the original level of the spell. If the spell allows a saving throw, a successful save negates the deafening effect. If the spell does not allow a save, the target can make a Fortitude save to negate the deafening effect. If the spell effect also causes the creature to become deafened, the duration of this metamagic effect is added to the duration of the spell. A thundering spell uses up a spell slot two levels higher than the spell's actual level. Spells that do not inflict damage do not benefit from this feat.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Empower Spell",
      levelAcquired: 1,
      traiDescription:
          " All variable, numeric effects of an empowered spell are increased by half, including bonuses to those dice rolls. Saving throws and opposed rolls are not affected, nor are spells without random variables. An empowered spell uses up a spell slot two levels higher than the spell's actual level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Enlarge Spell",
      levelAcquired: 1,
      traiDescription:
          "You can alter a spell with a range of close, medium, or long to increase its range by 100%. An enlarged spell with a range of close now has a range of 50 ft. + 5 ft./level, while medium-range spells have a range of 200 ft. + 20 ft./level and long-range spells have a range of 800 ft. + 80 ft./level. An enlarged spell uses up a spell slot one level higher than the spell's actual level. Spells whose ranges are not defined by distance, as well as spells whose ranges are not close, medium, or long, do not benefit from this feat.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Extend Spell",
      levelAcquired: 1,
      traiDescription:
          "An extended spell lasts twice as long as normal. A spell with a duration of concentration, instantaneous, or permanent is not affected by this feat. An extended spell uses up a spell slot one level higher than the spell's actual level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Heighten Spell",
      levelAcquired: 1,
      traiDescription:
          "A heightened spell has a higher spell level than normal (up to a maximum of 9th level). Unlike other metamagic feats, Heighten Spell actually increases the effective level of the spell that it modifies. All effects dependent on spell level (such as saving throw DCs and ability to penetrate a lesser globe of invulnerability) are calculated according to the heightened level. The heightened spell is as difficult to prepare and cast as a spell of its effective level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Maximize Spell",
      levelAcquired: 1,
      traiDescription:
          "All variable, numeric effects of a spell modified by this feat are maximized. Saving throws and opposed rolls are not affected, nor are spells without random variables. A maximized spell uses up a spell slot three levels higher than the spell's actual level. An empowered, maximized spell gains the separate benefits of each feat: the maximum result plus half the normally rolled result.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Quicken Spell",
      levelAcquired: 1,
      traiDescription:
          " Casting a quickened spell is a swift action. You can perform another action, even casting another spell, in the same round as you cast a quickened spell. A spell whose casting time is more than 1 round or 1 full-round action cannot be quickened. A quickened spell uses up a spell slot four levels higher than the spell's actual level. Casting a quickened spell doesn't provoke an attack of opportunity. Special: You can apply the effects of this feat to a spell cast spontaneously, so long as it has a casting time that is not more than 1 full-round action, without increasing the spell's casting time.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Silent Spell",
      levelAcquired: 1,
      traiDescription:
          " silent spell can be cast with no verbal components. Spells without verbal components are not affected. A silent spell uses up a spell slot one level higher than the spell's actual level. Special: Bard spells cannot be enhanced by this feat.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Still Spell",
      levelAcquired: 1,
      traiDescription:
          " A stilled spell can be cast with no somatic components. Spells without somatic components are not affected. A stilled spell uses up a spell slot one level higher than the spell's actual level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Widen Spell",
      levelAcquired: 1,
      traiDescription:
          " You can alter a burst, emanation, or spread-shaped spell to increase its area. Any numeric measurements of the spell's area increase by 100%. A widened spell uses up a spell slot three levels higher than the spell's actual level. Spells that do not have an area of one of these four sorts are not affected by this feat.",
      isSelected: false,
    ),
  ];
}
