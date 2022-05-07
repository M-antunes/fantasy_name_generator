import 'package:fantasy_name_generator/models/spell_models/school_of_magic_model.dart';

class SchoolOfMagicData {
  List<SchoolOfMagicModel> listOfSchools = [
    SchoolOfMagicModel(
      name: "Abjuration",
      svg: "assets/images/magic_schools/abjuration.svg",
      description:
          "Abjurations are protective spells. They create physical or magical barriers, negate magical or physical abilities, harm trespassers, or even banish the subject of the spell to another plane of existence.",
      isSelected: false,
    ),
    SchoolOfMagicModel(
      name: "Conjuration",
      svg: "assets/images/magic_schools/conjuration.svg",
      description:
          "Each conjuration spell belongs to one of five subschools. Conjurations transport creatures from another plane of existence to your plane (calling); create objects or effects on the spot (creation); heal (healing); bring manifestations of objects, creatures, or forms of energy to you (summoning); or transport creatures or objects over great distances (teleportation). Creatures you conjure usually—but not always—obey your commands. A creature or object brought into being or transported to your location by a conjuration spell cannot appear inside another creature or object, nor can it appear floating in an empty space. It must arrive in an open location on a surface capable of supporting it. The creature or object must appear within the spell's range, but it does not have to remain within the range.",
      isSelected: false,
    ),
    SchoolOfMagicModel(
      name: "Divination",
      svg: "assets/images/magic_schools/divination.svg",
      description:
          "Divination spells enable you to learn secrets long forgotten, predict the future, find hidden things, and foil deceptive spells. Many divination spells have cone-shaped areas. These move with you and extend in the direction you choose. The cone defines the area that you can sweep each round. If you study the same area for multiple rounds, you can often gain additional information, as noted in the descriptive text for the spell.",
      isSelected: false,
    ),
    SchoolOfMagicModel(
      name: "Enchantment",
      svg: "assets/images/magic_schools/enchantment.svg",
      description:
          "Enchantment spells affect the minds of others, influencing or controlling their behavior. All enchantments are mind-affecting spells. Two subschools of enchantment spells grant you influence over a subject creature.",
      isSelected: false,
    ),
    SchoolOfMagicModel(
      name: "Evocation",
      svg: "assets/images/magic_schools/evocation2.svg",
      description:
          "Evocation spells manipulate magical energy or tap an unseen source of power to produce a desired end. In effect, an evocation draws upon magic to create something out of nothing. Many of these spells produce spectacular effects, and evocation spells can deal large amounts of damage.",
      isSelected: false,
    ),
    SchoolOfMagicModel(
      name: "Illusion",
      svg: "assets/images/magic_schools/illusion.svg",
      description:
          "Illusion spells deceive the senses or minds of others. They cause people to see things that are not there, not see things that are there, hear phantom noises, or remember things that never happened.",
      isSelected: false,
    ),
    SchoolOfMagicModel(
      name: "Necromancy",
      svg: "assets/images/magic_schools/necromancy.svg",
      description:
          "Necromancy spells manipulate the power of death, unlife, and the life force. Spells involving undead creatures make up a large part of this school.",
      isSelected: false,
    ),
    SchoolOfMagicModel(
      name: "Transmutation",
      svg: "assets/images/magic_schools/transmutation.svg",
      description:
          "Transmutation spells change the properties of some creature, thing, or condition.",
      isSelected: false,
    ),
  ];
}
