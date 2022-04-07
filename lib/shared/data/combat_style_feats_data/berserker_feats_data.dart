import 'package:fantasy_name_generator/models/traits_model.dart';

class FeatsData {
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
      traiDescription: "",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Critical Focus",
      levelAcquired: 9,
      traiDescription: "+4 bonus on attack rolls made to confirm critical hits",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Greater Weapon Specialization",
      levelAcquired: 12,
      traiDescription: "",
      isSelected: false,
    ),
    TraitModel(
      traiName: "Iron Will",
      levelAcquired: 1,
      traiDescription: "+2 bonus on Will saves",
      isSelected: false,
    ),
  ];
}
