import '../../../../../models/class_models/traits_model.dart';

class WarriorTraitsData {
  final List<TraitModel> warriorTraits = [
    TraitModel(
      isSelected: false,
      traiName: "Bonus feat",
      levelAcquired: 1,
      multiplier: 2,
      traiDescription:
          "At 1st level, and at every even level thereafter, a fighter gains a bonus feat in addition to those gained from normal advancement (meaning that the fighter gains a feat at every level). These bonus feats must be selected from those listed as combat feats, sometimes also called 'fighter bonus feats.' Upon reaching 4th level, and every four levels thereafter (8th, 12th, and so on), a fighter can choose to learn a new bonus feat in place of a bonus feat he has already learned. In effect, the fighter loses the bonus feat in exchange for the new one. The old feat cannot be one that was used as a prerequisite for another feat, prestige class, or other ability. A fighter can only change one feat at any given level and must choose whether or not to swap the feat at the time he gains a new bonus feat for the level.",
    ),
    TraitModel(
        isSelected: false,
        traiName: "Bravery +",
        levelAcquired: 2,
        multiplier: 4,
        traiDescription:
            "Starting at 2nd level, a fighter gains a +1 bonus on Will saves against fear. This bonus increases by +1 for every four levels beyond 2nd."),
    TraitModel(
      isSelected: false,
      traiName: "Armor training",
      levelAcquired: 3,
      multiplier: 4,
      traiDescription:
          "Starting at 3rd level, a fighter learns to be more maneuverable while wearing armor. Whenever he is wearing armor, he reduces the armor check penalty by 1 (to a minimum of 0) and increases the maximum Dexterity bonus allowed by his armor by 1. Every four levels thereafter (7th, 11th, and 15th), these bonuses increase by +1 each time, to a maximum –4 reduction of the armor check penalty and a +4 increase of the maximum Dexterity bonus allowed. In addition, a fighter can also move at his normal speed while wearing medium armor. At 7th level, a fighter can move at his normal speed while wearing heavy armor.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Weapon training",
      levelAcquired: 5,
      multiplier: 4,
      traiDescription:
          "Starting at 5th level, a fighter can select one group of weapons. Whenever he attacks with a weapon from this group, he gains a +1 bonus on attack and damage rolls. Every four levels thereafter (9th, 13th, and 17th), a fighter becomes further trained in another group of weapons. He gains a +1 bonus on attack and damage rolls when using a weapon from this group.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Armor mastery",
      levelAcquired: 19,
      traiDescription:
          "At 19th level, a fighter gains DR 5/— whenever he is wearing armor or using a shield.",
    ),
    TraitModel(
      isSelected: false,
      traiName: "Weapon mastery",
      levelAcquired: 20,
      traiDescription:
          "At 20th level, a fighter chooses one weapon, such as the longsword, greataxe, or longbow. Any attacks made with that weapon automatically confirm all critical threats and have their damage multiplier increased by 1 (×2 becomes ×3, for example). In addition, he cannot be disarmed while wielding a weapon of this type.",
    ),
  ];
}
