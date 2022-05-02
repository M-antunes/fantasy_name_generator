import '../../../../../models/class_models/specials_model.dart';
import '../../../../../models/class_models/traits_model.dart';

class RogueTraitsData {
  final List<TraitModel> rogueTraits = [
    TraitModel(
      isSelected: false,
      traiName: "Sneak attack",
      levelAcquired: 1,
      multiplier: 2,
      traiDescription:
          "If a rogue can catch an opponent when he is unable to defend himself effectively from her attack, she can strike a vital spot for extra damage. The rogue's attack deals extra damage anytime her target would be denied a Dexterity bonus to AC (whether the target actually has a Dexterity bonus or not), or when the rogue flanks her target. This extra damage is 1d6 at 1st level, and increases by 1d6 every two rogue levels thereafter. Should the rogue score a critical hit with a sneak attack, this extra damage is not multiplied. Ranged attacks can count as sneak attacks only if the target is within 30 feet. With a weapon that deals nonlethal damage (like a sap, whip, or an unarmed strike), a rogue can make a sneak attack that deals nonlethal damage instead of lethal damage. She cannot use a weapon that deals lethal damage to deal nonlethal damage in a sneak attack, not even with the usual –4 penalty. The rogue must be able to see the target well enough to pick out a vital spot and must be able to reach such a spot. A rogue cannot sneak attack while striking a creature with concealment.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Trapfinding",
      levelAcquired: 1,
      traiDescription:
          "A rogue adds 1/2 her level to Perception skill checks made to locate traps and to Disable Device skill checks (minimum +1). A rogue can use Disable Device to disarm magic traps.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Evasion",
      levelAcquired: 2,
      traiDescription:
          "At 2nd level and higher, a rogue can avoid even magical and unusual attacks with great agility. If she makes a successful Reflex saving throw against an attack that normally deals half damage on a successful save, she instead takes no damage. Evasion can be used only if the rogue is wearing light armor or no armor. A helpless rogue does not gain the benefit of evasion.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Rogue Talents",
      levelAcquired: 2,
      multiplier: 2,
      traiDescription:
          " As a rogue gains experience, she learns a number of talents that aid her and confound her foes. Starting at 2nd level, a rogue gains one rogue talent. She gains an additional rogue talent for every 2 levels of rogue attained after 2nd level. A rogue cannot select an individual talent more than once. Talents marked with (sneak) add effects to a rogue's sneak attack. Only one of these talents can be applied to an individual attack and the decision must be made before the attack roll is made.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Trap Sense +",
      levelAcquired: 3,
      multiplier: 3,
      traiDescription:
          "At 3rd level, a rogue gains an intuitive sense that alerts her to danger from traps, giving her a +1 bonus on Reflex saves made to avoid traps and a +1 dodge bonus to AC against attacks made by traps. These bonuses rise to +2 when the rogue reaches 6th level, to +3 when she reaches 9th level, to +4 when she reaches 12th level, to +5 at 15th, and to +6 at 18th level.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Uncanny Dodge",
      levelAcquired: 4,
      traiDescription:
          "Starting at 4th level, a rogue can react to danger before her senses would normally allow her to do so. She cannot be caught flat-footed, nor does she lose her Dex bonus to AC if the attacker is invisible. She still loses her Dexterity bonus to AC if immobilized. A rogue with this ability can still lose her Dexterity bonus to AC if an opponent successfully uses the feint action (see Combat) against her.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Improved Uncanny Dodge",
      levelAcquired: 8,
      multiplier: 2,
      traiDescription:
          "A rogue of 8th level or higher can no longer be flanked. This defense denies another rogue the ability to sneak attack the character by flanking her, unless the attacker has at least four more rogue levels than the target does.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Advanced Talents",
      levelAcquired: 10,
      traiDescription: "More powerful talents",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Master Strike",
      levelAcquired: 20,
      multiplier: 2,
      traiDescription:
          "Upon reaching 20th level, a rogue becomes incredibly deadly when dealing sneak attack damage. Each time the rogue deals sneak attack damage, she can choose one of the following three effects: the target can be put to sleep for 1d4 hours, paralyzed for 2d6 rounds, or slain. Regardless of the effect chosen, the target receives a Fortitude save to negate the additional effect. The DC of this save is equal to 10 + 1/2 the rogue's level + the rogue's Intelligence modifier. Once a creature has been the target of a master strike, regardless of whether or not the save is made, that creature is immune to that rogue's master strike for 24 hours. Creatures that are immune to sneak attack damage are also immune to this ability.",
    ),
  ];

