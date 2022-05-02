import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';

class AntipaladinTraitData {
  List<TraitModel> antipaladinTraits = [
    TraitModel(
      traiName: "Association",
      levelAcquired: 1,
      traiDescription:
          " While he may adventure with evil or neutral allies, an antipaladin avoids working with good characters or with anyone who consistently attempts to do good deeds. Under exceptional circumstances, an antipaladin can ally with good associates, but only to defeat them from within and bring ruin to their ranks. An antipaladin does not need an atonement spell during such an unusual alliance as long as his nefarious goals are met in the end—evil cares only about results. An antipaladin may accept only henchmen, followers, or cohorts who are chaotic evil.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Code of Conduct",
      levelAcquired: 1,
      traiDescription:
          "An antipaladin must be of chaotic evil alignment and loses all class features except proficiencies if he willingly and altruistically commits good acts. This does not mean that an antipaladin cannot take actions someone else might qualify as good, only that such actions must always be in service of his own dark ends. An antipaladin's code requires that he place his own interests and desires above all else, as well as impose tyranny, take advantage whenever possible, and punish the good and just, provided such actions don't interfere with his goals.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Aura of Evil",
      levelAcquired: 1,
      traiDescription:
          "The power of an antipaladin's aura of evil (see the detect evilspell) is equal to his antipaladin level. A paladin who uses smite evil on an antipaladin deals 2 points of damage per paladin level on his first successful attack.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Detect Good",
      levelAcquired: 1,
      traiDescription:
          "At will, an antipaladin can use detect good, as the spell. An antipaladin can, as a move action, concentrate on a single item or individual within 60 feet and determine if it is good, learning the strength of its aura as if having studied it for 3 rounds. While focusing on one individual or object, the antipaladin does not detect good in any other object or individual within range.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Smite Good",
      levelAcquired: 1,
      multiplier: 3,
      traiDescription:
          "Once per day, an antipaladin can call out to the dark powers to crush the forces of good. As a swift action, the antipaladin chooses one target within sight to smite. If this target is good, the antipaladin adds his Charisma bonus (if any) on his attack rolls and adds his antipaladin level on all damage rolls made against the target of his smite. If the target of smite good is an outsider with the good subtype, a good-aligned dragon, or a good creature with levels of cleric or paladin, the bonus to damage on the first successful attack increases to 2 points of damage per level the antipaladin possesses. Regardless of the target, smite good attacks automatically bypass any DR the creature might possess. In addition, while smite good is in effect, the antipaladin gains a deflection bonus equal to his Charisma modifier (if any) to his AC against attacks made by the target of the smite. If the antipaladin targets a creature that is not good, the smite is wasted with no effect. The smite good effect remains until the target of the smite is dead or the next time the antipaladin rests and regains his uses of this ability. At 4th level, and at every three levels thereafter, the antipaladin may smite good one additional time per day, as indicated on Table 2–13, to a maximum of seven times per day at 19th level.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Unholy Resilience",
      levelAcquired: 2,
      traiDescription:
          "At 2nd level, an antipaladin gains a bonus equal to his Charisma bonus (if any) on all saving throws.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Touch of Corruption",
      levelAcquired: 2,
      traiDescription:
          "Beginning at 2nd level, an antipaladin surrounds his hand with a fiendish flame, causing terrible wounds to open on those he touches. Each day he can use this ability a number of times equal to 1/2 his antipaladin level + his Charisma modifier. As a touch attack, an antipaladin can cause 1d6 points of damage for every two antipaladin levels he possesses. Using this ability is a standard action that does not provoke attacks of opportunity. Alternatively, an antipaladin can use this power to heal undead creatures, restoring 1d6 hit points for every two levels the antipaladin possesses. This ability is modified by any feat, spell, or effect that specifically works with the lay on hands paladin class feature. For example, the Extra Lay On Hands feat grants an antipaladin 2 additional uses of the touch of corruption class feature.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Aura of Cowardice",
      levelAcquired: 3,
      traiDescription:
          "At 3rd level, an antipaladin radiates a palpably daunting aura that causes all enemies within 10 feet to take a –4 penalty on saving throws against fear effects. Creatures that are normally immune to fear lose that immunity while within 10 feet of an antipaladin with this ability. This ability functions only while the antipaladin remains conscious, not if he is unconscious or dead.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Plague Bringer",
      levelAcquired: 3,
      traiDescription:
          "At 3rd level, the powers of darkness make an antipaladin a beacon of corruption and disease. An antipaladin does not take any damage or take any penalty from diseases. He can still contract diseases and spread them to others, but he is otherwise immune to their effects.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Cruelty",
      levelAcquired: 3,
      traiDescription:
          "At 3rd level, and every three levels thereafter, an antipaladin can select one cruelty. Each cruelty adds an effect to the antipaladin's touch of corruption ability. Whenever the antipaladin uses touch of corruption to deal damage to one target, the target also receives the additional effect from one of the cruelties possessed by the antipaladin. This choice is made when the touch is used. The target receives a Fortitude save to avoid this cruelty. If the save is successful, the target takes the damage as normal, but not the effects of the cruelty. The DC of this save is equal to 10 + 1/2 the antipaladin's level + the antipaladin's Charisma modifier. At 3rd level, the antipaladin can select from the following initial cruelties:\n• Fatigued: The target is fatigued.\n• Shaken: The target is shaken for 1 round per level of the antipaladin.\n• Sickened: The target is sickened for 1 round per level of the antipaladin.\n• At 6th level, an antipaladin adds the following cruelties to the list of those that can be selected.\n •Dazed: The target is dazed for 1 round.\n• Diseased: The target contracts a disease, as if the antipaladin had cast contagion, using his antipaladin level as his caster level.\n •Staggered: The target is staggered for 1 round per two levels of the antipaladin.\nAt 9th level, an antipaladin adds the following cruelties to the list of those that can be selected:\n• Cursed: The target is cursed, as if the antipaladin had cast bestow curse, using his antipaladin level as his caster level.\n• Exhausted: The target is exhausted. The antipaladin must have the fatigue cruelty before selecting this cruelty.\n• Frightened: The target is frightened for 1 round per two levels of the antipaladin. The antipaladin must have the shaken cruelty before selecting this cruelty.\n• Nauseated: The target is nauseated for 1 round per three levels of the antipaladin. The antipaladin must have the sickened cruelty before selecting this cruelty.\n• Poisoned: The target is poisoned, as if the antipaladin had cast poison, using the antipaladin's level as the caster level.\nAt 12th level, an antipaladin adds the following cruelties to the list of those that can be selected:\n• Blinded: The target is blinded for 1 round per level of the antipaladin.\n• Deafened: The target is deafened for 1 round per level of the antipaladin.\n• Paralyzed: The target is paralyzed for 1 round.\n •Stunned: The target is stunned for 1 round per four levels of the antipaladin.\n• These abilities are not cumulative.\nFor example, a 12th-level antipaladin's touch of corruption ability deals 6d6 points of damage and might also cause the target to become fatigued, dazed, poisoned, or diseased. Once a cruelty is chosen, it can't be changed.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Channel Negative Energy",
      levelAcquired: 4,
      traiDescription:
          "When an antipaladin reaches 4th level, he gains the supernatural ability to channel negative energy like a cleric. Using this ability consumes two uses of his touch of corruption ability. An antipaladin uses his level as his effective cleric level when channeling negative energy. This is a Charisma-based ability.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Spells",
      levelAcquired: 4,
      traiDescription: "Antipaladin can cast spells beginning at 4th level",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Fiendish Boon",
      levelAcquired: 5,
      traiDescription:
          "Upon reaching 5th level, an antipaladin receives a boon from his dark patrons. This boon can take one of two forms. Once the form is chosen, it cannot be changed. The first type of bond allows the antipaladin to enhance his weapon as a standard action by calling upon the aid of a fiendish spirit for 1 minute per antipaladin level. When called, the spirit causes the weapon to shed unholy light as a torch. At 5th level, this spirit grants the weapon a +1 enhancement bonus. For every three levels beyond 5th, the weapon gains another +1 enhancement bonus, to a maximum of +6 at 20th level. These bonuses can be added to the weapon, stacking with existing weapon bonuses to a maximum of +5, or they can be used to add any of the following weapon properties: anarchic, flaming, flaming burst, keen, speed, unholy, vicious, vorpal, and wounding. Adding these properties consumes an amount of bonus equal to the property's cost. These bonuses are added to any properties the weapon already has, but duplicate abilities do not stack. If the weapon is not magical, at least a +1 enhancement bonus must be added before any other properties can be added. The bonus and properties granted by the spirit are determined when the spirit is called and cannot be changed until the spirit is called again. The fiendish spirit imparts no bonuses if the weapon is held by anyone other than the antipaladin but resumes giving bonuses if returned to the antipaladin. These bonuses apply to only one end of a double weapon. An antipaladin can use this ability once per day at 5th level, and one additional time per day for every four levels beyond 5th, to a total of four times per day at 17th level. If a weapon bonded with a fiendish spirit is destroyed, the antipaladin loses the use of this ability for 30 days, or until he gains a level, whichever comes first. During this 30-day period, the antipaladin takes a –1 penalty on attack and weapon damage rolls. The second type of bond allows an antipaladin to gain the service of a fiendish servant. This functions as summon monster III, except the duration is permanent and the antipaladin can only gain the service of a single creature and that creature must either have the chaotic and evil subtypes or it must be a fiendish animal. Once selected, the choice is set, but it may be changed whenever the antipaladin gains a level. Upon reaching 7th level, and every two levels thereafter, the level of the summon monster spell increases by one, to a maximum of summon monster IX at 17th level. Once per day, as a full-round action, an antipaladin may magically call his servant to his side. This ability is the equivalent of a spell of a level equal to one-third the antipaladin's level. The servant immediately appears adjacent to the antipaladin. An antipaladin can use this ability once per day at 5th level, and one additional time per day for every four levels thereafter, for a total of four times per day at 17th level. At 11th level, the servant gains the advanced template (see the Pathfinder RPG Bestiary). At 15th level, an antipaladin's servant gains spell resistance equal to the antipaladin's level + 11. Should the antipaladin's fiendish servant die or be banished, the antipaladin may not summon another servant for 30 days or until he gains an antipaladin level, whichever comes first. During this 30-day period, the antipaladin takes a –1 penalty on attack and weapon damage rolls.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Aura of Despair",
      levelAcquired: 8,
      traiDescription:
          "At 8th level, enemies within 10 feet of an antipaladin take a –2 penalty on all saving throws. This penalty does not stack with the penalty from aura of cowardice. This ability functions only while the antipaladin is conscious, not if he is unconscious or dead.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Aura of Vengeance",
      levelAcquired: 11,
      traiDescription:
          "At 11th level, an antipaladin can expend two uses of his smite good ability to grant the ability to smite good to all allies within 10 feet, using his bonuses. Allies must use this smite good ability by the start of the antipaladin's next turn and the bonuses last for 1 minute. Using this ability is a free action. Good creatures gain no benefit from this ability.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Aura of Sin",
      levelAcquired: 14,
      traiDescription:
          "At 14th level, an antipaladin's weapons are treated as evil-aligned for the purposes of overcoming damage reduction. Any attack made against an enemy within 10 feet of him is treated as evil-aligned for the purposes of overcoming damage reduction. This ability functions only while the antipaladin is conscious, not if he is unconscious or dead.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Aura of Depravity",
      levelAcquired: 17,
      traiDescription:
          "At 17th level, an antipaladin gains DR 5/good. Each enemy within 10 feet takes a –4 penalty on saving throws against compulsion effects. This ability functions only while the antipaladin is conscious, not if he is unconscious or dead.",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Unholy Champion",
      levelAcquired: 20,
      traiDescription:
          "At 20th level, an antipaladin becomes a conduit for the might of the dark powers. His DR increases to 10/good. Whenever he uses smite good and successfully strikes an good outsider, the outsider is also subject to a banishment, using his antipaladin level as the caster level (his weapon and unholy symbol automatically count as objects that the subject hates). After the banishment effect and the damage from the attack is resolved, the smite immediately ends. In addition, whenever he channels negative energy or uses touch of corruption to damage a creature, he deals the maximum possible amount.",
      isSelected: false,
    ),
  ];
}
