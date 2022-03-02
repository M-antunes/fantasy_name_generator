import 'package:fantasy_name_generator/models/key_value.model.dart';
import 'package:fantasy_name_generator/models/race_model.dart';

class RaceData {
  List<RaceModel> races = [
    RaceModel(
      name: 'Human',
      isSelected: true,
      traits: [
        KeyValueModel(
            key: "+2 to One Ability Score:",
            value:
                "A +2 bonus will be automatically applied to the main atribute used by the class chosen."),
        KeyValueModel(
            key: "Medium:",
            value:
                "Humans are Medium creatures and have no bonuses or penalties due to their size."),
        KeyValueModel(
            key: "Normal Speed:",
            value: "Humans have a base speed of 30 feet."),
        KeyValueModel(
            key: "Bonus Feat:",
            value:
                "One bonus feat will be automatically applied to this character depending on the class chosen."),
        KeyValueModel(
            key: "Skilled:",
            value:
                "Humans gain an additional skill rank at first level and one additional rank whenever they gain a level."),
      ],
    ),
    RaceModel(
      name: 'Orc',
      isSelected: false,
      traits: [
        KeyValueModel(
            key: "+4 to Strength:",
            value:
                "Orcs are really strong, but they lack mental capacities. -2 in all mental abillity scores."),
        KeyValueModel(
            key: "Medium:",
            value:
                "Orcs are Medium creatures and have no bonuses or penalties due to their size."),
        KeyValueModel(
            key: "Normal Speed:", value: "Orcs have a base speed of 30 feet."),
        KeyValueModel(
            key: "Darkvision:",
            value: "Orcs can see in the dark up to 60 feet."),
        KeyValueModel(
            key: "Intimidating:",
            value:
                "Orcs receive a +2 racial bonus on Intimidate skill checks due to their fearsome nature."),
        KeyValueModel(
            key: "Orc Blood:",
            value:
                "Orcs count as both humans and orcs for any effect related to race."),
        KeyValueModel(
            key: "Orc Ferocity:",
            value:
                "Once per day, when a half-orc is brought below 0 hit points but not killed, he can fight on for one more round as if disabled. At the end of his next turn, unless brought to above 0 hit points, he immediately falls unconscious and begins dying."),
      ],
    ),
    RaceModel(name: 'Elf', isSelected: false, traits: [
      KeyValueModel(
          key: "+2 Dexterity, +2 Intelligence, –2 Constitution:",
          value:
              "Elves are nimble, both in body and mind, but their form is frail."),
      KeyValueModel(
          key: "Medium:",
          value:
              "Elves are Medium creatures and have no bonuses or penalties due to their size."),
      KeyValueModel(
          key: "Normal Speed:", value: "Elves have a base speed of 30 feet."),
      KeyValueModel(
          key: "Low-Light Vision:",
          value:
              "Elves can see twice as far as humans in conditions of dim light. See Additional Rules."),
      KeyValueModel(
          key: "Elven Immunities:",
          value:
              "lves are immune to magic sleep effects and get a +2 racial saving throw bonus against enchantment spells and effects."),
      KeyValueModel(
          key: "Elven Magic",
          value:
              "Elves receive a +2 racial bonus on caster level checks made to overcome spell resistance. In addition, elves receive a +2 racial bonus on Spellcraft skill checks made to identify the properties of magic items."),
      KeyValueModel(
          key: "Keen Senses",
          value: "Elves receive a +2 racial bonus on Perception skill checks."),
    ]),
    RaceModel(name: 'Dwarf', isSelected: false, traits: [
      KeyValueModel(
          key: '+2 Constitution, +2 Wisdom, –2 Charisma:',
          value: "Dwarves are both tough and wise, but also a bit gruff."),
      KeyValueModel(
          key: 'Medium:',
          value:
              "Dwarves are Medium creatures and have no bonuses or penalties due to their size."),
      KeyValueModel(
          key: 'Slow and Steady:',
          value:
              "Dwarves have a base speed of 20 feet, but their speed is never modified by armor or encumbrance."),
      KeyValueModel(
          key: 'Darkvision:',
          value: "Dwarves can see in the dark up to 60 feet."),
      KeyValueModel(
          key: 'Defensive Training:',
          value:
              "Dwarves get a +4 dodge bonus to AC against monsters of the giant subtype."),
      KeyValueModel(
          key: 'Greed:',
          value:
              "Dwarves receive a +2 racial bonus on Appraise skill checks made to determine the price of nonmagical goods that contain precious metals or gemstones."),
      KeyValueModel(
          key: 'Hatred:',
          value:
              "Dwarves receive a +1 bonus on attack rolls against humanoid creatures of the orc and goblinoid subtypes due to special training against these hated foes."),
      KeyValueModel(
          key: 'Hardy:',
          value:
              "Dwarves receive a +2 racial bonus on saving throws against poison, spells, and spell-like abilities."),
      KeyValueModel(
          key: 'Stability:',
          value:
              "Dwarves receive a +4 racial bonus to their Combat Maneuver Defense when resisting a bull rush or trip attempt while standing on the ground."),
    ]),
    RaceModel(name: 'Gnome', isSelected: false, traits: [
      KeyValueModel(
          key: "+2 Constitution, +2 Charisma, –2 Strength:",
          value:
              "Gnomes are physically weak but surprisingly hardy, and their attitude makes them naturally agreeable."),
      KeyValueModel(
          key: "Small:",
          value:
              "Gnomes are Small creatures and gain a +1 size bonus to their AC, a +1 size bonus on attack rolls, a –1 penalty to their Combat Maneuver Bonus and Combat Maneuver Defense, and a +4 size bonus on Stealth checks."),
      KeyValueModel(
          key: "Slow Speed:", value: "Gnomes have a base speed of 20 feet."),
      KeyValueModel(
          key: "Low-Light Vision:",
          value:
              "Gnomes can see twice as far as humans in conditions of dim light. See Additional Rules."),
      KeyValueModel(
          key: "Keen Senses:",
          value:
              "Gnomes receive a +2 racial bonus on Perception skill checks."),
      KeyValueModel(
          key: "Defensive Training:",
          value:
              "Gnomes get a +4 dodge bonus to AC against monsters of the giant type."),
      KeyValueModel(
          key: "Gnome Magic:",
          value:
              "Gnomes add +1 to the DC of any saving throws against illusion spells that they cast. Gnomes with a Charisma of 11 or higher also gain the following spell-like abilities: 1/day—dancing lights, ghost sound, prestidigitation, and speak with animals. The caster level for these effects is equal to the gnome's level. The DC for these spells is equal to 10 + the spell's level + the gnome's Charisma modifier."),
      KeyValueModel(
          key: "Hatred:",
          value:
              " Gnomes receive a +1 bonus on attack rolls against humanoid creatures of the reptilian and goblinoid subtypes due to special training against these hated foes."),
      KeyValueModel(
          key: "Illusion Resistance::",
          value:
              "Gnomes get a +2 racial saving throw bonus against illusion spells or effects."),
    ]),
    RaceModel(name: 'Hafling', isSelected: false, traits: [
      KeyValueModel(
          key: "+2 Dexterity, +2 Charisma, –2 Strength:",
          value:
              "Halflings are nimble and strong-willed, but their small stature makes them weaker than other races."),
      KeyValueModel(
          key: "Small:",
          value:
              "Halflings are Small creatures and gain a +1 size bonus to their AC, a +1 size bonus on attack rolls, a –1 penalty to their Combat Maneuver Bonus and Combat Maneuver Defense, and a +4 size bonus on Stealth checks."),
      KeyValueModel(
          key: "Halfling Luck:",
          value: "Halflings receive a +1 racial bonus on all saving throws."),
      KeyValueModel(
          key: "Slow Speed:", value: "Halflings have a base speed of 20 feet."),
      KeyValueModel(
          key: "Fearless:",
          value:
              "Halflings receive a +2 racial bonus on all saving throws against fear. This bonus stacks with the bonus granted by halfling luck."),
      KeyValueModel(
          key: "Keen Senses:",
          value:
              "Halflings receive a +2 racial bonus on Perception skill checks."),
      KeyValueModel(
          key: "Sure-Footed:",
          value:
              "Halflings receive a +2 racial bonus on Acrobatics and Climb skill checks."),
    ]),
  ];

  final List<KeyValueModel> humanTraits = [];
}