  List<SpecialsModel> rogueTalents = [
    SpecialsModel(
      isSelected: false,
      name: "Bleeding Attack (sneak)",
      levelAcquired: 1,
      description:
          "A rogue with this ability can cause living opponents to bleed by hitting them with a sneak attack. This attack causes the target to take 1 additional point of damage each round for each die of the rogue's sneak attack (e.g., 4d6 equals 4 points of bleed). Bleeding creatures take that amount of damage every round at the start of each of their turns. The bleeding can be stopped by a DC 15 Heal check or the application of any effect that heals hit point damage. Bleeding damage from this ability does not stack with itself. Bleeding damage bypasses any damage reduction the creature might possess.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Fast Stealth",
      levelAcquired: 1,
      description:
          "This ability allows a rogue to move at full speed using the Stealth skill without penalty.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Ledge Walker",
      levelAcquired: 1,
      description:
          "This ability allows a rogue to move along narrow surfaces at full speed using the Acrobatics skill without penalty. In addition, a rogue with this talent is not flat-footed when using Acrobatics to move along narrow surfaces.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Minor Magic",
      levelAcquired: 1,
      description:
          "A rogue with this talent gains the ability to cast a 0-level spell from the sorcerer/wizard spell list. This spell can be cast three times a day as a spell-like ability. The caster level for this ability is equal to the rogue's level. The save DC for this spell is 10 + the rogue's Intelligence modifier. The rogue must have an Intelligence of at least 10 to select this talent.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Major Magic",
      levelAcquired: 1,
      description:
          "A rogue with this talent gains the ability to cast a 1st-level spell from the sorcerer/wizard spell list two times a day as a spell-like ability. The caster level for this ability is equal to the rogue's level. The save DC for this spell is 11 + the rogue's Intelligence modifier. The rogue must have an Intelligence of at least 11 to select this talent. A rogue must have the minor magic rogue talent before choosing this talent.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Quick Disable",
      levelAcquired: 1,
      description:
          "It takes a rogue with this ability half the normal amount of time to disable a trap using the Disable Device skill (minimum 1 round).",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Resiliency",
      levelAcquired: 1,
      description:
          "Once per day, a rogue with this ability can gain a number of temporary hit points equal to the rogue's level. Activating this ability is an immediate action that can only be performed when she is brought to below 0 hit points. This ability can be used to prevent her from dying. These temporary hit points last for 1 minute. If the rogue's hit points drop below 0 due to the loss of these temporary hit points, she falls unconscious and is dying as normal.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Rogue Crawl",
      levelAcquired: 1,
      description:
          "While prone, a rogue with this ability can move at half speed. This movement provokes attacks of opportunity as normal. A rogue with this talent can take a 5-foot step while crawling.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Stand Up",
      levelAcquired: 1,
      description:
          "A rogue with this ability can stand up from a prone position as a free action. This still provokes attacks of opportunity for standing up while threatened by a foe.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Surprise Attack",
      levelAcquired: 1,
      description:
          "During the surprise round, opponents are always considered flat-footed to a rogue with this ability, even if they have already acted.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Trap Spotter",
      levelAcquired: 1,
      description:
          "Whenever a rogue with this talent comes within 10 feet of a trap, she receives an immediate Perception skill check to notice the trap. This check should be made in secret by the GM.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Slow Reactions (sneak)",
      levelAcquired: 1,
      description:
          "Opponents damaged by the rogue's sneak attack can't make attacks of opportunity for 1 round.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Crippling Strike (sneak)",
      levelAcquired: 10,
      description:
          "A rogue with this ability can sneak attack opponents with such precision that her blows weaken and hamper them. An opponent damaged by one of her sneak attacks also takes 2 points of Strength damage.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Defensive Roll",
      levelAcquired: 10,
      description:
          "With this advanced talent, the rogue can roll with a potentially lethal blow to take less damage from it than she otherwise would. Once per day, when she would be reduced to 0 or fewer hit points by damage in combat (from a weapon or other blow, not a spell or special ability), the rogue can attempt to roll with the damage. To use this ability, the rogue must attempt a Reflex saving throw (DC = damage dealt). If the save succeeds, she takes only half damage from the blow; if it fails, she takes full damage. She must be aware of the attack and able to react to it in order to execute her defensive roll—if she is denied her Dexterity bonus to AC, she can't use this ability. Since this effect would not normally allow a character to make a Reflex save for half damage, the rogue's evasion ability does not apply to the defensive roll.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Dispelling Attack (sneak)",
      levelAcquired: 10,
      description:
          "Opponents that are dealt sneak attack damage by a rogue with this ability are affected by a targeted dispel magic, targeting the lowest-level spell effect active on the target. The caster level for this ability is equal to the rogue's level. A rogue must have the major magic rogue talent before choosing dispelling attack.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Improved Evasion",
      levelAcquired: 10,
      description:
          " This works like evasion, except that while the rogue still takes no damage on a successful Reflex saving throw against attacks, she henceforth takes only half damage on a failed save. A helpless rogue does not gain the benefit of improved evasion.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Opportunist",
      levelAcquired: 10,
      description:
          "Once per round, the rogue can make an attack of opportunity against an opponent who has just been struck for damage in melee by another character. This attack counts as an attack of opportunity for that round. Even a rogue with the Combat Reflexes feat can't use the opportunist ability more than once per round.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Skill Mastery",
      levelAcquired: 10,
      description:
          "The rogue becomes so confident in the use of certain skills that she can use them reliably even under adverse conditions. Upon gaining this ability, she selects a number of skills equal to 3 + her Intelligence modifier. When making a skill check with one of these skills, she may take 10 even if stress and distractions would normally prevent her from doing so. A rogue may gain this special ability multiple times, selecting additional skills for skill mastery to apply to each time.",
    ),
    SpecialsModel(
      isSelected: false,
      name: "Slippery Mind",
      levelAcquired: 10,
      description:
          " This ability represents the rogue's ability to wriggle free from magical effects that would otherwise control or compel her. If a rogue with slippery mind is affected by an enchantment spell or effect and fails her saving throw, she can attempt it again 1 round later at the same DC. She gets only this one extra chance to succeed on her saving throw.",
    ),
  ];
}
