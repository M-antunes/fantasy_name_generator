import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';

class PaladinTraitsData {
  List<TraitModel> paladinTraits = [
    TraitModel(
      traiName: "Code of Conduct",
      levelAcquired: 1,
      traiDescription:
          "A paladin must be of lawful good alignment and loses all class features except proficiencies if she ever willingly commits an evil act. Additionally, a paladin's code requires that she respect legitimate authority, act with honor (not lying, not cheating, not using poison, and so forth), help those in need (provided they do not use the help for evil or chaotic ends), and punish those who harm or threaten innocents.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Associations",
      levelAcquired: 1,
      traiDescription:
          "While she may adventure with good or neutral allies, a paladin avoids working with evil characters or with anyone who consistently offends her moral code. Under exceptional circumstances, a paladin can ally with evil associates, but only to defeat what she believes to be a greater evil. A paladin should seek an atonement spell periodically during such an unusual alliance, and should end the alliance immediately should she feel it is doing more harm than good. A paladin may accept only henchmen, followers, or cohorts who are lawful good.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Aura of Good",
      levelAcquired: 1,
      traiDescription:
          "The power of a paladin's aura of good (see the detect good spell) is equal to her paladin level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Detect Evil",
      levelAcquired: 1,
      traiDescription:
          "At will, a paladin can use detect evil, as the spell. A paladin can, as a move action, concentrate on a single item or individual within 60 feet and determine if it is evil, learning the strength of its aura as if having studied it for 3 rounds. While focusing on one individual or object, the paladin does not detect evil in any other object or individual within range.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Smite Evil",
      levelAcquired: 1,
      multiplier: 3,
      traiDescription:
          "Once per day, a paladin can call out to the powers of good to aid her in her struggle against evil. As a swift action, the paladin chooses one target within sight to smite. If this target is evil, the paladin adds her Charisma bonus (if any) to her attack rolls and adds her paladin level to all damage rolls made against the target of her smite. If the target of smite evil is an outsider with the evil subtype, an evil-aligned dragon, or an undead creature, the bonus to damage on the first successful attack increases to 2 points of damage per level the paladin possesses. Regardless of the target, smite evil attacks automatically bypass any DR the creature might possess. In addition, while smite evil is in effect, the paladin gains a deflection bonus equal to her Charisma modifier (if any) to her AC against attacks made by the target of the smite. If the paladin targets a creature that is not evil, the smite is wasted with no effect. The smite evil effect remains until the target of the smite is dead or the next time the paladin rests and regains her uses of this ability. At 4th level, and at every three levels thereafter, the paladin may smite evil one additional time per day, as indicated on Table: Paladin, to a maximum of seven times per day at 19th level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Divine Grace",
      levelAcquired: 2,
      traiDescription:
          "At 2nd level, a paladin gains a bonus equal to her Charisma bonus (if any) on all saving throws.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Lay On Hands",
      levelAcquired: 2,
      traiDescription:
          "Beginning at 2nd level, a paladin can heal wounds (her own or those of others) by touch. Each day she can use this ability a number of times equal to 1/2 her paladin level plus her Charisma modifier. With one use of this ability, a paladin can heal 1d6 hit points of damage for every two paladin levels she possesses. Using this ability is a standard action, unless the paladin targets herself, in which case it is a swift action. Despite the name of this ability, a paladin only needs one free hand to use this ability. Alternatively, a paladin can use this healing power to deal damage to undead creatures, dealing 1d6 points of damage for every two levels the paladin possesses. Using lay on hands in this way requires a successful melee touch attack and doesn't provoke an attack of opportunity. Undead do not receive a saving throw against this damage.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Aura of Courage",
      levelAcquired: 3,
      traiDescription:
          "At 3rd level, a paladin is immune to fear (magical or otherwise). Each ally within 10 feet of her gains a +4 morale bonus on saving throws against fear effects. This ability functions only while the paladin is conscious, not if she is unconscious or dead.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Divine Health",
      levelAcquired: 3,
      traiDescription:
          "At 3rd level, a paladin is immune to all diseases, including supernatural and magical diseases, including mummy rot.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Mercy",
      levelAcquired: 3,
      multiplier: 3,
      traiDescription:
          "At 3rd level, and every three levels thereafter, a paladin can select one mercy. Each mercy adds an effect to the paladin's lay on hands ability. Whenever the paladin uses lay on hands to heal damage to one target, the target also receives the additional effects from all of the mercies possessed by the paladin. A mercy can remove a condition caused by a curse, disease, or poison without curing the affliction. Such conditions return after 1 hour unless the mercy actually removes the affliction that causes the condition. At 3rd level, the paladin can select from the following initial mercies:\n• Fatigued: The target is no longer fatigued.\n• Shaken: The target is no longer shaken.\n• Sickened: The target is no longer sickened.\nAt 6th level, a paladin adds the following mercies to the list of those that can be selected.\n• Dazed: The target is no longer dazed.\n• Diseased: The paladin's lay on hands ability also acts as remove disease, using the paladin's level as the caster level.\n• Staggered: The target is no longer staggered, unless the target is at exactly 0 hit points.\nAt 9th level, a paladin adds the following mercies to the list of those that can be selected.\n• Cursed: The paladin's lay on hands ability also acts as remove curse, using the paladin's level as the caster level.\n• Exhausted: The target is no longer exhausted. The paladin must have the fatigue mercy before selecting this mercy.\n• Frightened: The target is no longer frightened. The paladin must have the shaken mercy before selecting this mercy.\n• Nauseated: The target is no longer nauseated. The paladin must have the sickened mercy before selecting this mercy.\n• Poisoned: The paladin's lay on hands ability also acts as neutralize poison, using the paladin's level as the caster level.\nAt 12th level, a paladin adds the following mercies to the list of those that can be selected.\n• Blinded: The target is no longer blinded.\n• Deafened: The target is no longer deafened.\n• Paralyzed: The target is no longer paralyzed.\n• Stunned: The target is no longer stunned.\nThese abilities are cumulative.\nFor example, a 12th-level paladin's lay on hands ability heals 6d6 points of damage and might also cure fatigued and exhausted conditions as well as removing diseases and neutralizing poisons. Once a condition or spell effect is chosen, it can't be changed.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Channel Positive Energy",
      levelAcquired: 4,
      traiDescription:
          "When a paladin reaches 4th level, she gains the supernatural ability to channel positive energy like a cleric. Using this ability consumes two uses of her lay on hands ability. A paladin uses her level as her effective cleric level when channeling positive energy. This is a Charisma-based ability.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Spells",
      levelAcquired: 4,
      traiDescription: "Paladin can cast spells beginning at 4th level",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Divine Bond",
      levelAcquired: 5,
      traiDescription:
          "Upon reaching 5th level, a paladin forms a divine bond with her god. This bond can take one of two forms. Once the form is chosen, it cannot be changed. The first type of bond allows the paladin to enhance her weapon as a standard action by calling upon the aid of a celestial spirit for 1 minute per paladin level. When called, the spirit causes the weapon to shed light as a torch. At 5th level, this spirit grants the weapon a +1 enhancement bonus. For every three levels beyond 5th, the weapon gains another +1 enhancement bonus, to a maximum of +6 at 20th level. These bonuses can be added to the weapon, stacking with existing weapon bonuses to a maximum of +5, or they can be used to add any of the following weapon properties: axiomatic, brilliant energy, defending, disruption, flaming, flaming burst, holy, keen, merciful, and speed. Adding these properties consumes an amount of bonus equal to the property's cost (see Table: Melee Weapon Special Abilities). These bonuses are added to any properties the weapon already has, but duplicate abilities do not stack. If the weapon is not magical, at least a +1 enhancement bonus must be added before any other properties can be added. The bonus and properties granted by the spirit are determined when the spirit is called and cannot be changed until the spirit is called again. The celestial spirit imparts no bonuses if the weapon is held by anyone other than the paladin but resumes giving bonuses if returned to the paladin. These bonuses apply to only one end of a double weapon. A paladin can use this ability once per day at 5th level, and one additional time per day for every four levels beyond 5th, to a total of four times per day at 17th level. If a weapon bonded with a celestial spirit is destroyed, the paladin loses the use of this ability for 30 days, or until she gains a level, whichever comes first. During this 30-day period, the paladin takes a –1 penalty on attack and weapon damage rolls. The second type of bond allows a paladin to gain the service of an unusually intelligent, strong, and loyal steed to serve her in her crusade against evil. This mount is usually a heavy horse (for a Medium paladin) or a pony (for a Small paladin), although more exotic mounts, such as a boar, camel, or dog are also suitable. This mount functions as a druid's animal companion, using the paladin's level as her effective druid level. Bonded mounts have an Intelligence of at least 6. Once per day, as a full-round action, a paladin may magically call her mount to her side. This ability is the equivalent of a spell of a level equal to one-third the paladin's level. The mount immediately appears adjacent to the paladin. A paladin can use this ability once per day at 5th level, and one additional time per day for every 4 levels thereafter, for a total of four times per day at 17th level. At 11th level, the mount gains the celestial template and becomes a magical beast for the purposes of determining which spells affect it. At 15th level, a paladin's mount gains spell resistance equal to the paladin's level + 11. Should the paladin's mount die, the paladin may not summon another mount for 30 days or until she gains a paladin level, whichever comes first. During this 30-day period, the paladin takes a –1 penalty on attack and weapon damage rolls.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Aura of Resolve",
      levelAcquired: 8,
      traiDescription:
          "At 8th level, a paladin is immune to charm spells and spell-like abilities. Each ally within 10 feet of her gains a +4 morale bonus on saving throws against charm effects.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Aura of Justice",
      levelAcquired: 11,
      traiDescription:
          "At 11th level, a paladin can expend two uses of her smite evil ability to grant the ability to smite evil to all allies within 10 feet, using her bonuses. Allies must use this smite evil ability by the start of the paladin's next turn and the bonuses last for 1 minute. Using this ability is a free action. Evil creatures gain no benefit from this ability.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Aura of Faith",
      levelAcquired: 14,
      traiDescription:
          "At 14th level, a paladin's weapons are treated as good-aligned for the purposes of overcoming damage reduction. Any attack made against an enemy within 10 feet of her is treated as good-aligned for the purposes of overcoming damage reduction. This ability functions only while the paladin is conscious, not if she is unconscious or dead.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Aura of Righteousness",
      levelAcquired: 17,
      traiDescription:
          "At 17th level, a paladin gains DR 5/evil and immunity to compulsion spells and spell-like abilities. Each ally within 10 feet of her gains a +4 morale bonus on saving throws against compulsion effects. This ability functions only while the paladin is conscious, not if she is unconscious or dead.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Holy Champion",
      levelAcquired: 1,
      traiDescription:
          "At 20th level, a paladin becomes a conduit for the power of her god. Her DR increases to 10/evil. Whenever she uses smite evil and successfully strikes an evil outsider, the outsider is also subject to a banishment, using her paladin level as the caster level (her weapon and holy symbol automatically count as objects that the subject hates). After the banishment effect and the damage from the attack is resolved, the smite immediately ends. In addition, whenever she channels positive energy or uses lay on hands to heal a creature, she heals the maximum possible amount.",
      isSelected: false,
    ),
  ];
}
