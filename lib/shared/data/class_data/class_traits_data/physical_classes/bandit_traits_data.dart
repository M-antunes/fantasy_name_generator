import '../../../../../models/class_models/traits_model.dart';

class BanditTraitData {
  List<TraitModel> banditTraits = [
    TraitModel(
      isSelected: false,
      traiName: "Sneak attack",
      levelAcquired: 1,
      multiplier: 3,
      traiDescription:
          "If a bandit can catch an opponent when he is unable to defend himself effectively from her attack, she can strike a vital spot for extra damage. The bandit's attack deals extra damage anytime her target would be denied a Dexterity bonus to AC (whether the target actually has a Dexterity bonus or not), or when the bandit flanks her target. This extra damage is 1d6 at 1st level, and increases by 1d6 every three bandit levels thereafter. Should the bandit score a critical hit with a sneak attack, this extra damage is not multiplied. Ranged attacks can count as sneak attacks only if the target is within 30 feet. With a weapon that deals nonlethal damage (like a sap, whip, or an unarmed strike), a bandit can make a sneak attack that deals nonlethal damage instead of lethal damage. She cannot use a weapon that deals lethal damage to deal nonlethal damage in a sneak attack, not even with the usual –4 penalty. The bandit must be able to see the target well enough to pick out a vital spot and must be able to reach such a spot. A bandit cannot sneak attack while striking a creature with concealment.",
    ),
    TraitModel(
      traiName: "Favored prey",
      levelAcquired: 1,
      multiplier: 5,
      traiDescription:
          "At 1st level, a bandit gets a +2 bonus on Bluff, Knowledge, Perception, Sense Motive, and Survival checks against creatures of his selected type. Likewise, he gets a +2 bonus on weapon attack and damage rolls against them. A bandit may make Knowledge skill checks untrained when attempting to identify these creatures. At 5th level and every five levels thereafter (10th, 15th, and 20th level), the bandit gets an additional favored enemy. In addition, at each such interval, the bonus against any one favored enemy (including the one just selected, if so desired) increases by +2. If a specific creature falls into more than one category of favored enemy, the bandit's bonuses do not stack; he simply uses whichever bonus is higher.",
      isSelected: false,
    ),
    TraitModel(
      isSelected: false,
      traiName: "Fast movement",
      levelAcquired: 2,
      traiDescription:
          " A bandit's land speed is faster than the norm for her race by +10 feet. This benefit applies only when she is wearing no armor, light armor, or medium armor, and not carrying a heavy load. Apply this bonus before modifying the bandit's speed because of any load carried or armor worn. This bonus stacks with any other bonuses to the bandit's land speed.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Fast Stealth",
      levelAcquired: 3,
      traiDescription:
          "This ability allows a bandit to move at full speed using the Stealth skill without penalty.",
    ),
    TraitModel(
      traiName: "Favored terrain",
      levelAcquired: 3,
      multiplier: 5,
      traiDescription:
          "At 3rd level, a bandit gets a +2 bonus on initiative checks and Knowledge (geography), Perception, Stealth, and Survival skill checks when he is in this terrain. A bandit traveling through his favored terrain normally leaves no trail and cannot be tracked (though he may leave a trail if he so chooses). At 8th level and every five levels thereafter, the bandit gets an additional favored terrain. In addition, at each such interval, the skill bonus and initiative bonus in any one favored terrain (including the one just selected, if so desired), increases by +2. If a specific terrain falls into more than one category of favored terrain, the bandit's bonuses do not stack; he simply uses whichever bonus is higher.",
      isSelected: false,
    ),
    TraitModel(
      isSelected: false,
      traiName: "Uncanny dodge",
      levelAcquired: 4,
      traiDescription:
          "At 2nd level, a bandit gains the ability to react to danger before her senses would normally allow her to do so. She cannot be caught flat-footed, nor does she lose her Dexterity bonus to AC if the attacker is invisible. She still loses her Dexterity bonus to AC if immobilized. A bandit with this ability can still lose her Dexterity bonus to AC if an opponent successfully uses the feint action against her.",
    ),
    TraitModel(
      traiName: "Camouflage",
      levelAcquired: 6,
      traiDescription:
          "A bandit of 6th level or higher can use the Stealth skill to hide in any of his favored terrains, even if the terrain doesn't grant cover or concealment.",
      isSelected: false,
    ),
    TraitModel(
      isSelected: false,
      traiName: "Bleeding Attack",
      levelAcquired: 8,
      traiDescription:
          "A bandit with this ability can cause living opponents to bleed by hitting them with a sneak attack. This attack causes the target to take 1 additional point of damage each round for each die of the bandit's sneak attack (e.g., 4d6 equals 4 points of bleed). Bleeding creatures take that amount of damage every round at the start of each of their turns. The bleeding can be stopped by a DC 15 Heal check or the application of any effect that heals hit point damage. Bleeding damage from this ability does not stack with itself. Bleeding damage bypasses any damage reduction the creature might possess.",
    ),
  ];
}
