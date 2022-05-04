import 'package:fantasy_name_generator/models/equip_models/magic_equip_models/wonderous_items_model.dart';

class WonderousItemsData {
  final List<WonderousItemsModel> protRings = [
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of protection +1",
      availability: 2,
      exclusiveClasses: [],
      description:
          "This ring offers continual magical protection in the form of a deflection bonus of +1 to AC.",
      bonus: 1,
      price: 2000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of protection +2",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This ring offers continual magical protection in the form of a deflection bonus of +2 to AC.",
      bonus: 2,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of protection +3",
      availability: 9,
      exclusiveClasses: [],
      description:
          "This ring offers continual magical protection in the form of a deflection bonus of +3 to AC.",
      bonus: 3,
      price: 18000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of protection +4",
      availability: 13,
      exclusiveClasses: [],
      description:
          "This ring offers continual magical protection in the form of a deflection bonus of +4 to AC.",
      bonus: 4,
      price: 32000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of protection +5",
      availability: 16,
      exclusiveClasses: [],
      description:
          "This ring offers continual magical protection in the form of a deflection bonus of +5 to AC.",
      bonus: 5,
      price: 50000,
    ),
  ];

  final List<WonderousItemsModel> resistCloaks = [
    WonderousItemsModel(
      type: "Cloak",
      name: "Cloak of resistance +1",
      availability: 3,
      exclusiveClasses: [],
      description:
          "Flecks of silver or steel are often sown amid the fabric of these magical cloaks. This garment offers magical protection in the form of a +1 resistance bonus on all saving throws (Fortitude, Reflex, and Will).",
      bonus: 1,
      price: 1000,
    ),
    WonderousItemsModel(
      type: "Cloak",
      name: "Cloak of resistance +2",
      availability: 4,
      exclusiveClasses: [],
      description:
          "Flecks of silver or steel are often sown amid the fabric of these magical cloaks. This garment offers magical protection in the form of a +2 resistance bonus on all saving throws (Fortitude, Reflex, and Will).",
      bonus: 2,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Cloak",
      name: "Cloak of resistance +3",
      availability: 6,
      exclusiveClasses: [],
      description:
          "Flecks of silver or steel are often sown amid the fabric of these magical cloaks. This garment offers magical protection in the form of a +3 resistance bonus on all saving throws (Fortitude, Reflex, and Will).",
      bonus: 3,
      price: 9000,
    ),
    WonderousItemsModel(
      type: "Cloak",
      name: "Cloak of resistance +4",
      availability: 8,
      exclusiveClasses: [],
      description:
          "Flecks of silver or steel are often sown amid the fabric of these magical cloaks. This garment offers magical protection in the form of a +4 resistance bonus on all saving throws (Fortitude, Reflex, and Will).",
      bonus: 4,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Cloak",
      name: "Cloak of resistance +5",
      availability: 10,
      exclusiveClasses: [],
      description:
          "Flecks of silver or steel are often sown amid the fabric of these magical cloaks. This garment offers magical protection in the form of a +5 resistance bonus on all saving throws (Fortitude, Reflex, and Will).",
      bonus: 5,
      price: 25000,
    ),
  ];

  final List<WonderousItemsModel> amuletOfArmor = [
    WonderousItemsModel(
      type: "Neck",
      name: "Amulet of natural armor +1",
      availability: 4,
      exclusiveClasses: [],
      description:
          "This amulet, usually containing some type of magically preserved monster hide or other natural armor—such as bone, horn, carapace, or beast scales—toughens the wearer's body and flesh, giving him an +1 bonus to his natural armor",
      bonus: 1,
      price: 2000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Amulet of natural armor +2",
      availability: 7,
      exclusiveClasses: [],
      description:
          "This amulet, usually containing some type of magically preserved monster hide or other natural armor—such as bone, horn, carapace, or beast scales—toughens the wearer's body and flesh, giving him an +2 bonus to his natural armor",
      bonus: 2,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Amulet of natural armor +3",
      availability: 10,
      exclusiveClasses: [],
      description:
          "This amulet, usually containing some type of magically preserved monster hide or other natural armor—such as bone, horn, carapace, or beast scales—toughens the wearer's body and flesh, giving him an +3 bonus to his natural armor",
      bonus: 3,
      price: 18000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Amulet of natural armor +4",
      availability: 13,
      exclusiveClasses: [],
      description:
          "This amulet, usually containing some type of magically preserved monster hide or other natural armor—such as bone, horn, carapace, or beast scales—toughens the wearer's body and flesh, giving him an +4 bonus to his natural armor",
      bonus: 4,
      price: 32000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Amulet of natural armor +5",
      availability: 16,
      exclusiveClasses: [],
      description:
          "This amulet, usually containing some type of magically preserved monster hide or other natural armor—such as bone, horn, carapace, or beast scales—toughens the wearer's body and flesh, giving him an +5 bonus to his natural armor",
      bonus: 5,
      price: 50000,
    ),
  ];

  final List<WonderousItemsModel> amuletMightyFists = [
    WonderousItemsModel(
      type: "Neck",
      name: "Amulet of mighty fists +1",
      availability: 4,
      exclusiveClasses: ["Monk"],
      description:
          "This amulet grants an enhancement bonus of +1 on attack and damage rolls with unarmed attacks and natural weapons.",
      bonus: 1,
      price: 5000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Amulet of mighty fists +2",
      availability: 8,
      exclusiveClasses: ["Monk"],
      description:
          "This amulet grants an enhancement bonus of +2 on attack and damage rolls with unarmed attacks and natural weapons.",
      bonus: 2,
      price: 20000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Amulet of mighty fists +3",
      availability: 12,
      exclusiveClasses: ["Monk"],
      description:
          "This amulet grants an enhancement bonus of +3 on attack and damage rolls with unarmed attacks and natural weapons.",
      bonus: 3,
      price: 45000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Amulet of mighty fists +4",
      availability: 15,
      exclusiveClasses: ["Monk"],
      description:
          "This amulet grants an enhancement bonus of +4 on attack and damage rolls with unarmed attacks and natural weapons.",
      bonus: 4,
      price: 80000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Amulet of mighty fists +5",
      availability: 18,
      exclusiveClasses: ["Monk"],
      description:
          "This amulet grants an enhancement bonus of +5 on attack and damage rolls with unarmed attacks and natural weapons.",
      bonus: 5,
      price: 125000,
    ),
  ];

  final List<WonderousItemsModel> basicIounStones = [
    WonderousItemsModel(
      type: "Slotless",
      name: "Ioun Stone (dusty rose)",
      availability: 5,
      exclusiveClasses: [],
      description: "+1 insight bonus to AC",
      bonus: 1,
      price: 5000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Ioun Stone (Deep red)",
      availability: 7,
      exclusiveClasses: [],
      description: "+2 enhancement bonus to Dexterity",
      bonus: 2,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Ioun Stone (Incandescent blue)",
      availability: 7,
      exclusiveClasses: [],
      description: "+2 enhancement bonus to Wisdom",
      bonus: 2,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Ioun Stone (Pale blue)",
      availability: 7,
      exclusiveClasses: [],
      description: "+2 enhancement bonus to Strength",
      bonus: 2,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Ioun Stone (Pink)",
      availability: 7,
      exclusiveClasses: [],
      description: "+2 enhancement bonus to Constitution",
      bonus: 2,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Ioun Stone (Pink and green)",
      availability: 7,
      exclusiveClasses: [],
      description: "+2 enhancement bonus to Charisma",
      bonus: 2,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Ioun Stone (Scarlet and blue)",
      availability: 7,
      exclusiveClasses: [],
      description: "+2 enhancement bonus to Intelligence",
      bonus: 2,
      price: 8000,
    ),
  ];

  final List<WonderousItemsModel> bracersOfArmor = [
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracers of armor +1",
      availability: 2,
      exclusiveClasses: [],
      description:
          "These items appear to be wrist or arm guards, sometimes etched with symbols of protection or depictions of vigilant-looking animals. Bracers of armor surround the wearer with an invisible but tangible field of force, granting him an armor bonus of +1, just as though he were wearing armor. Both bracers of armor must be worn for the magic to be effective.",
      bonus: 1,
      price: 1000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracers of armor +2",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These items appear to be wrist or arm guards, sometimes etched with symbols of protection or depictions of vigilant-looking animals. Bracers of armor surround the wearer with an invisible but tangible field of force, granting him an armor bonus of +2, just as though he were wearing armor. Both bracers of armor must be worn for the magic to be effective.",
      bonus: 2,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracers of armor +3",
      availability: 7,
      exclusiveClasses: [],
      description:
          "These items appear to be wrist or arm guards, sometimes etched with symbols of protection or depictions of vigilant-looking animals. Bracers of armor surround the wearer with an invisible but tangible field of force, granting him an armor bonus of +3, just as though he were wearing armor. Both bracers of armor must be worn for the magic to be effective.",
      bonus: 3,
      price: 9000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracers of armor +4",
      availability: 8,
      exclusiveClasses: [],
      description:
          "These items appear to be wrist or arm guards, sometimes etched with symbols of protection or depictions of vigilant-looking animals. Bracers of armor surround the wearer with an invisible but tangible field of force, granting him an armor bonus of +4, just as though he were wearing armor. Both bracers of armor must be worn for the magic to be effective.",
      bonus: 4,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracers of armor +5",
      availability: 10,
      exclusiveClasses: [],
      description:
          "These items appear to be wrist or arm guards, sometimes etched with symbols of protection or depictions of vigilant-looking animals. Bracers of armor surround the wearer with an invisible but tangible field of force, granting him an armor bonus of +5, just as though he were wearing armor. Both bracers of armor must be worn for the magic to be effective.",
      bonus: 5,
      price: 25000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracers of armor +6",
      availability: 13,
      exclusiveClasses: [],
      description:
          "These items appear to be wrist or arm guards, sometimes etched with symbols of protection or depictions of vigilant-looking animals. Bracers of armor surround the wearer with an invisible but tangible field of force, granting him an armor bonus of +6, just as though he were wearing armor. Both bracers of armor must be worn for the magic to be effective.",
      bonus: 6,
      price: 36000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracers of armor +7",
      availability: 15,
      exclusiveClasses: [],
      description:
          "These items appear to be wrist or arm guards, sometimes etched with symbols of protection or depictions of vigilant-looking animals. Bracers of armor surround the wearer with an invisible but tangible field of force, granting him an armor bonus of +7, just as though he were wearing armor. Both bracers of armor must be worn for the magic to be effective.",
      bonus: 7,
      price: 49000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracers of armor +8",
      availability: 17,
      exclusiveClasses: [],
      description:
          "These items appear to be wrist or arm guards, sometimes etched with symbols of protection or depictions of vigilant-looking animals. Bracers of armor surround the wearer with an invisible but tangible field of force, granting him an armor bonus of +8, just as though he were wearing armor. Both bracers of armor must be worn for the magic to be effective.",
      bonus: 8,
      price: 64000,
    ),
  ];

  final List<WonderousItemsModel> manualsAndTomes = [
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of bodily health +1",
      availability: 15,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +1 to her constitution score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 1,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of bodily health +2",
      availability: 18,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +2 to her constitution score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 2,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of bodily health +3",
      availability: 20,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +3 to her constitution score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 3,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of bodily health +4",
      availability: 21,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +4 to her constitution score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 4,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of bodily health +5",
      availability: 23,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +5 to her constitution score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 5,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of gainful exercise +1",
      availability: 15,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +1 to her strength score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 1,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of gainful exercise +2",
      availability: 18,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +2 to her strength score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 2,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of gainful exercise +3",
      availability: 20,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +3 to her strength score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 3,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of gainful exercise +4",
      availability: 21,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +4 to her strength score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 4,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of gainful exercise +5",
      availability: 23,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +5 to her strength score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 5,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of quickness of action +1",
      availability: 15,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +1 to her dexterity score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 1,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of quickness of action +2",
      availability: 18,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +2 to her dexterity score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 2,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of quickness of action +3",
      availability: 20,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +3 to her dexterity score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 3,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of quickness of action +4",
      availability: 21,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +4 to her dexterity score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 4,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Manual of quickness of action +5",
      availability: 23,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +5 to her dexterity score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 5,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of clear thought +1",
      availability: 15,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +1 to her intelligence score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 1,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of clear thought +2",
      availability: 18,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +2 to her intelligence score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 2,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of clear thought +3",
      availability: 20,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +3 to her intelligence score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 3,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of clear thought +4",
      availability: 21,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +4 to her intelligence score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 4,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of clear thought +5",
      availability: 23,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +5 to her intelligence score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 5,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of leadership and influence +1",
      availability: 15,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +1 to her charisma score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 1,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of leadership and influence +2",
      availability: 18,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +2 to her charisma score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 2,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of leadership and influence +3",
      availability: 20,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +3 to her charisma score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 3,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of leadership and influence +4",
      availability: 21,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +4 to her charisma score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 4,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of leadership and influence +5",
      availability: 23,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +5 to her charisma score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 5,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of understanding +1",
      availability: 15,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +1 to her wisdom score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 1,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of understanding +2",
      availability: 18,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +2 to her wisdom score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 2,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of understanding +3",
      availability: 20,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +3 to her wisdom score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 3,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of understanding +4",
      availability: 21,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +4 to her wisdom score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 4,
      price: null,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Tome of understanding +5",
      availability: 23,
      exclusiveClasses: [],
      description:
          "This thick tome contains exercise descriptions and diet suggestions, but entwined within the words is a powerful magical effect. If anyone reads this book, which takes a total of 48 hours over a minimum of 6 days, she gains an inherent bonus of +5 to her wisdom score. Once the book is read, the magic disappears from the pages and it becomes a normal book.",
      bonus: 5,
      price: null,
    ),
  ];

  final List<WonderousItemsModel> allItems = [
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of mighty constitution +2",
      availability: 5,
      exclusiveClasses: [],
      description:
          "(+2) bonus in constitution. Valid only 24 hours after the belt is first worn.",
      bonus: 2,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of mighty constitution +4",
      availability: 8,
      exclusiveClasses: [],
      description:
          "(+4) bonus in constitution. Valid only 24 hours after the belt is first worn.",
      bonus: 4,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of mighty constitution +6",
      availability: 12,
      exclusiveClasses: [],
      description:
          "(+6) bonus in constitution. Valid only 24 hours after the belt is first worn.",
      bonus: 6,
      price: 36000,
    ),
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of incredible dexterity +2",
      availability: 5,
      exclusiveClasses: [],
      description:
          "(+2) bonus in dexterity. Valid only 24 hours after the belt is first worn.",
      bonus: 2,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of incredible dexterity +4",
      availability: 8,
      exclusiveClasses: [],
      description:
          "(+4) bonus in dexterity. Valid only 24 hours after the belt is first worn.",
      bonus: 4,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of incredible dexterity +6",
      availability: 12,
      exclusiveClasses: [],
      description:
          "(+6) bonus in dexterity. Valid only 24 hours after the belt is first worn.",
      bonus: 6,
      price: 36000,
    ),
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of giant strength +2",
      availability: 5,
      exclusiveClasses: [],
      description:
          "(+2) bonus in strength. Valid only 24 hours after the belt is first worn.",
      bonus: 2,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of giant strength +4",
      availability: 8,
      exclusiveClasses: [],
      description:
          "(+4) bonus in strength. Valid only 24 hours after the belt is first worn.",
      bonus: 4,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of giant strength +6",
      availability: 12,
      exclusiveClasses: [],
      description:
          "(+6) bonus in strength. Valid only 24 hours after the belt is first worn.",
      bonus: 6,
      price: 36000,
    ),
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of physical might +2",
      availability: 11,
      exclusiveClasses: [],
      description:
          "(+2) bonus in two of the physical ability scores. Valid only 24 hours after the belt is first worn.",
      bonus: 2,
      price: 10000,
    ),
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of physical might +4",
      availability: 13,
      exclusiveClasses: [],
      description:
          "(+4) bonus in two of the physical ability scores. Valid only 24 hours after the belt is first worn.",
      bonus: 4,
      price: 40000,
    ),
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of physical might +6",
      availability: 15,
      exclusiveClasses: [],
      description:
          "(+6) bonus in two of the physical ability scores. Valid only 24 hours after the belt is first worn.",
      bonus: 6,
      price: 90000,
    ),
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of physical perfection +2",
      availability: 11,
      exclusiveClasses: [],
      description:
          "(+2) bonus in all physical ability scores. Valid only 24 hours after the belt is first worn.",
      bonus: 2,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of physical perfection +4",
      availability: 15,
      exclusiveClasses: [],
      description:
          "(+4) bonus in all physical ability scores. Valid only 24 hours after the belt is first worn.",
      bonus: 4,
      price: 64000,
    ),
    WonderousItemsModel(
      type: "Belt",
      name: "Belt of physical perfection +6",
      availability: 18,
      exclusiveClasses: [],
      description:
          "(+6) bonus in all physical ability scores. Valid only 24 hours after the belt is first worn.",
      bonus: 6,
      price: 144000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of alluring charisma +2",
      availability: 5,
      exclusiveClasses: [],
      description:
          "(+2) bonus in charisma. Valid only 24 hours after the Headband is first worn.",
      bonus: 2,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of alluring charisma +4",
      availability: 8,
      exclusiveClasses: [],
      description:
          "(+4) bonus in charisma. Valid only 24 hours after the Headband is first worn.",
      bonus: 4,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of alluring charisma +6",
      availability: 12,
      exclusiveClasses: [],
      description:
          "(+6) bonus in charisma. Valid only 24 hours after the Headband is first worn.",
      bonus: 6,
      price: 36000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of inspired wisdom +2",
      availability: 5,
      exclusiveClasses: [],
      description:
          "(+2) bonus in wisdom. Valid only 24 hours after the Headband is first worn.",
      bonus: 2,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of inspired wisdom +4",
      availability: 8,
      exclusiveClasses: [],
      description:
          "(+4) bonus in wisdom. Valid only 24 hours after the Headband is first worn.",
      bonus: 4,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of inspired wisdom +6",
      availability: 12,
      exclusiveClasses: [],
      description:
          "(+6) bonus in wisdom. Valid only 24 hours after the Headband is first worn.",
      bonus: 6,
      price: 36000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of vast intelligence +2",
      availability: 5,
      exclusiveClasses: [],
      description:
          "(+2) bonus in intelligence. Valid only 24 hours after the Headband is first worn.",
      bonus: 2,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of vast intelligence +4",
      availability: 8,
      exclusiveClasses: [],
      description:
          "(+4) bonus in intelligence. Valid only 24 hours after the Headband is first worn.",
      bonus: 4,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of vast intelligence +6",
      availability: 12,
      exclusiveClasses: [],
      description:
          "(+6) bonus in intelligence. Valid only 24 hours after the Headband is first worn.",
      bonus: 6,
      price: 36000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of mental prowess +2",
      availability: 9,
      exclusiveClasses: [],
      description:
          "(+2) bonus in two of the mental ability scores. Valid only 24 hours after the Headband is first worn.",
      bonus: 2,
      price: 10000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of mental prowess +4",
      availability: 13,
      exclusiveClasses: [],
      description:
          "(+4) bonus in two of the mental ability scores. Valid only 24 hours after the Headband is first worn.",
      bonus: 4,
      price: 40000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of mental prowess +6",
      availability: 15,
      exclusiveClasses: [],
      description:
          "(+6) bonus in two of the mental ability scores. Valid only 24 hours after the Headband is first worn.",
      bonus: 6,
      price: 90000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of mental superiority +2",
      availability: 9,
      exclusiveClasses: [],
      description:
          "(+2) bonus in all mental ability scores. Valid only 24 hours after the Headband is first worn.",
      bonus: 2,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of mental superiority +4",
      availability: 15,
      exclusiveClasses: [],
      description:
          "(+4) bonus in all mental ability scores. Valid only 24 hours after the Headband is first worn.",
      bonus: 4,
      price: 64000,
    ),
    WonderousItemsModel(
      type: "Headband",
      name: "Headband of mental superiority +6",
      availability: 18,
      exclusiveClasses: [],
      description:
          "(+6) bonus in all mental ability scores. Valid only 24 hours after the belt is first worn.",
      bonus: 6,
      price: 144000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Boots of the cat",
      availability: 5,
      exclusiveClasses: [],
      description:
          "The boot's wearer always takes the minimum possible damage from falls (as if the GM had rolled a 1 on each die of damage incurred by the fall) and at the end of a fall always lands on his feet.",
      bonus: null,
      price: 1000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Boots of the soft step",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These bronze-riveted boots have thick leather soles that compress and expand as you walk. This reduces the force of your footfalls, making you more difficult to detect with tremorsense. If you are walking at half speed, a creature with tremorsense can only sense you at half the usual distance. If you walk at one-quarter speed or slower, a creature with tremorsense cannot detect you at all.",
      bonus: null,
      price: 1500,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Bondbreaker's boots",
      availability: 6,
      exclusiveClasses: [],
      description:
          "These leather boots bear a knife motif worked into their durable blue leather. Three times per day, the wearer can speak a command word as a swift action, causing a serrated knife to fly from the boots and instantly slice through any nonmagical bond currently restraining the wearer. The knife conjured from bondbreaker’s boots can cut through brambles, ropes, tanglefoot bags, vines, webs, or any other similar nonmagical item restraining the wearer, but cannot help when the owner is actively restrained by a creature. Bondbreaker’s boots also cannot free the wearer if manacles or chains restrain her.",
      bonus: null,
      price: 1600,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Daredevil boots",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This pair of magical boots shimmers in vibrant shades of blazing red and burning orange when they are held up to the light. These boots allow the wearer to gain extra maneuverability while moving through hazardous areas. As a free action, the wearer can click her heels together to grant herself a +5 competence bonus on Acrobatics checks made to move through threatened squares or to move through an enemy's space without provoking attacks of opportunity for up to 10 rounds per day. The rounds do not need to be consecutive. Furthermore, anytime the wearer of the boots successfully moves though the space of an enemy without provoking an attack of opportunity, she gains a +1 bonus on attack rolls against that enemy until the end of her turn.",
      bonus: null,
      price: 1400,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Feather step slippers",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These fine silken slippers allow their wearer to ignore the adverse movement effects of difficult terrain as if subject to the feather step spell, including granting the ability to take 5-foot steps in difficult terrain.",
      bonus: null,
      price: 2000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Fungal slippers",
      availability: 6,
      exclusiveClasses: [],
      description:
          "As a swift action up to three times per day, the wearer can create fungi in every square through which she walks during her turn. The fungi in these squares count as difficult terrain. After 1 minute, most of the fungi disappear; those that remain provide no impediment.",
      bonus: null,
      price: 2000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Boots of the winterlands",
      availability: 5,
      exclusiveClasses: [],
      description:
          "The wearer of these boots is able to travel across snow at her normal speed, leaving no tracks. Additionally, the boots enable her to travel at normal speed across the slipperiest ice (horizontal surfaces only, not vertical or sharply slanted ones) without falling or slipping. Finally, boots of the winterlands warm the wearer, as if she were affected by an endure elements spell.",
      bonus: null,
      price: 2500,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Boots of elvenkind",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These soft boots are partially made out of living leaves and other natural materials. They enable the wearer to move nimbly about in virtually any surroundings, granting a +5 competence bonus on Acrobatics checks.",
      bonus: null,
      price: 2500,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Acrobat slippers",
      availability: 7,
      exclusiveClasses: [],
      description:
          "These supple gray leather slippers enable the wearer to keep his balance in precarious positions. The wearer retains his Dexterity bonus to AC when climbing, running, or using the Acrobatics skill to move on narrow surfaces or uneven ground without falling. In addition, the wearer gains a +2 competence bonus to CMD against trip maneuvers and on Reflex saves to avoid falling (including falling prone).",
      bonus: null,
      price: 3000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Boots of vaulting",
      availability: 7,
      exclusiveClasses: [],
      description:
          "The wearer of these suede boots ignores an additional 10 feet of falling distance when she successfully uses Acrobatics to soften a fall. Once per round as a free action, the wearer can use the boots to gain a +10 competence bonus on an Acrobatics check to jump, treating such jump as though she had a running start. The wearer also receives this +10 competence bonus on Acrobatics checks to avoid attacks of opportunity during the jump or to balance after landing. Using the boots in this fashion strains the lower body. If the wearer attempts a second such jump before at least 1 minute has passed, she must succeed at a Fortitude save with a DC equal to the DC of her second jump attempt or injure her legs. This injury reduces her speed by half for 24 hours, or until she is successfully treated with a DC 15 Heal check or at least 1 point of magical healing. The DC of the Fortitude save increases by 5 for each additional jump attempted until at least 1 minute passes between jumps.",
      bonus: null,
      price: 1000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Boots of the mire",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These soft leather boots confer several powers upon the wearer. First, he is granted the power to walk on water in swampy environments, provided the water is no deeper than 5 feet—this effectively lets him move through swampy terrain and mud at no cost to his speed. He leaves no tracks or other signs of his passage as long as he's in swampy terrain, and never becomes uncomfortable or wet from rain, fog, or other forms of non-freezing precipitation. Finally, the boots grant him a +2 resistance bonus on all Fortitude saves made against poison and disease.",
      bonus: null,
      price: 3500,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Sandals of quick reaction",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These supple leather sandals grant a burst of speed during times of duress. When the wearer acts during a surprise round, he can take a standard and a move action during the surprise round. If the wearer already has the ability to take a standard and a move action during the surprise round, he instead gains a +10 circumstance bonus to speed when acting during a surprise round.",
      bonus: null,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Slippers of cloudwalking",
      availability: 6,
      exclusiveClasses: [],
      description:
          "The wearer of these slippers may walk on air (as the spell air walk) for up to 10 minutes per day, which may be used in 1-minute increments and requires no action to activate. However, she may only walk on air within or on top of natural or magical mist or fog, including fog-like gases such as those created by acid fog, cloudkill, incendiary cloud, or stinking cloud. Walking on top of such clouds carries no danger for the wearer, but walking through the cloud has its normal effect.",
      bonus: null,
      price: 4500,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Slippers of spider climbing",
      availability: 5,
      exclusiveClasses: [],
      description:
          "When worn, a pair of these slippers enables movement on vertical surfaces or even upside down along ceilings, leaving the wearer's hands free. Her climb speed is 20 feet. Severely slippery surfaces—icy, oiled, or greased surfaces—make these slippers useless. The slippers can be used for 10 minutes per day, split up as the wearer chooses (minimum 1 minute per use).",
      bonus: 6,
      price: 4400,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Sandals of the lightest step",
      availability: 7,
      exclusiveClasses: [],
      description:
          "These soft leather sandals have soles that consist of a layer of purple velvet decorated with intricate gold stitching. When slipped onto the feet, they feel as weightless as air. In any round when the wearer has already moved at least 10 feet along the ground or another surface (not counting travel on a mount), these boots can be activated as a swift action to give the wearer the ability to walk on air (as the air walk spell) until the end of the round. If the wearer hasn’t reached a solid surface by the end of the round, she immediately falls back to the ground, taking any applicable falling damage. These sandals can be used up to 5 times per day, but no more often than once per minute.",
      bonus: null,
      price: 5000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Boots of striding and springing",
      availability: 7,
      exclusiveClasses: [],
      description:
          "These boots increase the wearer's base land speed by 10 feet. In addition to this striding ability (considered an enhancement bonus), these boots allow the wearer to make great leaps. She can jump with a +5 competence bonus on Acrobatics checks.",
      bonus: null,
      price: 5500,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Jungle boots",
      availability: 7,
      exclusiveClasses: [],
      description:
          "These soft leather boots grant the wearer the ability to move through normal undergrowth without hindrance as if she had the woodland stride ability.",
      bonus: null,
      price: 6000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Haunted shoes",
      availability: 7,
      exclusiveClasses: [],
      description:
          "Two times per day, the wearer of these shoes can call forth 1d4 spirit servants to aid her. The spirit servants are invisible, mindless, shapeless beings that act as servants summoned by the unseen servant spell. The spirits return to the shoes after 3 hours have passed. The wearer can choose to dismiss one or more of the spirit servants early. Once per day, the wearer can command the ghostly spirits inside her haunted shoes to emerge and swirl around her, making her difficult to target in combat. The wearer gains concealment (20% miss chance) for 3 minutes. The spirits cannot be harmed, but a true seeing spell ignores the concealment effect. The concealment effect cannot be activated while any of the spirits are currently being used as unseen servants.",
      bonus: null,
      price: 6480,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Jaunt boots",
      availability: 6,
      exclusiveClasses: [],
      description:
          "These stylish black leather boots are stitched with images of winding roads and trails through peaceful orchards. They can be worn up to mid-thigh, or have their cuffs turned down to make knee-high boots. Three times per day, on command for 1 round when the wearer makes a 5-foot step, he can move up to 15 feet. This movement does not provoke attacks of opportunity.",
      bonus: null,
      price: 7200,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Boots of levitation",
      availability: 8,
      exclusiveClasses: [],
      description:
          "These soft leather boots are incredibly light and comfortable, with thin soles reinforced by strips of tough hide that provide an unexpected amount of support and protection to the foot. On command, these boots allow the wearer to levitate as if she had cast levitate on herself.",
      bonus: null,
      price: 7500,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Boots of escape",
      availability: 6,
      exclusiveClasses: [],
      description:
          "These sturdy leather-soled cloth boots have straps at the ankles and calves to ensure a snug fit. Once per day, when the wearer of the boots is grappled, pinned, or entangled, she may transfer herself to any spot within 30 feet as if using a dimension door spell. A gnome wearing these boots may instead transfer herself up to 400 feet away.",
      bonus: null,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Earth root boots",
      availability: 7,
      exclusiveClasses: [],
      description:
          "The longer the wearer of these boots stays in one place—as long as that place is on solid ground—the harder it is to move her from that place. The wearer gains a cumulative +1 circumstance bonus to her CMD (maximum of +10) for each round she does not move from her space.",
      bonus: null,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Rootsense boots",
      availability: 9,
      exclusiveClasses: [],
      description:
          "Twigs sprout from these tall brown boots. On command, while the wearer is on the ground, ghostly roots grow from the boots’ soles into the ground, granting their wearer tremorsense 30 feet for as long the wearer remains on the ground in the same space. While the roots are active, the boots provide two additional benefits. When the wearer is the target of a bull rush or trip attempt, living roots momentarily sprout from the boots into the earth, granting the wearer a +4 bonus to CMD to resist the attempt. The wearer also benefits from the flexibility of a living willow branch, gaining a +4 circumstance bonus on combat maneuver or Escape Artist checks to escape a grapple or slip bonds.",
      bonus: null,
      price: 10000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Caltrop boots",
      availability: 7,
      exclusiveClasses: [],
      description:
          "These knee-high black leather boots have prominent and irregularly shaped heels which seem to bulge from the rest of the shoe. As a swift action, the boots' wearer can cause the boots to let loose a spray of caltrops through the back of the heels as he moves during the remainder of his round. These caltrops fill each square the wearer moves into during that round. Any creature, including the wearer, occupying or who steps into one of these squares suffers the normal effects of coming into contact with caltrops . Once produced, these caltrops remain in existence until removed from their square, at which point they immediately disappear. The shoes can be used for 10 rounds per day. These rounds need not be consecutive.",
      bonus: null,
      price: 10000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Tremor boots",
      availability: 7,
      exclusiveClasses: [],
      description:
          "These brown leather boots have a reinforced toe of steel with grooves along the soles, crafted to help the wearer pick up vibrations from the surrounding environment. These boots grant the wearer tremorsense 20 feet as long as he is standing on solid ground.",
      bonus: null,
      price: 10000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Bogstrider boots",
      availability: 8,
      exclusiveClasses: [],
      description:
          "These soft leather boots smell strongly of marsh gas, and leave faint wet prints behind even when they’re dry. Despite these aesthetic flaws, bogstrider boots are of great use in areas of swampy terrain. They provide the wearer the ability to move without penalty in squares of shallow or deep bog, and the DCs of Acrobatics checks attempted by the boots’ wearer are unchanged in squares of shallow bog. In addition, three times per day when the wearer takes a charge or withdraw action, she can increase her speed by 60 feet for 1 round.",
      bonus: null,
      price: 10000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Boots of the mastodon",
      availability: 8,
      exclusiveClasses: [],
      description:
          "These massive boots are made from mastodon hide. The boots are so large and cumbersome that their wearer takes a –2 penalty on Stealth checks, but gains a +2 enhancement bonus on overrun attempts and a +2 dodge bonus to AC while attempting an overrun combat maneuver. In addition, once per day the wearer can make a trample attack . Regardless of his actual size, the creature wearing the boots can trample creatures of size Large or smaller in his path. The trample attack deals 2d8+18 points of damage (Reflex DC 29 halves).",
      bonus: null,
      price: 10500,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Shoes of the lightning leaping",
      availability: 9,
      exclusiveClasses: [],
      description:
          "These short black shoes fit tightly around the wearer's feet and bear designs of leaping arcs of lightning and wild winds. Once per day on command, a creature wearing these boots can transform into lightning and move up to 50 feet in a straight line, re-materializing at the far end of the lightning bolt. Creatures in the path of the lightning take 6d6 points of electricity damage and objects take damage as per the lightning bolt spell. If the lightning strikes an object or barrier and fails to burst through it, the creature wearing the boots appears next to the impacted object and is staggered for 1 round. Movement while in lightning form does not provoke attacks of opportunity.",
      bonus: null,
      price: 10500,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Boots of speed",
      availability: 10,
      exclusiveClasses: [],
      description:
          "As a free action, the wearer of boots of speed can click her heels together, letting her act as though affected by a haste spell for up to 10 rounds each day. The haste effect's duration need not be consecutive rounds.",
      bonus: null,
      price: 12000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Verdant boots",
      availability: 8,
      exclusiveClasses: [],
      description:
          "The wearer of these boots can, on command three times per day, cause her current square to sprout a thick canopy of fruit-bearing or otherwise edible plants. These plants count as difficult terrain and grant cover to any Medium or smaller creature within the square. They also provide enough food to sustain two Medium creatures for 1 full day. While the plants can grow on surfaces that would not normally support vegetation such as a wooden floor or cave stone, they cannot sprout on surfaces explicitly hostile to vegetation. The plants are usually of a sort common to the terrain or climate of the area in which they were produced. They disappear after 24 hours or when completely harvested, whichever comes first.",
      bonus: null,
      price: 12000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Winged boots",
      availability: 8,
      exclusiveClasses: [],
      description:
          "These boots appear to be ordinary footgear. On command, they sprout wings at the heel and let the wearer fly, without having to maintain concentration, as if affected by a fly spell (including a +4 bonus on Fly skill checks). The wearer can fly three times per day for up to 5 minutes per flight.",
      bonus: null,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Shoes of the firewalker",
      availability: 9,
      exclusiveClasses: [],
      description:
          "These low-cut shoes of polished red leather feature golden eyelets and stitching in a fiery pattern. They grant the wearer fire resistance 10 and allow the wearer to walk atop lava and magma as if subject to the water walk spell.",
      bonus: null,
      price: 21000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Boots of teleportation",
      availability: 14,
      exclusiveClasses: [],
      description:
          "When scrutinized closely, parts of these light gray boots appear to fade in and out of existence. Any character wearing this footwear may teleport three times per day, exactly as if she had cast the teleport spell.",
      bonus: null,
      price: 49000,
    ),
    WonderousItemsModel(
      type: "Feet",
      name: "Slippers of the triton",
      availability: 12,
      exclusiveClasses: [],
      description:
          "These slippers allow the wearer to breathe water. Additionally, if the wearer has no swim speed, she gains a 30 foot swim speed. If the wearer has a swim speed, she gains a +10 foot enhancement bonus to her swim speed.",
      bonus: null,
      price: 56000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Brooch of shielding",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This appears to be a piece of silver or gold jewelry used to fasten a cloak or cape. In addition to this mundane task, it can absorb magic missiles of the sort generated by the spell or spell-like ability. A brooch can absorb up to 101 points of damage from magic missiles before it melts and becomes useless.",
      bonus: null,
      price: 1500,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Golembane scarab",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This beetle-shaped pin enables its wearer to detect any golem within 60 feet, although he must concentrate (a standard action) in order for the detection to take place. A scarab enables its bearer to combat golems with weapons, unarmed attacks, or natural weapons as if those golems had no damage reduction.",
      bonus: null,
      price: 2500,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Mind sentinel medallion",
      availability: 6,
      exclusiveClasses: [],
      description:
          "The surface of this silver medallion is covered in angular geometric shapes that refract light randomly. The medallion grants a continuous +2 resistance bonus on saves versus mind-affecting spells, spell-like abilities, and supernatural abilities. If the wearer fails a save to avoid becoming dominated or confused, the amulet immediately grants the wearer a second saving throw to resist the effect. If this second save is successful, the medallion's power fades away entirely and it becomes a simple piece of silver jewelry.",
      bonus: null,
      price: 3500,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Amulet of elemental strife",
      availability: 7,
      exclusiveClasses: [],
      description:
          "This amulet shines brightly when brought within 60 feet of an outsider with the elemental subtype, shedding light as a torch. The amulet glows a different color depending on the subtype of the elemental or elementals present (white for air, yellow for earth, red for fire, and blue for water). If more than one subtype is present, the gem flickers back and forth between the appropriate colors. The wearer gains resistance 5 against a single energy type determined by the subtype of the closest elemental present (air grants electricity resistance, earth grants acid resistance, fire grants fire resistance, and water grants cold resistance). If the closest elemental possesses multiple subtypes, the wearer may choose which type of resistance she gains. This energy resistance only applies against attacks from elementals. The amulet also allows any attacks made by the wearer to bypass the damage reduction of such creatures.",
      bonus: null,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Periapt of health",
      availability: 7,
      exclusiveClasses: [],
      description:
          "This simple periapt usually appears as a blue gemstone fastened to a silver chain designed to be worn about the neck. The wearer is immune to all disease, including supernatural diseases.",
      bonus: null,
      price: 7500,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Amulet of proof against petrification",
      availability: 8,
      exclusiveClasses: [],
      description:
          "This finely polished wooden amulet has the image of a blindfolded medusa carved upon its surface. Whenever the wearer fails a saving throw that would result in him being turned to stone, he is instead staggered for 1d6 rounds. If a spell or effect turns him to stone without allowing a saving throw, he is instead staggered for 1 minute. These abilities do not function while the wearer is staggered.",
      bonus: null,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Necklace of adaptation",
      availability: 7,
      exclusiveClasses: [],
      description:
          "This necklace is a heavy chain with a platinum medallion. The magic of the necklace wraps the wearer in a shell of fresh air, making him immune to all harmful vapors and gases (such as cloudkill and stinking cloud effects, as well as inhaled poisons) and allowing him to breathe, even underwater or in a vacuum.",
      bonus: null,
      price: 9000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Amulet of spell cunning",
      availability: 8,
      exclusiveClasses: ["Mage"],
      description:
          "This silver locket only has power when used as a wizard's bonded object. It allows a wizard to prepare an additional 3 levels of spells per day.",
      bonus: null,
      price: 10000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Medallion of thoughts",
      availability: 8,
      exclusiveClasses: [],
      description:
          "This appears to be a normal pendant disk hung from a neck chain. Usually fashioned from bronze, copper, or silver, the medallion allows the wearer to read the thoughts of others, as with the spell detect thoughts.",
      bonus: null,
      price: 11000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Periapt of protection from curses",
      availability: 8,
      exclusiveClasses: [],
      description:
          "This amethyst stone strung on a coarse iron chain protects the wearer from curses. Three times per day, whenever the wearer rolls a saving throw against a curse (such as a witch's hex, or a bestow curse spell), he may reroll the saving throw as an immediate action. The wearer must decide to use this ability before the results of the saving throw are revealed. He must take the second roll, even if it is worse.",
      bonus: null,
      price: 12000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Amulet of spell mastery",
      availability: 11,
      exclusiveClasses: ["Mage"],
      description:
          "This platinum locket only has power when used as a wizard's bonded object. It allows the wizard to prepare an additional 6 levels of spells per day.",
      bonus: null,
      price: 20000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Periapt of proof against poison",
      availability: 12,
      exclusiveClasses: [],
      description:
          "This item is a brilliant-cut black gem on a delicate silver chain meant to be worn about the neck. The wearer is immune to poison, although poisons active when the periapt is first donned still run their course.",
      bonus: null,
      price: 27000,
    ),
    WonderousItemsModel(
      type: "Neck",
      name: "Scarab of protection",
      availability: 15,
      exclusiveClasses: [],
      description:
          "This device appears to be a jade medallion in the shape of a beetle. If it is held for 1 round, an inscription appears on its surface letting the holder know that it is a protective device. The scarab's possessor gains spell resistance 20. The scarab can also absorb energy-draining attacks, death effects, and negative energy effects. Upon absorbing 12 such attacks, the scarab turns to powder and is destroyed.",
      bonus: null,
      price: 38000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Gloves of the keen evaluator",
      availability: 5,
      exclusiveClasses: [],
      description:
          "While worn, these white latex gloves provide an impressive grip for studying intricate objects. The wearer gains a +4 competence bonus on Appraise checks to determine the value of an item. While involved in negotiations regarding the studied item, the wearer can use the result of her Appraise check as the result of Diplomacy checks to haggle over the price of the item.",
      bonus: null,
      price: 1200,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Claws of the ice bear",
      availability: 5,
      exclusiveClasses: [],
      description:
          "Strapped to the hands, these spiked climbing claws grant a +2 competence bonus on Climb checks and Acrobatics checks made when using both hands to aid in movement, and allow the wearer to ignore the normal penalties on those skills for slippery or icy surfaces. In addition, up to 3 times per day, the wearer can activate the claws as a swift action to gain the benefits of spider climb for 1 round. The wearer cannot hold anything else in her hands while using claws of the ice bear. If used as a weapon, claws of the ice bear function as spiked gauntlets.",
      bonus: null,
      price: 1300,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Gloves of reconnaissance",
      availability: 5,
      exclusiveClasses: [],
      description:
          "Each of these fingerless worked leather gloves look as though they have seen heavy use, and often bear the stains or scent of grass or wet mud. On command, the wearer can use the gloves to see and hear though solid material no more than 15 feet thick by placing both hands on that material. The gloves can be used for 10 rounds each day. The rounds need not be consecutive.",
      bonus: null,
      price: 2000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Glowing glove",
      availability: 5,
      exclusiveClasses: [],
      description:
          "The wearer of this slender white leather glove may, as a standard action, press it against any surface or object and cause a luminous handprint to appear. This print glows any color the wearer wishes, sheds light as a candle, and is easily visible from a distance of up to 60 feet. Such handprints last for 1 day before fading away. The glowing handprint matches the wearer’s hand in terms of size, position of fingers, and so on.",
      bonus: null,
      price: 2000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Apprentice's cheating gloves",
      availability: 5,
      exclusiveClasses: ["Rouge"],
      description:
          "These nondescript white gloves are a boon to minor spellcasters and fakes who are limited or lacking in magical ability or versatility. The wearer of these gloves can employ mage hand and prestidigitation at will.",
      bonus: null,
      price: 2200,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Challenger's gloves",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These supple, velvet gloves are the sort that might be thrown down in challenge for a duel or other single combat. By removing a glove and using it to make a melee or ranged touch attack against an opponent, the wearer of the other glove gains a +1 morale bonus on attack rolls against the target, and the target gains a –1 penalty on attack rolls against the wearer. Both of these effects last for 1 minute, but immediately end if anyone but the glove's wearer attacks the challenged opponent. Both gloves must be worn by the same creature.",
      bonus: null,
      price: 3000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Engineer's workgloves",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These durable canvas and leather gloves imbue the wearer with an instinctive knowledge of mechanical devices. The wearer also gains a +5 competence bonus on Craft and Knowledge checks made to repair or understand mechanical devices. Once per day, the wearer may touch a device and instantly analyze it, learning its purpose and general method of operation, as well as diagnosing any acute malfunctions of the device, but not its magical powers or additional non-mechanical effects. For example, she could touch a pressure plate and understand that stepping on it would trigger a wall scythe trap attacking that square and that the trap resets automatically, but not that the trap includes a +1 flaming scythe coated in poison.",
      bonus: null,
      price: 3000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Gloves of larceny",
      availability: 5,
      exclusiveClasses: ["Rogue"],
      description:
          "These supple beige calfskin gloves greatly enhance a thief's talents. The wearer gains a +5 competence bonus on Sleight of Hand checks.",
      bonus: null,
      price: 2500,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Irongrip gauntlets",
      availability: 7,
      exclusiveClasses: [],
      description:
          "These gloves are made of goatskin reinforced with heavy iron strips. They provide a sure, strengthened grip on large or awkwardly shaped items. When the wearer wields an improvised melee weapon or inappropriately sized weapon, reduce the penalty for doing so by 2 (minimum 0). The gloves don’t change the number of hands required to wield such a weapon.",
      bonus: null,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Healer's gloves",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These pure-white leather gloves bear symbols of healing and faith on the back of the hands. The wearer gains a +5 competence bonus on Heal checks.",
      bonus: null,
      price: 4500,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Gloves of arrow snaring",
      availability: 6,
      exclusiveClasses: [],
      description:
          "Once worn, these snug gloves seem to meld with the hands, becoming almost invisible to casual observation. Twice per day, the wearer can act as if he had the Snatch Arrows feat, even if he does not meet the prerequisites for the feat. Both gloves must be worn for the magic to be effective, and at least one hand must be free to take advantage of the magic.",
      bonus: null,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Trapspringer's gloves",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These studded leather gloves look similar to workman’s gloves, though they are reinforced with numerous metal strips that the user can extend or retract as she wills, turning the tip of each finger into a customizable tool useful in examining and disarming traps. While worn, these gloves grant a +5 competence bonus on all Disable Device checks made to disarm traps. In addition, the gloves grant the user a +1 luck bonus on all saving throws made against traps.",
      bonus: null,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Impact gauntlets",
      availability: 7,
      exclusiveClasses: [],
      description:
          "These gauntlets are made of worn leather; the palms are smooth, but the wrists and backs of the gauntlets are covered in rough pebbles of various shapes and colors. The wearer can catch Small, Medium, or Large rocks and similar projectiles as if she possessed the rock catching monster ability, as long as she has at least one hand free. A rock caught by the wearer shrinks and is permanently absorbed into the gauntlets. A wearer who also possesses the rock catching ability can catch rocks twice per round instead of once.",
      bonus: null,
      price: 4500,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Gauntlets of the deep",
      availability: 6,
      exclusiveClasses: ["Ranger"],
      description:
          "These gloves are covered in fish scales and always feel cold and wet to the touch. While wearing these gauntlets, after a 24-hour attunement period, the wearer can throw a weapon that deals piercing damage underwater without penalty, using the weapon’s normal range increment. When the wielder attacks a target in water from land, regardless of the weapon the wielder is using, the target doesn’t benefit from cover or total cover for being in water.",
      bonus: null,
      price: 5000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Masterful gray gloves",
      availability: 6,
      exclusiveClasses: ["Rogue", "Bandit"],
      description:
          "These dark-gray leather gloves are extremely supple and are popular among the worshipers of Norgorber. They grant a +10 bonus on Sleight of Hands checks to take something from a creature unnoticed. Additionally, three times per day, when a creature notices the wearer’s Sleight of Hand check to take something from it, the wearer can cause the object to become invisible as an immediate action, allowing the wearer to disavow the theft.",
      bonus: null,
      price: 5400,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Gloves of swimming and climbing",
      availability: 8,
      exclusiveClasses: [],
      description:
          "These apparently normal lightweight gloves are obviously made for use outdoors. They grant a +5 competence bonus on Swim checks and Climb checks. Both gloves must be worn for the magic to be effective.",
      bonus: null,
      price: 6300,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Glove of strength-stealing",
      availability: 7,
      exclusiveClasses: [],
      description:
          "This single, seamless glove of gray calfskin is fitted with silver finger bones, covering the wearer’s hand snugly yet stretching to accommodate movement. Once per day, the wearer of a glove of strength-stealing may spend a free action to activate a chill touch effect, as per the spell. Any Strength damage inflicted by the wearer’s touch for the 6 rounds it remains in effect is added to his Strength score as an enhancement bonus (to a maximum of +6). This bonus fades 1 hour after the glove is activated.",
      bonus: null,
      price: 6400,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Quicksilver gloves",
      availability: 8,
      exclusiveClasses: [],
      description:
          "These tight-fitting gloves have silver tips at the end of each finger. When worn, the silver spreads to cover the gloves so they appear to be covered in liquid metal. As a swift action, the wearer can command the gloves to coat a held weapon with silver. The affected weapon is treated as silver for the purpose of overcoming damage reduction. The effect can be applied only to light or onehanded weapons made primarily of metal. This ability can be used for up to 10 rounds each day, though these rounds need not be consecutive. Once per day, the gloves’ wearer can make an extra attack with a melee weapon as if using a speed weapon. This benefit does not stack with similar effects, such as a haste spell.",
      bonus: null,
      price: 7000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Gloves of marking",
      availability: 8,
      exclusiveClasses: [],
      description:
          "These ruddy leather gloves enhance the precision of the wearer. When wielding a piercing or slashing weapon and using Weapon Finesse, the wearer can mark a creature when confirming a critical hit instead of dealing additional damage. The mark consists of a simple symbol, such as a single letter. The wielder and her allies gain a +2 morale bonus on attack rolls and melee damage rolls against the marked creature for 1 minute. In addition, the marked creature must succeed at a Will saving throw (DC 10 + one-half the wielder’s level + the wielder’s Dexterity modifier) or be shaken for 1 minute. The bonuses and condition persist even if the damage caused by the mark is healed.",
      bonus: null,
      price: 7300,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Magnetist's gloves",
      availability: 7,
      exclusiveClasses: [],
      description:
          "These thin leather gloves have delicate steel wires running through them. Three times per day as a standard action, the wearer of these gloves may attempt a disarm combat maneuver on a target within 30 feet. The target’s item must be mostly made of metal. If the combat maneuver check is successful, the target is disarmed and the item falls to the ground in the target’s square. For every 5 by which the check exceeds the DC, the item lands 1 square closer to the wearer. If this would place the item in the wearer’s square, the wearer may attempt to catch the item with a DC 10 Dexterity check; otherwise it lands in the wearer’s square. The wearer can only use this ability if she has at least one hand free. If the wearer fails the combat maneuver check, she is not disarmed.",
      bonus: null,
      price: 7500,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Fervent searcher's gloves",
      availability: 8,
      exclusiveClasses: [],
      description:
          "These dark blue, silken gloves are fingerless. Twice per day as a move action, the wearer can touch the ground or any other solid surface and say the command word to visibly reveal all footprints within 20 feet. When the gloves reveal footprints in this way, the wearer gains a +5 bonus on Survival checks to follow those tracks.",
      bonus: null,
      price: 7500,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Beast wrestler's gauntlets",
      availability: 9,
      exclusiveClasses: [],
      description:
          "These gauntlets grant a +1 enhancement bonus on grapple checks. Each pair of gauntlets is created to fight a specific type or subtype of creature from the list of creature types in the bane weapon special ability. While the wearer is grappling a creature of the designated type, the gauntlets’ enhancement bonus increases by 2 and the wearer deals an additional 2d6 points of nonlethal damage when dealing damage as part of a successful grapple check.",
      bonus: null,
      price: 7500,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Gloves of elvenkind",
      availability: 7,
      exclusiveClasses: ["Wizard", "Arcanist", "Sorcerer", "Summoner"],
      description:
          "These plain gray leather gloves grant a +5 competence bonus on Spellcraft checks and concentration checks made to cast a spell defensively. Both gloves must be worn for the magic to be effective.",
      bonus: null,
      price: 7500,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Deliquescent gloves",
      availability: 9,
      exclusiveClasses: [],
      description:
          "These heavy leather gloves ripple and flows at the wearer’s command, reshaping to fit any hand, claw, tentacle, or alien limb. The wearer’s melee touch attacks with that hand deal 1d6 points of acid damage. If the wearer uses that hand to wield a weapon or make an attack with an unarmed strike or natural weapon, that attack gains the corrosive weapon special ability. The wearer’s gloved hand is protected from the acid ability of oozes, allowing him to use that hand to attack oozes with unarmed strikes or natural attacks without risk of harm from contact with the ooze. These unarmed strikes and natural attacks never cause an ooze to split.",
      bonus: null,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Demonic smith's gloves",
      availability: 9,
      exclusiveClasses: [],
      description:
          "Used by the drow smiths of house Caldrana, these worked black leather gloves are stitched with red symbols dedicated to Flauros, the demon lord of fire and volcanoes. Whenever the wearer makes a melee touch attack, she deals 1d6 points of fire damage. If the wearer wields a weapon or makes an attack with an unarmed strike, that attack gains the flaming weapon special ability. When demonic smith’s gloves are used during the construction of armor or weapons, they grant their wearer a +4 competence bonus on the relevant Craft checks. If the wearer rolls a natural 1 while benefiting from this bonus, she draws the ire of Flauros, causing the gloves to become nonmagical until the wearer crafts at least five masterwork items and then destroys them in the name of the demon lord.",
      bonus: null,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Gloves of dueling",
      availability: 12,
      exclusiveClasses: [],
      description:
          "These supple gloves grant the wearer a +4 bonus to her CMD against disarm attacks, attempts to sunder her wielded weapons, and effects that cause her to lose her grip on her weapons (such as grease). The wearer doesn't drop held weapons when panicked or stunned. If the wearer has the weapon training class feature and is using an appropriate weapon, her weapon training bonus increases by +2.",
      bonus: null,
      price: 18000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Rubble cloves",
      availability: 9,
      exclusiveClasses: [],
      description:
          "These gloves are made of a fine metal mesh. If a creature wearing rubble gloves touches a 5-foot square of stone or earth floor, rubble roils to the surface, making the square difficult terrain. Using the gloves is a standard action that does not provoke attacks of opportunity. The wearer can use the gloves to create up to 20 squares of difficult terrain per day.",
      bonus: null,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Gloves of the commanding conjurer",
      availability: 8,
      exclusiveClasses: ["Summoner", "Druid"],
      description:
          "These gloves grant the wearer greater control over his summoned creatures. As long as he wears the gloves, creatures conjured by the wearer can understand him as if they shared a common language. This communication is not two-way and does not grant the wearer the ability to understand the creature. Three times per day, the wearer can attempt to take control of a summoned creature within 50 feet as if using control summoned creature (Will DC 16).",
      bonus: null,
      price: 25000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Stormcrusher gauntlets",
      availability: 12,
      exclusiveClasses: [],
      description:
          "These speckled metal gauntlets provide a noticeable prickling sensation when donned. Three times per day when the wearer would take electricity damage, she can attempt a Strength check as an immediate action to catch the electricity and crush it into harmless sparks that deal no damage (DC = 10 + 1 per 10 points of damage).",
      bonus: null,
      price: 45000,
    ),
    WonderousItemsModel(
      type: "Hands",
      name: "Gauntlets of the weaponmaster",
      availability: 18,
      exclusiveClasses: [],
      description:
          "These gauntlets come in a variety of forms. Some are mostly leather with small steel plates, and are suited for fine swordplay. Others are fully articulated plate favored by knights in full plate. On command, the wearer of the gauntlet can store a single weapon he is holding in the gauntlets. When he does so, a graven image of the weapon appears on the gauntlet's plates. The wearer can store up to 10 weapons in the gauntlets in this manner. Retrieving a weapon requires the wearer to touch the image of the weapon he wants. Doing so is a swift action. When a weapon is retrieved, it appears in the hands of the wearer and any weapons the wearer had in his hands is stored in the gauntlets. If there is no room in the gauntlet for the weapons the wearer is holding, those weapons are dropped. The gauntlets can only store weapons; other items cannot be placed in the gauntlet. Furthermore, three times per day on command, the gloves affect the wearer as the greater heroism spell.",
      bonus: null,
      price: 110000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Bodywrap of mighty strikes +1",
      availability: 5,
      exclusiveClasses: ["Monk"],
      description:
          "This long cloth is wrapped around the chest multiple times like a bandage. Once per round, the wearer may add an enhancement bonus of +1 on one attack and damage roll for an unarmed strike or natural attack (for one specific attack, not all attacks made with an unarmed strike that round). The wearer may use this item an additional time per round when his BAB reaches +6, +11, and +16. Choosing to enhance an unarmed strike is not an action and may occur when it is not the wearer's turn (such as when making an attack of opportunity). The wearer must decide to use the item before the attack roll is made, but does not have to expend all uses at the same time. For example, if the wearer can use the item twice per round, he can use it once on his turn when making an attack and save the second for the possibility of making an attack of opportunity.",
      bonus: null,
      price: 3000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Bodywrap of mighty strikes +2",
      availability: 8,
      exclusiveClasses: ["Monk"],
      description:
          "This long cloth is wrapped around the chest multiple times like a bandage. Once per round, the wearer may add an enhancement bonus of +2 on one attack and damage roll for an unarmed strike or natural attack (for one specific attack, not all attacks made with an unarmed strike that round). The wearer may use this item an additional time per round when his BAB reaches +6, +11, and +16. Choosing to enhance an unarmed strike is not an action and may occur when it is not the wearer's turn (such as when making an attack of opportunity). The wearer must decide to use the item before the attack roll is made, but does not have to expend all uses at the same time. For example, if the wearer can use the item twice per round, he can use it once on his turn when making an attack and save the second for the possibility of making an attack of opportunity.",
      bonus: null,
      price: 12000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Bodywrap of mighty strikes +3",
      availability: 12,
      exclusiveClasses: ["Monk"],
      description:
          "This long cloth is wrapped around the chest multiple times like a bandage. Once per round, the wearer may add an enhancement bonus of +3 on one attack and damage roll for an unarmed strike or natural attack (for one specific attack, not all attacks made with an unarmed strike that round). The wearer may use this item an additional time per round when his BAB reaches +6, +11, and +16. Choosing to enhance an unarmed strike is not an action and may occur when it is not the wearer's turn (such as when making an attack of opportunity). The wearer must decide to use the item before the attack roll is made, but does not have to expend all uses at the same time. For example, if the wearer can use the item twice per round, he can use it once on his turn when making an attack and save the second for the possibility of making an attack of opportunity.",
      bonus: null,
      price: 27000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Traveler's wet suit",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This wet suit protects against environmental cold damage and hypothermia. Anything stored in its waterproof pockets is kept magically separate from any surrounding water, even if the wearer opens the pocket underwater. Finally, the wearer gains a +2 competence bonus on Swim checks.",
      bonus: null,
      price: 2750,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Charlatan's cope",
      availability: 7,
      exclusiveClasses: [],
      description:
          "This plush hooded robe is finely trimmed with gold accents. When the wearer casts a spell, the robe scintillates with color and produces ostentatious magical effects, such as bright lights and loud hums, increasing the DC of Spellcraft checks to identify the spell by 10. In addition, once per day as a move action, the wearer can trigger these effects with a dramatic flourish; each creature within 30 feet that can see the wearer must succeed at a DC 13 Will save or be blinded for 1d4+1 rounds.",
      bonus: null,
      price: 4800,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Living garments",
      availability: 7,
      exclusiveClasses: [],
      description:
          "These sheer and silky robes, many of which are made of spider silk, are of the finest quality. On command, a living garment can make a number of subtle adjustments to itself, including coloring, fit, and basic design, accommodating and accentuating whatever mood the wearer wishes to convey. It always remains clean, and automatically repairs damage to itself at a rate of 1 hit point per round (hardness 0, 4 hit points). It also grants the wearer a +5 competence bonus on Diplomacy checks.",
      bonus: null,
      price: 5000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Lupine robe",
      availability: 8,
      exclusiveClasses: [],
      description:
          "The following wondrous item is generally available only to members of the indicated race or ethnicity. This silk robe is covered in exquisitely detailed embroidery depicting foxes frolicking in a pristine meadow. Four times per day, the wearer can add 1d6 to the result of a Dexterity-, Intelligence-, or Charisma-based skill check as a free action.",
      bonus: null,
      price: 6800,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Corset of the Vishkanya",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This black corset fits neatly beneath armor. As a free action, the wearer can compress herself to fit through tight spaces as though affected by a squeeze spell (Advanced Race Guide) for up to 10 rounds per day. While using the corset's magic, she gains a +5 bonus on Escape Artist checks.",
      bonus: null,
      price: 3000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Druid's vestment",
      availability: 5,
      exclusiveClasses: ["Druid"],
      description:
          "This light garment is worn over normal clothing or armor. Most such vestments are green, embroidered with elaborate plant or animal motifs. When this item is worn by a character with the wild shape ability, the character can use that ability one additional time each day.",
      bonus: null,
      price: 3750,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Cleric's vestment",
      availability: 6,
      exclusiveClasses: [],
      description:
          "This light garment is worn over normal clothing or armor. Most such vestments are white, embroidered with elaborate diety symbol motifs. When this item is worn, the character can use channel positive energy once per day as a level 6 cleric would.",
      bonus: null,
      price: 6700,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Hyperboreal robe",
      availability: 9,
      exclusiveClasses: [],
      description:
          "This beautiful robe is fashioned from fine blue silk embroidered with silver thread, and trimmed with owl feathers and tiny shards of crystal. The robe grants its wearer a +2 resistance bonus on all saving throws. In addition, the flesh of the robe’s wearer becomes searing cold to the touch. Anyone who strikes the wearer with an unarmed strike, a touch attack, or a natural weapon takes 1d6 points of cold damage. The wearer can activate or deactivate this ability as a free action.",
      bonus: null,
      price: 7000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Shozoku of the night wind",
      availability: 9,
      exclusiveClasses: [],
      description:
          "This black bodysuit is of the type typically worn by ninjas and assassins, but it grants its wearer a +2 armor bonus and a +5 competence bonus on Stealth checks. In addition, if the wearer is in illumination of less than normal light, she can use invisibility, as the spell, once per day. If the wearer is a ninja with the vanishing trick ninja trick, then the wearer can use that ability twice per day without the expenditure of any ki points and regardless of the surrounding light level.",
      bonus: null,
      price: 12000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Untouchable jacket",
      availability: 10,
      exclusiveClasses: [],
      description:
          "This black jacket is marked with the insignia of the Blackjackets. Once per day, the wearer can speak a command word to gain spell resistance 20 for 3 rounds. This spell resistance ends if the wearer successfully resists a spell as a result of it failing to penetrate his spell resistance. The first time each day that a spell has no effect on the wearer because of spell resistance or a successful saving throw, the jacket becomes charged with abjuration magic and its insignia glows faintly. The wearer can touch the glowing insignia as a standard action to cast dispel magic from the jacket, expending the charge. The charge fades with no effect if unused for 1 hour.",
      bonus: null,
      price: 18000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Diplomatist's vest",
      availability: 8,
      exclusiveClasses: [],
      description:
          "This exquisite vest made from the best silk gold can buy is a blessing for those who see it. It gives the wearer a bonus of +12 in diplomacy checks. In addition, the wearer can cast the spell suggestion (Will DC 14 negates) twice a day as spell-like ability.",
      bonus: null,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Corset of the witchdoctor",
      availability: 9,
      exclusiveClasses: ["Wizard", "Arcanist", "Sorcerer"],
      description:
          "This slimming garment is fastened with laces, buckles, and buttons and reinforced with ribs of leather or bone. If the wearer is not wearing any armor, the corset of dire witchdoctor grants a +4 armor bonus to AC.",
      bonus: null,
      price: 25000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Robe of scintillating colors",
      availability: 10,
      exclusiveClasses: [],
      description:
          "The wearer of this robe can cause the garment to display a shifting pattern of incredible hues, color after color cascading from the upper part of the robe to the hem in sparkling rainbows of dazzling light. The colors daze those near the wearer, conceal the wearer, and illuminate the surroundings. It takes 1 full round after the wearer speaks the command word for the colors to start flowing on the robe. The colors create the equivalent of a gaze attack with a 30-foot range. Those who look at the wearer are dazed for 1d4+1 rounds (Will DC 18 negates). This is a mind-affecting pattern effect. Every round of continuous scintillation of the robe gives the wearer better concealment. The miss chance on attacks against the wearer starts at 10% and increases by 10% each round until it reaches 50% (total concealment). Additionally the robe continuously illuminates a 30-foot radius. The effect can be used no more than a total of 10 rounds per day.",
      bonus: null,
      price: 29500,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Bodywrap of mighty strikes +4",
      availability: 15,
      exclusiveClasses: ["Monk"],
      description:
          "This long cloth is wrapped around the chest multiple times like a bandage. Once per round, the wearer may add an enhancement bonus of +4 on one attack and damage roll for an unarmed strike or natural attack (for one specific attack, not all attacks made with an unarmed strike that round). The wearer may use this item an additional time per round when his BAB reaches +6, +11, and +16. Choosing to enhance an unarmed strike is not an action and may occur when it is not the wearer's turn (such as when making an attack of opportunity). The wearer must decide to use the item before the attack roll is made, but does not have to expend all uses at the same time. For example, if the wearer can use the item twice per round, he can use it once on his turn when making an attack and save the second for the possibility of making an attack of opportunity.",
      bonus: null,
      price: 48000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Bodywrap of mighty strikes +5",
      availability: 18,
      exclusiveClasses: ["Monk"],
      description:
          "This long cloth is wrapped around the chest multiple times like a bandage. Once per round, the wearer may add an enhancement bonus of +5 on one attack and damage roll for an unarmed strike or natural attack (for one specific attack, not all attacks made with an unarmed strike that round). The wearer may use this item an additional time per round when his BAB reaches +6, +11, and +16. Choosing to enhance an unarmed strike is not an action and may occur when it is not the wearer's turn (such as when making an attack of opportunity). The wearer must decide to use the item before the attack roll is made, but does not have to expend all uses at the same time. For example, if the wearer can use the item twice per round, he can use it once on his turn when making an attack and save the second for the possibility of making an attack of opportunity.",
      bonus: null,
      price: 75000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Shocking robe",
      availability: 5,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Cleric",
        "Sorcerer",
        "Summoner"
      ],
      description:
          "This violet and yellow silk robe gives the impression of electricity crackling over its surface. The robe grants the wearer electricity resistance 5 and increases the wearer's caster level for all spells with the electricity descriptor by +1. Once per day on command, the wearer of the robe can emit a 20-foot-radius burst of electricity. Creatures other than the wearer within the area take 2d6 points of electricity damage (Reflex DC 16 half).",
      bonus: null,
      price: 11000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Monk's robe",
      availability: 8,
      exclusiveClasses: ["Monk"],
      description:
          "When worn, this simple brown robe confers great ability in unarmed combat. If the wearer has levels in monk, her AC and unarmed damage are treated as a monk of 5 levels higher. If donned by a character with the Stunning Fist feat, the robe lets her make one additional stunning attack per day. If the character is not a monk, she gains the AC and unarmed damage of a 5th-level monk (although she does not add her Wisdom bonus to her AC). This AC bonus functions just like the monk's AC bonus.",
      bonus: null,
      price: 13000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Robe of the mountebank",
      availability: 12,
      exclusiveClasses: [],
      description:
          "Once per day on command, this bright red and gold robe allows the wearer to use the magic of the dimension door spell. When he disappears, he leaves behind a cloud of harmless gray smoke, appearing in a similar dramatic fashion at his destination.",
      bonus: null,
      price: 10800,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Robe of treeform",
      availability: 9,
      exclusiveClasses: [],
      description:
          "This long green robe's back features an embroidered image of an ancient oak. Three times a day on command, the wearer can assume the shape of a tree, as the tree shape spell, but can only take the form of a living tree. Furthermore, each hour the wear spends in tree form while in direct sunlight, he heals 1d6 hit points.",
      bonus: null,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Smuggler's collapsible robe",
      availability: 14,
      exclusiveClasses: ["Rogue"],
      description:
          "Appearing to be nothing more than a ratty wool robe with a hood, this garment is an invaluable tool for spies, thieves, and smugglers. On command, the wearer and non-living objects up to her maximum load are sucked into an extradimensional space within the robe, leaving the robe to collapse where the wearer was standing. The robe appears to be merely a pile of discarded clothes, and does not detect as magical or function so long as the wearer is within the extradimensional space. While inside the extradimensional space, the wearer cannot take most actions, but can breathe comfortably for up to 24 hours. The wearer can see the area around the robe, though special senses such as darkvision or blindsense do not function. The wearer may leave the extradimensional space with a thought as a free action—the only action he can make while inside the extradimensional space. He reappears wearing the robe once more. However, if there is not enough room for the wearer to reappear (for example, if the robe was placed inside a small box) then the wearer cannot leave the extradimensional space. If the robe is destroyed or its magic suppressed while the wearer is within the extradimensional space, or if he spends 24 hours within it, he and all objects inside reappear instantaneously in the robe's space, and the wearer is dazed for one round.",
      bonus: null,
      price: 48000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Wings of flying",
      availability: 14,
      exclusiveClasses: [],
      description:
          "A pair of these wings might appear to be nothing more than a plain robe of old, black cloth, or they could be as elegant as a long robe of blue feathers. When the wearer speaks the command word, the robe turns into a pair of bat or bird wings that empower her to fly with a speed of 60 feet (average maneuverability), also granting a +5 competence bonus on Fly skill checks.",
      bonus: null,
      price: 54000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Robe of etherealness",
      availability: 15,
      exclusiveClasses: [],
      description:
          "This silvery gray robe seems to absorb light rather than be illuminated by it. On command, the robe makes its wearer ethereal (as the ethereal jaunt spell). The effect is dismissible. The robe works for a total of up to 10 minutes per day. This duration need not be continuous, but it must be used in 1 minute increments.",
      bonus: null,
      price: 56000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Robe of stars",
      availability: 14,
      exclusiveClasses: ["Rogue", "Alchemist"],
      description:
          "This garment is typically black or dark blue and embroidered with small white or silver stars. The robe has three magical powers. It enables the wearer to travel physically to the Astral Plane, at will and on command as if using the plane shift spell. Once he has done so, the wearer can also return to his plane of origin on command, also as per the plane shift spell. This robe also grants its wearer a +1 luck bonus on all saving throws. Finally, the wearer can use up to six of the embroidered stars on the chest portion of the robe as +5 shuriken. The robe grants its wearer proficiency with such weapons. Each shuriken disappears after it is used. The stars are replenished once per month.",
      bonus: null,
      price: 58000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Robe of gates",
      availability: 15,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Cleric",
        "Sorcerer",
        "Summoner"
      ],
      description:
          "Silver circles and conjuring runes decorate this black robe. Three times per day when the wearer uses a summoning spell or spell-like ability to summon a variable number of creatures, he can choose to summon the maximum number of creatures possible. Creatures summoned in this way step from the shadowy folds of the robe, and appear adjacent to the wearer. If there isn't sufficient room for all the creatures to appear, the extra creatures are wasted and do not appear. If the wearer is a summoner, he can call upon the robe to summon his eidolon as a standard action once per day. It must appear adjacent to the summoner when called this way.",
      bonus: null,
      price: 64000,
    ),
    WonderousItemsModel(
      type: "Body",
      name: "Robe of the archmagi",
      availability: 13,
      exclusiveClasses: ["Wizard", "Arcanist", "Sorcerer"],
      description:
          "An exquisite good-looking robe that grants the wearer the following bonuses: +5 armor bonus to AC; Spell resistance 18; +4 resistance bonus on all saving throws; +2 enhancement bonus on caster level checks made to overcome spell resistance",
      bonus: null,
      price: 75000,
    ),
    WonderousItemsModel(
      type: "Chest",
      name: "All tools vest",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This well-made leather vest bears numerous shiny metal buttons, which stud a number of bulging pockets. Once per day, as a standard action, the wearer can speak the vest’s command word and order it to bring forth all the standard tools required to make checks for any one Craft skill. These tools appear in the countless pockets of the vest or, if too heavy, on the floor, on a nearby shelf, on a workbench, or in a toolbox or cupboard that appears nearby. Once summoned, they remain for 24 hours or until another creature touches them, whichever comes first.",
      bonus: null,
      price: 1800,
    ),
    WonderousItemsModel(
      type: "Chest",
      name: "Coat of pockets",
      availability: 6,
      exclusiveClasses: [],
      description:
          "This black-and-gray wool coat sports over a dozen pockets on its front alone and even more line the insides. Interdimensional magic causes anything placed in one pocket to immediately appear in another randomly determined pocket. A character wearing this coat gains a +5 circumstance bonus on Sleight of Hand checks to hide a small object on her body. However, if a character wearing a coat of pockets places anything in one of the coat’s pockets, she must spend a standard action to retrieve it (rather than a move action).",
      bonus: null,
      price: 2600,
    ),
    WonderousItemsModel(
      type: "Chest",
      name: "Vest of surgery",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This emerald vest has four prominent and bulging pockets along its front. The wearer is always treated as if using a healer’s kit when making Heal checks. Once per day, the wearer can make a DC 20 Heal check as if attempting to treat deadly wounds. If the check is successful, it cures 1d4 points of ability damage instead of hit point damage.",
      bonus: null,
      price: 3000,
    ),
    WonderousItemsModel(
      type: "Chest",
      name: "Vest of escape",
      availability: 7,
      exclusiveClasses: [],
      description:
          "This simple silk vest looks nondescript, but is actually studded with numerous secret pockets sewn into its lining. Hidden inside these are magic lockpicks that provide a +4 competence bonus on Disable Device checks. The vest also grants its wearer a +6 competence bonus on Escape Artist checks.",
      bonus: null,
      price: 5200,
    ),
    WonderousItemsModel(
      type: "Chest",
      name: "Shirt of immolation",
      availability: 7,
      exclusiveClasses: [],
      description:
          "Whenever the wearer is grappling (whether on the offense or defense), this shirt automatically bursts into flame, dealing 1d6+10 points of fire damage every round to anyone grappling the wearer. The flames do not harm the wearer and last one round (though it continues to burn if the wearer is still grappling after one round). The shirt burns for a maximum of 10 rounds per day. These rounds do not need to be consecutive.",
      bonus: null,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Chest",
      name: "Vest of the cockroach",
      availability: 8,
      exclusiveClasses: ["Rogue"],
      description:
          "This padded and slightly bulky vest, made from red-brown cloth, causes its wearer to feel vaguely uncomfortable whenever she is lying prone. If the wearer is a rogue, she gains the resiliency rogue talent. If she already has this talent, activating the talent grants her 2 hit points per rogue level instead of 1.",
      bonus: null,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Chest",
      name: "Vest of stable mutation",
      availability: 9,
      exclusiveClasses: ["Alchemist"],
      description:
          "This leather vest is fitted with a number of pockets that are useful for storing the ingredients necessary for alchemical tinkering. The main ability of this vest, however, is to lessen the debilitating effects of an alchemist's mutagen. While under the effect of any type of mutagen, the wearer takes no penalty to mental ability scores from that mutagen.",
      bonus: null,
      price: 10000,
    ),
    WonderousItemsModel(
      type: "Chest",
      name: "Spectral shroud",
      availability: 9,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Cleric",
        "Sorcerer",
        "Summoner"
      ],
      description:
          "This thin, bleached cloth covers the wearer's entire torso. Some also cover the wearer's face, but don't interfere with the wearer's vision. The morbid burial shroud grants the wearer some affinity with the spectral dead. The wearer can discern invisible or ethereal creatures as though using see invisibility. Once per day, the wearer can become incorporeal for 10 rounds and gain a fly speed equal to half his base speed with perfect maneuverability. The wearer can't attack while incorporeal, but can dismiss the effect as a move action.",
      bonus: null,
      price: 13000,
    ),
    WonderousItemsModel(
      type: "Chest",
      name: "Shadow jumper's tunic",
      availability: 9,
      exclusiveClasses: [],
      description:
          "This dark-gray tunic allows a character to make a single jump of up to 40 feet per day, or four jumps of 10 feet each per day. All jumps must begin and end in an area that has at least some dim light. If the wearer has at least 4 levels in the shadowdancer prestige class, the tunic instead adds 40 feet to the total number of feet he can shadow jump in 1 day.",
      bonus: null,
      price: 16200,
    ),
    WonderousItemsModel(
      type: "Chest",
      name: "Merciful baldric",
      availability: 10,
      exclusiveClasses: ["Paladin"],
      description:
          "This sash of white silk embroidered with golden suns never tears, fades, or soils. Once per day, a paladin wearing this baldric can select three extra mercies of her level or lower she does not already know and add them to the list of mercies she can use for the day. She has access to these mercies for 24 hours. When the wearer uses a mercy to remove a condition caused by a curse, disease, or poison, the mercy actually cures the source curse, disease, or poison rather than merely suppressing it for 1 hour.",
      bonus: null,
      price: 45000,
    ),
    WonderousItemsModel(
      type: "Chest",
      name: "Mantle of faith",
      availability: 12,
      exclusiveClasses: ["Cleric"],
      description:
          "This holy garment bears the varied religious icons and favored colors of a specific faith. When worn over normal clothing, grants damage reduction 5/evil to the character wearing it.",
      bonus: null,
      price: 38000,
    ),
    WonderousItemsModel(
      type: "Chest",
      name: "Mantle of spell resistance",
      availability: 17,
      exclusiveClasses: [],
      description:
          "This light mantle bears a variety of mysterious symbols. When worn over normal clothing or armor, this magical garment grants the wearer spell resistance 21.",
      bonus: null,
      price: 90000,
    ),
    WonderousItemsModel(
      type: "Eyes",
      name: "Deathwatch eyes",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These blood red crystal lenses fit snugly over the wearer's eyes. The wearer gains the constant effects of the deathwatch spell.",
      bonus: null,
      price: 2000,
    ),
    WonderousItemsModel(
      type: "Eyes",
      name: "Eyes of the eagle",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These lenses are made of special crystal and fit over the eyes of the wearer. They grant a +5 competence bonus on Perception checks. Both lenses must be worn to gain the benefit. Wearing only one causes a character to become dizzy and stunned for 1 round.",
      bonus: null,
      price: 2500,
    ),
    WonderousItemsModel(
      type: "Eyes",
      name: "Lenses of detection",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These circular prisms let their wearer detect minute details, gaining a +5 competence bonus on Perception checks. It also aids in tracking, adding a +5 competence bonus on Survival checks when tracking.",
      bonus: null,
      price: 3000,
    ),
    WonderousItemsModel(
      type: "Eyes",
      name: "Eyes of the owl",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These magical goggles are decorated with owl motifs, including clusters of feathers over the eyes. The wearer gains low-light vision.",
      bonus: null,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Eyes",
      name: "Treasure hunter's goggles",
      availability: 6,
      exclusiveClasses: ["Rogue"],
      description:
          "These sturdy but plain goggles help the wearer locate secret doors and coins and identify treasure. While wearing these goggles, the wearer can use detect secret doors at will. The goggles do not aid in determining how secret doors are opened. Once per day on command, the wearer gains the ability to locate object as per the spell, but only to detect 100 or more coins in a small area, such as a backpack, chest, pouch, or sack. Three times per day, the wearer may use identify.",
      bonus: null,
      price: 6400,
    ),
    WonderousItemsModel(
      type: "Eyes",
      name: "Goggles of elvenkind",
      availability: 7,
      exclusiveClasses: [],
      description:
          "These simple goggles, made of two emeralds attached to a twin frame, grant the wearer low-light vision and a +5 compentence bonus on Spellcraft checks to identify magic auras and items. If the wearer already has low-light vision, it grants the wearer double the normal range for low-light vision.",
      bonus: null,
      price: 8500,
    ),
    WonderousItemsModel(
      type: "Eyes",
      name: "Goggles of night",
      availability: 8,
      exclusiveClasses: [],
      description:
          "The lenses of this item are made of violet crystal. Even though the lenses are opaque, when placed over the eyes of the wearer, they enable him to see normally and also grant him 60-foot darkvision. Both lenses must be worn for the magic to be effective.",
      bonus: null,
      price: 12000,
    ),
    WonderousItemsModel(
      type: "Eyes",
      name: "Lenses of figment piercing",
      availability: 9,
      exclusiveClasses: ["Wizard", "Arcanist", "Sorcerer"],
      description:
          "When the wearer first sees an illusion effect with the figment subschool with a visual element, and that figment allows a saving throw, she can immediately make any allowed saving throw to realize the image is illusory instead of waiting to interact with it. This has no effect on illusions of other subschools or on illusions that do not normally allow a saving throw. If the wearer fails to disbelieve the illusion and later interacts with it in such a way as to qualify normally for a saving throw to disbelieve, she gains a +4 competence bonus on this saving throw.",
      bonus: null,
      price: 12000,
    ),
    WonderousItemsModel(
      type: "Eyes",
      name: "Arachnid goggles",
      availability: 10,
      exclusiveClasses: [],
      description:
          "This leather band is studded with dozens of faceted crystals of varying size, two of which fit over the eyes. When wearing these goggles, the wearer uses all the crystals as eyes, gaining all-around vision.",
      bonus: null,
      price: 15000,
    ),
    WonderousItemsModel(
      type: "Eyes",
      name: "Sniper goggles",
      availability: 10,
      exclusiveClasses: ["Rogue"],
      description:
          "The leather strap attached to these bulbous lenses allows their wearer to fit them to his head. The wearer of these goggles can make ranged sneak attacks from any distance instead of the normal 30 feet. When making ranged sneak attacks within 30 feet, the wearer gains a +2 circumstance bonus on each sneak attack damage.",
      bonus: null,
      price: 20000,
    ),
    WonderousItemsModel(
      type: "Eyes",
      name: "Annihilation spectacles",
      availability: 12,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Cleric",
        "Sorcerer",
        "Summoner"
      ],
      description:
          "Creatures viewed through these darkly tinted glasses sometimes seem to flicker briefly in and out of existence. A transmuter can use these spectacles to spontaneously convert any prepared wizard transmutation spell into any other wizard transmutation spell he knows; the desired spell must be of the same level or lower than the prepared spell. Once per day, he may use the spectacles to spontaneously cast disintegrate in place of one of his prepared transmutation wizard spells of 6th level or higher, even if he doesn't know that spell.",
      bonus: null,
      price: 25000,
    ),
    WonderousItemsModel(
      type: "Eyes",
      name: "Captain's eye patch",
      availability: 12,
      exclusiveClasses: [],
      description:
          "This black velvet eye patch is attached to an onyx chain that is worn around the head. The eye patch grants its wearer darkvision with a range of 60 feet. Additionally, as a standard action, the wearer can speak the eye patch’s command word to see through powerful magical darkness, such as an area of deeper darkness, for up to 11 minutes per day. This duration need not be used all at once, but it must be used in 1-minute increments. Ending this effect is a free action.",
      bonus: null,
      price: 48000,
    ),
    WonderousItemsModel(
      type: "Eyes",
      name: "Eyes of the dragon",
      availability: 16,
      exclusiveClasses: [],
      description:
          "These tigereye gems fit over and then meld into the eyes, transforming the wearer's eyes into something slitted and draconic. These eyes grant the wearer darkvision 120 ft. and blindsense 60 ft. The wearer sees four times as well as a human in dim light and twice as well in normal light.",
      bonus: null,
      price: 110000,
    ),
    WonderousItemsModel(
      type: "Eyes",
      name: "Truesight goggles",
      availability: 20,
      exclusiveClasses: [],
      description:
          "These goggles, constructed of a pair of perfect prisms held in place by golden frames and affixed to the head by a black leather strap, grants the wearer true seeing continuously. Furthermore, once per day on command, the wearer can use analyze dweomer as the spell.",
      bonus: null,
      price: 185000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Cap of human guise",
      availability: 5,
      exclusiveClasses: ["Rogue", "Bard"],
      description:
          "This threadbare hat allows its wearer to alter her appearance at will as with a disguise self spell, except she can only appear as a plainly dressed Small human child, adult halfling, or adult gnome, such as a peasant, blacksmith, or shopkeeper. The wearer can slightly alter the cap's appearance as part of the disguise, but otherwise must match the overall unremarkable look of the illusory form. Though invented and primarily used by Small humanoids, it can be used by any Small or Medium humanoid creature.",
      bonus: null,
      price: 800,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Cap of light",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This small cloth skullcap resembles those some priests wear, but is topped with a small silver statue in the shape of a lit candle. The wearer can command the statue to radiate light (as the spell). The light can also be turned off on command.",
      bonus: null,
      price: 900,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Besmara's bicorne",
      availability: 6,
      exclusiveClasses: [],
      description:
          "This large pirate hat bears a skull-and-crossbones on the front. The wearer gains a +2 competence bonus on Acrobatics and Climb checks. If Besmara is the wearer’s patron, the wearer automatically floats to the surface of any body of water (at a speed of 30 feet) unless she desires otherwise; this does not prevent the wearer from falling safely into water or interacting with water in any other way.",
      bonus: null,
      price: 1700,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Miser's mask",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This wooden mask depicts the sunken face of a miser with an upturned nose. The mask grants the wearer the scent ability (Bestiary 304), but she can use it only to sense coins and gems. Each type and quality of gem has its own unique aura to the wearer, granting her a +5 competence bonus on Appraise checks made to ascertain the value of gems.",
      bonus: null,
      price: 3000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Mask of conflicting energies",
      availability: 6,
      exclusiveClasses: ["Sorcerer", "Wizard", "Arcanist", "Summoner", "Druid"],
      description:
          "This mask is white on one side and black on the other, with glittering gem lenses covering the eyes. Up to three times per day, the wearer can change the energy damage of a fire spell she casts to cold, a cold spell to fire, an acid spell to electricity, or an electricity spell to acid. All other effects of the spell are unchanged (for example, an ice storm changed to fire damage still deals bludgeoning damage and bestows a penalty on Perception checks). The mask affects only spells up to 3rd level.",
      bonus: null,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Traveling master's turban",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This turban consists of 30 feet of cloth held in place by a brooch. The owner can command the turban to tie or untie itself as a move action. When the turban is tied on the wearer’s head, the wearer gains the benefits of endure elements. Once per day when the turban is untied, the owner can use the fabric to cast animate rope.",
      bonus: null,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Circlet of persuasion",
      availability: 5,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Cleric",
        "Sorcerer",
        "Summoner",
        "Druid"
      ],
      description:
          "This delicately engraved silver headband grants its wearer a +3 competence bonus on Charisma-based checks.",
      bonus: null,
      price: 4500,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Hat of the seven winds",
      availability: 1,
      exclusiveClasses: [],
      description:
          "This black tricorne hat is embroidered with the pattern of a ship. The wearer does not take any penalties from rain, takes penalties from high wind speeds as though she were one size category larger than she actually is, and gains a +4 bonus on saving throws against wind effects.",
      bonus: null,
      price: 4500,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Jingasa of the fortunate soldier",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This conical iron jingasa, or war hat, grants the wearer a +1 luck bonus to AC. Once per day when struck by a critical hit or sneak attack, the wearer can spend an immediate action to negate the critical hit or sneak attack (similar to the fortification armor special ability, but without requiring a roll). The damage is instead rolled normally.",
      bonus: null,
      price: 5000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Helm of comprehend languages and read magic",
      availability: 6,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Cleric",
        "Sorcerer",
        "Summoner",
        "Druid"
      ],
      description:
          "Appearing as a normal helmet, a helm of comprehend languages and read magic grants its wearer the ability to understand the spoken words of any creature and to read text in any language and any magical writing. The wearer gains a +5 competence bonus on Linguistics checks to understand messages written in incomplete, archaic, or exotic forms. Note that understanding a magical text does not necessarily imply ability to use its spells.",
      bonus: null,
      price: 5200,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Cyclops helm",
      availability: 7,
      exclusiveClasses: [],
      description:
          "This helm is made from the husk of a cyclops’s shrunken head, and grants a limited version of that creature’s flash of insight ability. Once per day as an immediate action, instead of rolling her next attack roll, saving throw, skill check, or ability check, the wearer can choose to use 20 as if she had rolled it naturally.",
      bonus: null,
      price: 5800,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "War mask of terror",
      availability: 1,
      exclusiveClasses: [],
      description:
          "Many of the indigenous tribes add to their fierceness and mystique by wearing wooden masks that bear terrifying visages of demonic spirits. A war mask is considered sacred and personal. Individual masks are often notorious, and many tribesfolk can readily identify masks of other tribes with a DC 15 Knowledge (local) check. A war mask of terror provides its wearer with a +2 competence bonus on Intimidate checks and a +1 deflection bonus to Armor Class. In addition, the wearer may cast scare once per day.",
      bonus: null,
      price: 9000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Medusa mask",
      availability: 7,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Cleric",
        "Sorcerer",
        "Summoner"
      ],
      description:
          "This intricate mask is made of gold-plated iron. Writhing snake tails radiate from a gemstone upon the brow, almost as if they were medusa-like hair. The mask grants a +4 bonus on all saving throws against visual effects, including gaze attacks and sight-based illusions. Once per day as a standard action, the wearer can cause the central gemstone to glow with pale green light, at which point she may target any one creature within 30 feet. The targeted creature must succeed at a DC 18 Fortitude save or be petrified for 1 minute, as if by flesh to stone.",
      bonus: null,
      price: 10000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Cap of the free thinker",
      availability: 7,
      exclusiveClasses: [],
      description:
          "This soft cap helps the wearer free herself from outside influences. When the wearer makes a saving throw against a mind-affecting effect, she can roll twice and take the better roll.",
      bonus: null,
      price: 12000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Mask of the rabbit prince",
      availability: 8,
      exclusiveClasses: [],
      description:
          "This colorful mask evokes the image of the Rabbit Prince from the Harrowed Realm. It covers the top half of the wearer’s face and depicts the countenance of a resolute rabbit complete with large, floppy felt ears. Despite its apparently fragile construction, the mask is as tough as iron (hardness 10). The mask of the rabbit prince imparts reckless bravado, granting the wearer a +2 morale bonus on initiative checks and on saving throws against fear effects. In addition, the wearer always counts as having a running start when attempting Acrobatics checks to jump.",
      bonus: null,
      price: 12000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Halo of inner calm",
      availability: 7,
      exclusiveClasses: [],
      description:
          "This silvery ring looks like a halo. When worn by a tiefling it hovers just above his head, though it still uses the head magic item slot. It helps to calm the baser emotions and the dark whispers that plague tieflings, granting the wearer a +4 resistance bonus on saving throws against all spells with the emotion descriptor. When worn by a tiefling of a good alignment, it provides spell resistance 13 against spells with the evil descriptor and a +2 sacred bonus on saving throws.",
      bonus: null,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Maw of the wyrm",
      availability: 8,
      exclusiveClasses: [],
      description:
          "This fearsome helm, wrought into the shape of a roaring dragon's maw, has dozens of glittering dragon scales across its surface. The helm's wearer gains a +4 competence bonus on Intimidate checks and a +4 insight bonus on saves to resist a dragon's frightful presence aura. Each helm is modeled after a particular type of chromatic or metallic dragon. Once per day on command, the wearer can breathe out a blast of energy, as the dragon's breath spell to mimic the breath weapon of the dragon the helm is modeled after (7d6 points of damage, Reflex DC 16 half).",
      bonus: null,
      price: 18000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Mask of the skull",
      availability: 10,
      exclusiveClasses: ["Antipaladin", "Warrior", "Barbarian"],
      description:
          "This fearsome-looking mask of ivory, beaten copper, or pale wood is typically fashioned into the likeness of a human skull with a missing lower jaw, allowing the bottom half of the wearer's face to remain visible when the mask is worn. Once per day, after it has been worn for at least 1 hour, the mask can be loosed to fly from the wearer's face. It travels up to 50 feet away from the wearer and attacks a target assigned to it. The grinning skull mask makes a touch attack against the target based on the wearer's base attack bonus. If the attack succeeds, the target must make a successful DC 20 Fortitude save or take 130 points of damage, as if affected by a finger of death spell. If the target succeeds at its saving throw, it nevertheless takes 3d6+13 points of damage. After attacking (whether successful or not), the mask flies back to its user. The mask has AC 16, 10 hit points, and hardness 6.",
      bonus: null,
      price: 22000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Crown of blasting, major",
      availability: 9,
      exclusiveClasses: [],
      description:
          "On command, this elaborate golden crown projects a blast of searing light (5d8 maximized for 40 points of damage) once per day.",
      bonus: null,
      price: 23800,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Helm of underwater action",
      availability: 8,
      exclusiveClasses: [],
      description:
          "The wearer of this helmet can see underwater. Drawing the small lenses in compartments on either side into position before the wearer's eyes activates the visual properties of the helm, allowing her to see five times farther than water and light conditions would allow for normal human vision. (Weeds, obstructions, and the like block vision in the usual manner.) If the command word is spoken, the helm of underwater action gives the wearer a 30-foot swim speed and creates a globe of air around the wearer's head and maintains it until the command word is spoken again, enabling her to breathe freely.",
      bonus: null,
      price: 24000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Helm of telepathy",
      availability: 8,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Cleric",
        "Sorcerer",
        "Summoner",
        "Druid"
      ],
      description:
          "This pale metal or ivory helm covers much of the head when worn. The wearer can use detect thoughts at will. Furthermore, he can send a telepathic message to anyone whose surface thoughts he is reading (allowing two-way communication). Once per day, the wearer of the helm can implant a suggestion (as the spell, Will DC 14 negates) along with his telepathic message.",
      bonus: null,
      price: 27000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Plague mask",
      availability: 9,
      exclusiveClasses: [],
      description:
          "This stylized bird mask consists of a pair of goggles attached to a ceramic beak that covers the nose and mouth. The goggles are not magic and can be replaced with other goggles or eye slot items. It grants the wearer a +4 resistance bonus on saving throws against disease. Once per day on command, the user can remove disease (as the spell) on a single creature touched.",
      bonus: null,
      price: 27000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Mask of giants, lesser",
      availability: 10,
      exclusiveClasses: ["Barbarian", "Warrior", "Bandit"],
      description:
          "This wooden mask depicts a leering humanoid with an oversized nose and ears. If the wearer has the wild shape class feature, the mask allows her to use wild shape to take the form of a humanoid with the giant subtype. The forms allowed by a lesser mask of giants are ogre, troll, fire giant, frost giant, and stone giant. If the form has any of the following abilities, the wearer gains the listed ability: darkvision 60 feet, low-light vision, scent. In giant form, the wearer gains a +4 size bonus to Strength, a –2 penalty to Dexterity, and a +1 natural armor bonus.",
      bonus: null,
      price: 30000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Judge's wig",
      availability: 12,
      exclusiveClasses: [],
      description:
          "This flowing wig of white ringlets grants its wearer an unmistakable impression of dignity and gravitas. This grants a +4 competence bonus on Diplomacy and Intimidate checks. At will, the wearer can concentrate on a creature within 30 feet to scrutinize it with discern lies.",
      bonus: null,
      price: 59000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Helm of teleportation",
      availability: 13,
      exclusiveClasses: [],
      description:
          "A character wearing this helm may teleport three times per day, instantly transporting himself and objects he might be carrying on his person to a designated destination, exactly as if he had cast the spell of the same name.",
      bonus: null,
      price: 74000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Mask of giants, greater",
      availability: 15,
      exclusiveClasses: ["Barbarian", "Warrior", "Bandit"],
      description:
          "A greater mask of giants has all the powers of a lesser mask of giants, plus it grants additional abilities in giant form. If the form has any of the following abilities, the wearer gains the listed ability: rend (2d6 damage), regeneration 5 (acid or fire), rock catching, rock throwing (range 60 feet, 2d6 damage). If the chosen giant form has immunity or resistance to any energy type, the wearer gains resistance 20 to that energy type when in giant form. If the giant form has vulnerability to an energy type, the wearer gains that vulnerability when in giant form. In giant form, the wearer gains a +6 size bonus to Strength, a –2 penalty to Dexterity, a +4 size bonus to Constitution, and a +4 natural armor bonus.",
      bonus: null,
      price: 90000,
    ),
    WonderousItemsModel(
      type: "Head",
      name: "Helm of the Serpent King",
      availability: 12,
      exclusiveClasses: [],
      description:
          "This helm is made of large, alchemically hardened snake scales, and is crafted in the shape of a stylized serpent mouth. Its wearer stares out through the serpent’s eyes, and sees all things cast in a yellow tint. When worn, it grants the following spell-like abilities to the wearer:\n• Hypnotism (3/day)\n• Summon nature’s ally III (constrictor snake only, 3/day)\n• Beast shape III (snake form only, 1/day)\n• Poison (1/day)\nA mythic creature can expend one use of mythic power when using the beast shape III spell-like ability to instead cast it as mythic beast shape III. Alternatively, he can expend two uses of mythic power to instead cast the augmented version of mythic beast shape III.",
      bonus: null,
      price: 96000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracers of archery, lesser",
      availability: 5,
      exclusiveClasses: ["Ranger", "Warrior"],
      description:
          "These wristbands appear similar to greater bracers of archery, though they are typically constructed of lighter material. They function as greater bracers of archery, except they grant a +1 competence bonus on attack rolls and no bonus on damage rolls.",
      bonus: 1,
      price: 5000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Spellguard bracers",
      availability: 5,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Cleric",
        "Sorcerer",
        "Summoner"
      ],
      description:
          "Typically made of leather dyed blue and decorated with star-shaped studs, these bracers are used by spellcasters who practice their art in the heat of combat. The bracers grant the wearer a +2 bonus on concentration checks made to cast defensively. Three times per day, the wearer can choose to roll a concentration check to cast defensively twice and take the better result.",
      bonus: null,
      price: 5000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracers of the glib entertainer",
      availability: 5,
      exclusiveClasses: ["Brad"],
      description:
          "These decorative bracers are stippled with vibrant colors and have various tiny bells sewn onto their surface. While wearing them, the wearer gains a +5 competence bonus on Perform checks. Once per day on command, the user can gain the benefit of the glibness spell.",
      bonus: null,
      price: 7900,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Merciful vambraces",
      availability: 5,
      exclusiveClasses: ["Paladin"],
      description:
          "These vambraces are constructed of polished steel. When a paladin wears these vambraces, engravings of the holy symbol of a paladin's deity and other religious iconography mystically appear upon the metal's surface. Once per day, when the paladin uses her lay on hands ability, she can choose to apply an additional mercy to that use of lay on hands that she did not already select. She must be of sufficient level to use that mercy.",
      bonus: null,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Vambraces of defense",
      availability: 5,
      exclusiveClasses: [],
      description:
          "These polished steel vambraces grant a +1 deflection bonus to AC. Once per day, as an immediate action, if the wearer has at least one hand free, when he would normally be hit with an attack from a ranged weapon, he may deflect it with the bracers, taking no damage from it, as if he had the Deflect Arrows feat.",
      bonus: 1,
      price: 6000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracers of the avenging knight",
      availability: 5,
      exclusiveClasses: ["Paladin"],
      description:
          "These silver bracers are polished to a mirrored sheen, but otherwise shift their appearance to match whatever suit of armor they are worn with. If the wearer has levels in a class that grants a smite ability (such as a paladin, or a cleric with the destruction domain), her smite damage is treated as though she were a member of that class four levels higher. If the wearer is not a member of such a class, once per day she may make one smite attack, gaining a bonus on the attack roll equal to her Charisma bonus, and a +5 bonus to the damage roll on a hit.",
      bonus: null,
      price: 11500,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Arrowmaster's bracers",
      availability: 8,
      exclusiveClasses: ["Ranger", "Warrior"],
      description:
          "This simple pair of leather shooting bracers are designed to protect the wearer's wrist from being snapped by bowstrings. They appear similar to a set of bracers of archery, but a wearer notices the difference as soon as she dons them. The wearer of these bracers gains damage reduction 5/magic against ranged weapons, as well as a +1 deflection bonus against ranged attacks. In addition, once per day, as a swift action, the wearer can grant herself a +20 insight bonus on her next ranged attack roll before the end of her next turn.",
      bonus: null,
      price: 14000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracelet of bargaining",
      availability: 7,
      exclusiveClasses: ["Aristocrat", "Noble"],
      description:
          "This heavy gold band can be worn openly as a display of wealth or concealed beneath a sleeve. It grants its wearer a +5 competence bonus on Bluff, Diplomacy, and Sense Motive checks. Whenever the wearer shakes hands with another creature In order to seal a deal or a promise, she can immediately sense whether deceit is involved (Will save DC 16 negates), though the wearer cannot determine the exact nature of the deception.",
      bonus: null,
      price: 14500,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracelet of second chances",
      availability: 8,
      exclusiveClasses: [],
      description:
          "This bracelet is adorned with seven coral beads carved in intricate designs. When a critical hit or sneak attack is confirmed on the wearer, as an immediate action before damage is rolled, he can choose to convert the critical hit into a normal hit. Each time the wearer negates a critical hit or sneak attack in this manner, one bead shatters. When all seven are used up, the bracelet itself crumbles into powder.",
      bonus: null,
      price: 15800,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracers of celestial intervention",
      availability: 9,
      exclusiveClasses: ["Paladin"],
      description:
          "Prayers and engravings of celestial beings cover these golden bracers. A paladin can expend one or more of her uses of smite evil into these bracers as a standard action to call forth agathions, angels, or archons to aid her. This acts as a summon monster spell of a spell level equal to the number of smite evil uses the paladin expends.",
      bonus: null,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracers of demonic intervention",
      availability: 9,
      exclusiveClasses: ["Antipaladin"],
      description:
          "Unholy and engravings of demonic beings cover these golden bracers. An antipaladin can expend one or more of her uses of smite good into these bracers as a standard action to call forth demonos to aid her. This acts as a summon monster spell of a spell level equal to the number of smite good uses the antipaladin expends.",
      bonus: null,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Bracers of archery, greater",
      availability: 9,
      exclusiveClasses: ["Ranger", "Warrior"],
      description:
          "These bracers look like normal protective wear. They empower the wearer to use any bow (not including crossbows) as if she were proficient in its use. If she already has proficiency with any type of bow, she gains a +2 competence bonus on attack rolls and a +1 competence bonus on damage rolls whenever using that type of bow. Both bracers must be worn for the magic to be effective.",
      bonus: 2,
      price: 25000,
    ),
    WonderousItemsModel(
      type: "Wrist",
      name: "Gauntlets of skill at arms",
      availability: 12,
      exclusiveClasses: [],
      description:
          "These finely crafted leather gauntlets have plates of silvered steel covering the back, and silver buckles at the wrist and forearm. The gloves enable the wearer to use any traditional elven weapon (longbows, composite longbows, longswords, rapiers, shortbows, composite shortbows, and any weapon with the word 'elven' in its name) as if he were proficient in its use. If he uses such a weapon and is already proficient with it, he gains a +1 competence bonus on attack and damage rolls. Both gloves must be worn for the magic to be effective",
      bonus: 1,
      price: 30000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of feather falling",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This ring is crafted with a feather pattern all around its edge. It acts exactly like a feather fall spell, and activates immediately if the wearer falls more than 5 feet.",
      bonus: null,
      price: 2200,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of climbing",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This magic ring has the deceptively simple appearance of a plain leather cord that wraps securely around a finger. The ring continually grants the wearer a +5 competence bonus on Climb checks.",
      bonus: 5,
      price: 2500,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of jumping",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This ring continually allows the wearer to leap about, providing a +5 competence bonus on all her Acrobatics checks made to make high or long jumps.",
      bonus: 5,
      price: 2500,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of sustenance",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This ring continually provides its wearer with life-sustaining nourishment. The ring also refreshes the body and mind; its wearer only needs to sleep 2 hours per day to gain the benefit of 8 hours of sleep. This allows a spellcaster that requires rest to prepare spells to do so after only 2 hours, but does not allow a spellcaster to prepare spells more than once per day. The ring must be worn for a full week before it begins to work. If it is removed, the owner must wear it for another week to reattune it to himself.",
      bonus: 5,
      price: 2500,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of swimming",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This silver ring usually has fishlike designs and motifs etched into the band. It continually grants the wearer a +5 competence bonus on Swim checks.",
      bonus: 5,
      price: 2500,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of sacred mistletoe",
      availability: 5,
      exclusiveClasses: ["Druid"],
      description:
          "This tiny ring of living mistletoe coils about the wearer's finger of its own accord. The wearer gains a +2 competence bonus on Handle Animal, Knowledge (nature), and wild empathy checks, and a wearer with the woodland stride ability can move effortlessly, without harm or impediment, even through magically created or manipulated plants. This does not allow the wearer to move through solid objects or creatures. Furthermore, the wearer can use shillelagh once per day.",
      bonus: 2,
      price: 6000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of mind shielding",
      availability: 6,
      exclusiveClasses: [],
      description:
          "This ring is usually of fine workmanship and wrought from heavy gold. The wearer is continually immune to detect thoughts, discern lies, and any attempt to magically discern her alignment.",
      bonus: null,
      price: 8000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of force shield",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This ring generates a shield-sized (and shield-shaped) wall of force that stays with the ring and can be wielded by the wearer as if it were a heavy shield (+2 AC). This special creation has no armor check penalty or arcane spell failure chance since it is weightless and encumbrance-free. It can be activated and deactivated at will as a free action.",
      bonus: 2,
      price: 8500,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Scholar's ring",
      availability: 5,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Cleric",
        "Sorcerer",
        "Summoner"
      ],
      description:
          "A scholar's ring grants complete understanding of any written text or spoken language, even one that the wearer has never encountered before (as the comprehend languages spell), as well as a +5 competence bonus on Knowledge (history) checks. In addition, once every 5 days the wearer can invoke a legend lore spell related to a subject that she has been studying in the previous week, if she has attempted a Knowledge (history) check aided by the ring.",
      bonus: 5,
      price: 8700,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of foe focus",
      availability: 5,
      exclusiveClasses: [],
      description:
          "This ring of jagged steel gives the impression that it was salvaged from a suit of armor and then crudely bent into a circle. The wearer of the ring can, at will, designate any one opponent she can see as a particularly dangerous foe. She gains a +2 bonus to her AC and saving throws against attacks made by that opponent until she designates a new enemy.",
      bonus: null,
      price: 10000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of ki mastery",
      availability: 6,
      exclusiveClasses: ["Monk"],
      description:
          "This ring is half onyx and half clear-white crystal, magically fused together and hardened to the strength of steel. It allows a wearer with a ki pool to store up to 2 ki points in the ring as a swift action. These points remain in the ring until used. The wearer can use the ki points normally, or can gain the following benefits when he has ki points stored in the ring. As long as there is at least one ki point stored in the ring, the wearer gains a +2 bonus to CMD against grapple, reposition, and trip attempts. As long as there are at least 2 ki points stored in the ring, the wearer reduces the number of ki points needed to use a ninja trick or ki ability by 1 (minimum 1 ki point).",
      bonus: null,
      price: 10000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of animal friendship",
      availability: 5,
      exclusiveClasses: ["Druid"],
      description:
          "A ring of animal friendship always bears some sort of animal-like design in its craftsmanship. On command, this ring affects an animal as if the wearer had cast charm animal, causing the animal to regard the wearer as a trusted friend.",
      bonus: null,
      price: 10800,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Decoy ring",
      availability: 7,
      exclusiveClasses: [],
      description:
          "This ring is a thick loop of mirrorlike metal. Whenever the wearer of this ring takes the withdraw action or becomes helpless (including falling unconscious), it instantly makes her invisible for 3 rounds and creates four illusory duplicates that either run off in opposite directions or perform other plausible actions that could draw enemy attention away from her. The duplicates last for 3 rounds before disappearing, but they instantly pop out of existence if struck by an attack (AC 10) and can be disbelieved (Will DC 19). Allies of the wearer always know her true location and can freely provide aid or assistance to her.",
      bonus: null,
      price: 12000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of ectoplasmic invigoration",
      availability: 6,
      exclusiveClasses: ["Summoner"],
      description:
          "A summoner wearing a ring of ectoplasmic invigoration can use his maker's call class feature to absorb his eidolon (dismissing it in the process) instead of bringing it to his side. He gains 2 temporary hit points per Hit Die of the eidolon and the benefits of a lesser restoration spell. The eidolon must still be within range of his maker's call ability. Any temporary hit points gained fade after 1 hour or when the eidolon is summoned again. A wearer with the transposition ability can transport himself to the eidolon's square (still absorbing and dismissing it) rather than calling the eidolon to him.",
      bonus: null,
      price: 12000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of energy resistance (lesser)",
      availability: 5,
      exclusiveClasses: [],
      description:
          "Rings of this type come in a wide variety of designs and colorations, typically related to the types of energy they defend against. These rings continually protect their wearers from damage from one type of energy—acid, cold, electricity, fire, or sonic (chosen by the creator of the item; determine randomly if found as part of a treasure hoard). Each time the wearer would normally take such damage, subtract 10 points from the damage dealt.",
      bonus: null,
      price: 12500,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of energy resistance",
      availability: 8,
      exclusiveClasses: [],
      description:
          "Rings of this type come in a wide variety of designs and colorations, typically related to the types of energy they defend against. These rings continually protect their wearers from damage from one type of energy—acid, cold, electricity, fire, or sonic (chosen by the creator of the item; determine randomly if found as part of a treasure hoard). Each time the wearer would normally take such damage, subtract 20 points from the damage dealt.",
      bonus: null,
      price: 12500,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of energy resistance (greater)",
      availability: 13,
      exclusiveClasses: [],
      description:
          "Rings of this type come in a wide variety of designs and colorations, typically related to the types of energy they defend against. These rings continually protect their wearers from damage from one type of energy—acid, cold, electricity, fire, or sonic (chosen by the creator of the item; determine randomly if found as part of a treasure hoard). Each time the wearer would normally take such damage, subtract 30 points from the damage dealt.",
      bonus: null,
      price: 12500,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of chameleon power",
      availability: 8,
      exclusiveClasses: [],
      description:
          "As a free action, the wearer of this ring can gain the ability to magically blend in with her surroundings. This provides a +10 competence bonus on her Stealth checks. As a standard action, she can also use the spell disguise self as often as she wants.",
      bonus: 10,
      price: 12700,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of the sea strider",
      availability: 6,
      exclusiveClasses: [],
      description:
          "This ring is made of a single piece of deep blue crystal. The ring grants its wearer a swim speed of 30 feet, as well as +8 racial bonus on swim checks for having a swim speed. Furthermore, once per day as a swift action, as long as the wearer is in contact with liquid, he can use dimension door as the spell, but its starting and ending points must be connected by a contagious mass of liquid.",
      bonus: null,
      price: 14500,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of inner fortitude (lesser)",
      availability: 8,
      exclusiveClasses: [],
      description:
          "Alternating diamonds and rubies stud this band of white gold. A minor ring of fortitude reduces ability damage or temporary ability penalties the wearer takes by 2 points and ability drain by 1 point. If an effect targets multiple ability scores (for example, exhaustion, fatigue, or touch of idiocy), the ring reduces the damage, drain, or penalty for all ability scores.",
      bonus: null,
      price: 18000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of inner fortitude",
      availability: 12,
      exclusiveClasses: [],
      description:
          "Alternating diamonds and rubies stud this band of white gold.A major ring of inner fortitude reduces ability damage or temporary penalties by 4 points and reduces ability drain by 2 points. If an effect targets multiple ability scores (for example, exhaustion, fatigue, or touch of idiocy), the ring reduces the damage, drain, or penalty for all ability scores.",
      bonus: null,
      price: 42000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of inner fortitude (greater)",
      availability: 16,
      exclusiveClasses: [],
      description:
          "Alternating diamonds and rubies stud this band of white gold. A greater ring of inner fortitude reduces ability damage or temporary penalties by 6 points and reduces ability drain by 3 points. If an effect targets multiple ability scores (for example, exhaustion, fatigue, or touch of idiocy), the ring reduces the damage, drain, or penalty for all ability scores.",
      bonus: null,
      price: 66000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of water walking",
      availability: 7,
      exclusiveClasses: [],
      description:
          "This ring is often made of coral or bluish metal decorated with motifs depicting rolling waves of water. The ring allows the wearer to continually utilize the effects of the spell water walk.",
      bonus: null,
      price: 15000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of energy shroud",
      availability: 9,
      exclusiveClasses: [],
      description:
          "A ring of energy shroud always appears to be glass or crystal in construction, tinted in a red, green, blue, or yellow hue. Closer inspection reveals a small band of metal within the glass or crystal. Treasured by frontline fighters and anyone with a trusted evoker ally, rings of energy shroud normally function as a minor ring of energy resistance. However, once per day as an immediate action, the ring's wearer can negate the damage of an incoming acid, cold, electricity, or fire energy effect for himself (but not for other creatures affected by the spell or effect), transforming that damage into a shroud of energy that wreathes the wearer's body acting as if under the effects of the elemental aura spell (Advanced Player's Guide). The elemental aura effect has the same energy type of the damage negated.",
      bonus: null,
      price: 19500,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of arcane mastery",
      availability: 10,
      exclusiveClasses: ["Arcanist"],
      description:
          "This ring is a thin but sturdy piece of forged steel crafted to resemble a serpent swallowing its tail, and is magically imbued to reveal the secrets of arcane mastery to its wearer. The ring allows a wearer with an arcane pool to store up to 4 points from his arcane pool in the ring as a swift action. These points remain in the ring until used. A wearer can spend arcane pool points stored in the ring as if they were his own, or can spend them in each of the following ways: 1 - As a free action, the wearer can expend 1 arcane pool point stored in the ring to gain a +2 bonus on Concentration checks for 1 round; 2 - As a standard action, the wearer can expend 1 arcane pool point stored in the ring to use the pool strike magus arcana using his own magus level to determine the effect; 3 - As an immediate action, the wearer can expend up to 4 arcane pool points stored in the ring to use the reflection magus arcana .",
      bonus: null,
      price: 20000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of invisibility",
      availability: 8,
      exclusiveClasses: [],
      description:
          "By activating this simple silver ring, the wearer can benefit from invisibility, as the spell.",
      bonus: null,
      price: 20000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of evasion",
      availability: 10,
      exclusiveClasses: [],
      description:
          "This ring continually grants the wearer the ability to avoid damage as if she had evasion. Whenever she makes a Reflex saving throw to determine whether she takes half damage, a successful save results in no damage.",
      bonus: null,
      price: 25000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of blinking",
      availability: 10,
      exclusiveClasses: ["Wizard", "Arcanist", "Sorcerer", "Summoner", "Rogue"],
      description:
          "On command, this ring makes the wearer blink, as the blink spell.",
      bonus: null,
      price: 27000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of return",
      availability: 12,
      exclusiveClasses: ["Ranger"],
      description:
          "This gold ring is set with three stones: blue, green, and red. Three times per day, the wearer of the ring can, as a move action, use it to form a link with the particular 5-foot square she occupies at that moment. This causes one of the stones on the ring to glow. As a swift action, the wearer of the ring can teleport to any unoccupied linked square within 100 feet.",
      bonus: null,
      price: 33600,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of freedom of movement",
      availability: 12,
      exclusiveClasses: [],
      description:
          "This gold ring allows the wearer to act as if continually under the effect of a freedom of movement spell.",
      bonus: null,
      price: 40000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of delayed doom",
      availability: 13,
      exclusiveClasses: [],
      description:
          "Whenever the mind or body of this ring's wearer first becomes subject to any harmful effect that allows a saving throw to resist or mitigate it, he may, as an immediate action, choose to delay the onset of that effect for 1 minute, after he fails the saving throw but before its effects occur. This activation causes one of the ring's nine garnets to turn to powder. When that minute passes, the wearer may continue to delay the onset of this harmful effect an additional minute as an immediate action by willing the ring to do so, which destroys another garnet, thus repeating the cycle for another minute. The delayed harmful effect occurs when the wearer falls unconscious, when the ring is removed, or 1 minute after the last time the ring's power activated; rounds spent delaying the effect do not count toward the effect's duration (for example, a curse that lasts 5 rounds takes effect for a full 5 rounds, even if the wearer delayed its effect several minutes). Effects that protect against or negate the harmful effect work normally while it is delayed. The price of the ring is reduced by 5,000 gp for each of its garnets that ha sbeen destroyed.",
      bonus: null,
      price: 45000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of wizardry I",
      availability: 7,
      exclusiveClasses: ["Wizard", "Arcanist", "Sorcerer", "Summoner"],
      description:
          "This special ring comes in four varieties, all of them useful only to arcane spellcasters. The wearer's 1st level spells per day are doubled",
      bonus: null,
      price: 20000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of wizardry II",
      availability: 10,
      exclusiveClasses: ["Wizard", "Arcanist", "Sorcerer", "Summoner"],
      description:
          "This special ring comes in four varieties, all of them useful only to arcane spellcasters. The wearer's 2nd level spells per day are doubled",
      bonus: null,
      price: 40000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of wizardry III",
      availability: 13,
      exclusiveClasses: ["Wizard", "Arcanist", "Sorcerer", "Summoner"],
      description:
          "This special ring comes in four varieties, all of them useful only to arcane spellcasters. The wearer's 3rd level spells per day are doubled",
      bonus: null,
      price: 70000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of wizardry IV",
      availability: 16,
      exclusiveClasses: ["Wizard", "Arcanist", "Sorcerer", "Summoner"],
      description:
          "This special ring comes in four varieties, all of them useful only to arcane spellcasters. The wearer's 4th level spells per day are doubled",
      bonus: null,
      price: 100000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of telekinesis",
      availability: 14,
      exclusiveClasses: [],
      description:
          "This ring, knotted with metallic tendrils encasing a setting of red and amber gemstones, allows the caster to use the spell telekinesis on command, lifting and manipulating objects at a distance using only her mind.",
      bonus: null,
      price: 75000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of regeneration",
      availability: 15,
      exclusiveClasses: [],
      description:
          "This white gold ring is generally set with a large green sapphire. When worn, the ring continually allows a living wearer to heal 1 point of damage per round and an equal amount of nonlethal damage. In addition, the wearer is immune to bleed damage while wearing a ring of regeneration. If the wearer loses a limb, an organ, or any other body part while wearing this ring, the ring regenerates it as the spell regenerate. In either case, only damage taken while wearing the ring is regenerated.",
      bonus: null,
      price: 90000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of spell turning",
      availability: 15,
      exclusiveClasses: [],
      description:
          "Up to three times per day on command, this simple platinum band automatically reflects the next nine levels of spells cast at the wearer, exactly as if spell turning had been cast upon him.",
      bonus: null,
      price: 100000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of djinni calling",
      availability: 18,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Druid",
        "Cleric"
      ],
      description:
          "This 'genie' ring serves as a special gate by means of which a specific djinni can be called from the Plane of Air. When the ring is rubbed (a standard action), the call goes out, and the djinni appears on the next round. The djinni faithfully obeys and serves the wearer of the ring, but never for more than 1 hour per day. If the djinni of the ring is ever killed, the ring becomes nonmagical and worthless.",
      bonus: null,
      price: 125000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of elemental command (air)",
      availability: 19,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Druid",
        "Cleric"
      ],
      description:
          "Elementals of the plane to which the ring is attuned can't attack the wearer, or even approach within 5 feet of her. If the wearer desires, she may forgo this protection and instead attempt to charm the elemental (as charm monster, Will DC 17 negates). If the charm attempt fails, however, absolute protection is lost and no further attempt at charming can be made. Creatures from the plane to which the ring is attuned that attack the wearer take a –1 penalty on their attack rolls. The ring wearer makes applicable saving throws against the extraplanar creature's attacks with a +2 resistance bonus. She gains a +4 morale bonus on all attack rolls against such creatures. Any weapons he uses bypasses the damage reduction of such creatures, regardless of any qualities the weapon may or may not have. The wearer of the ring is able to converse with creatures from the plane to which her ring is attuned. These creatures recognize that she wears the ring, and show a healthy respect for the wearer if their alignments are similar. If alignments are opposed, creatures fear the wearer if she is strong. If she is weak, they hate and desire to slay her. In addition to the powers described above, te elemental ring of air gives its wearer the following abilities: Wind wall (unlimited use); Feather fall (unlimited use, wearer only); Resist energy (electricity) (unlimited use, wearer only); Gust of wind (twice per day); Air walk (once per day, wearer only); Chain lightning (once per week).",
      bonus: null,
      price: 20000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of elemental command (earth)",
      availability: 19,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Druid",
        "Cleric"
      ],
      description:
          "Elementals of the plane to which the ring is attuned can't attack the wearer, or even approach within 5 feet of her. If the wearer desires, she may forgo this protection and instead attempt to charm the elemental (as charm monster, Will DC 17 negates). If the charm attempt fails, however, absolute protection is lost and no further attempt at charming can be made. Creatures from the plane to which the ring is attuned that attack the wearer take a –1 penalty on their attack rolls. The ring wearer makes applicable saving throws against the extraplanar creature's attacks with a +2 resistance bonus. She gains a +4 morale bonus on all attack rolls against such creatures. Any weapons he uses bypasses the damage reduction of such creatures, regardless of any qualities the weapon may or may not have. The wearer of the ring is able to converse with creatures from the plane to which her ring is attuned. These creatures recognize that she wears the ring, and show a healthy respect for the wearer if their alignments are similar. If alignments are opposed, creatures fear the wearer if she is strong. If she is weak, they hate and desire to slay her. In addition to the powers described above, te elemental ring of earth gives its wearer the following abilities: Soften earth and stone (unlimited use); Meld into stone (unlimited use, wearer only); Stone shape (twice per day); Wall of stone (once per day); Stoneskin (once per week, wearer only); Passwall (twice per week).",
      bonus: null,
      price: 20000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of elemental command (fire)",
      availability: 19,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Druid",
        "Cleric"
      ],
      description:
          "Elementals of the plane to which the ring is attuned can't attack the wearer, or even approach within 5 feet of her. If the wearer desires, she may forgo this protection and instead attempt to charm the elemental (as charm monster, Will DC 17 negates). If the charm attempt fails, however, absolute protection is lost and no further attempt at charming can be made. Creatures from the plane to which the ring is attuned that attack the wearer take a –1 penalty on their attack rolls. The ring wearer makes applicable saving throws against the extraplanar creature's attacks with a +2 resistance bonus. She gains a +4 morale bonus on all attack rolls against such creatures. Any weapons he uses bypasses the damage reduction of such creatures, regardless of any qualities the weapon may or may not have. The wearer of the ring is able to converse with creatures from the plane to which her ring is attuned. These creatures recognize that she wears the ring, and show a healthy respect for the wearer if their alignments are similar. If alignments are opposed, creatures fear the wearer if she is strong. If she is weak, they hate and desire to slay her. In addition to the powers described above, te elemental ring of fire gives its wearer the following abilities: Resist energy (fire) (as a major ring of energy resistance [fire]); Burning hands (unlimited use); Flaming sphere (twice per day); Pyrotechnics (twice per day); Wall of fire (once per day); Flame strike (twice per week).",
      bonus: null,
      price: 20000,
    ),
    WonderousItemsModel(
      type: "Ring",
      name: "Ring of elemental command (water)",
      availability: 19,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Druid",
        "Cleric"
      ],
      description:
          "Elementals of the plane to which the ring is attuned can't attack the wearer, or even approach within 5 feet of her. If the wearer desires, she may forgo this protection and instead attempt to charm the elemental (as charm monster, Will DC 17 negates). If the charm attempt fails, however, absolute protection is lost and no further attempt at charming can be made. Creatures from the plane to which the ring is attuned that attack the wearer take a –1 penalty on their attack rolls. The ring wearer makes applicable saving throws against the extraplanar creature's attacks with a +2 resistance bonus. She gains a +4 morale bonus on all attack rolls against such creatures. Any weapons he uses bypasses the damage reduction of such creatures, regardless of any qualities the weapon may or may not have. The wearer of the ring is able to converse with creatures from the plane to which her ring is attuned. These creatures recognize that she wears the ring, and show a healthy respect for the wearer if their alignments are similar. If alignments are opposed, creatures fear the wearer if she is strong. If she is weak, they hate and desire to slay her. In addition to the powers described above, te elemental ring of water gives its wearer the following abilities: Create water (unlimited use); Water breathing (unlimited use); Water walk (unlimited use); Wall of ice (once per day); Ice storm (twice per week); Control water (twice per week).",
      bonus: null,
      price: 20000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Pearl of power (1st)",
      availability: 2,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Druid",
        "Cleric"
      ],
      description:
          "This seemingly normal pearl of average size and luster is a potent aid to all spellcasters who prepare spells. Once per day on command, a pearl of power enables the possessor to recall any one spell of first level that she had prepared and then cast that day. The spell is then prepared again, just as if it had not been cast.",
      bonus: null,
      price: 1000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Pearl of power (2nd)",
      availability: 5,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Druid",
        "Cleric"
      ],
      description:
          "This seemingly normal pearl of average size and luster is a potent aid to all spellcasters who prepare spells. Once per day on command, a pearl of power enables the possessor to recall any one spell of second level that she had prepared and then cast that day. The spell is then prepared again, just as if it had not been cast.",
      bonus: null,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Pearl of power (3rd)",
      availability: 7,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Druid",
        "Cleric"
      ],
      description:
          "This seemingly normal pearl of average size and luster is a potent aid to all spellcasters who prepare spells. Once per day on command, a pearl of power enables the possessor to recall any one spell of thirt level that she had prepared and then cast that day. The spell is then prepared again, just as if it had not been cast.",
      bonus: null,
      price: 9000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Pearl of power (4th)",
      availability: 9,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Druid",
        "Cleric"
      ],
      description:
          "This seemingly normal pearl of average size and luster is a potent aid to all spellcasters who prepare spells. Once per day on command, a pearl of power enables the possessor to recall any one spell of fourth level that she had prepared and then cast that day. The spell is then prepared again, just as if it had not been cast.",
      bonus: null,
      price: 16000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Pearl of power (5th)",
      availability: 11,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Druid",
        "Cleric"
      ],
      description:
          "This seemingly normal pearl of average size and luster is a potent aid to all spellcasters who prepare spells. Once per day on command, a pearl of power enables the possessor to recall any one spell of fifth level that she had prepared and then cast that day. The spell is then prepared again, just as if it had not been cast.",
      bonus: null,
      price: 25000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Pearl of power (6th)",
      availability: 13,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Druid",
        "Cleric"
      ],
      description:
          "This seemingly normal pearl of average size and luster is a potent aid to all spellcasters who prepare spells. Once per day on command, a pearl of power enables the possessor to recall any one spell of sixth level that she had prepared and then cast that day. The spell is then prepared again, just as if it had not been cast.",
      bonus: null,
      price: 36000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Pearl of power (7th)",
      availability: 15,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Druid",
        "Cleric"
      ],
      description:
          "This seemingly normal pearl of average size and luster is a potent aid to all spellcasters who prepare spells. Once per day on command, a pearl of power enables the possessor to recall any one spell of seventh level that she had prepared and then cast that day. The spell is then prepared again, just as if it had not been cast.",
      bonus: null,
      price: 49000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Pearl of power (8th)",
      availability: 16,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Druid",
        "Cleric"
      ],
      description:
          "This seemingly normal pearl of average size and luster is a potent aid to all spellcasters who prepare spells. Once per day on command, a pearl of power enables the possessor to recall any one spell of eigth level that she had prepared and then cast that day. The spell is then prepared again, just as if it had not been cast.",
      bonus: null,
      price: 64000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Pearl of power (9h)",
      availability: 17,
      exclusiveClasses: [
        "Wizard",
        "Arcanist",
        "Sorcerer",
        "Summoner",
        "Druid",
        "Cleric"
      ],
      description:
          "This seemingly normal pearl of average size and luster is a potent aid to all spellcasters who prepare spells. Once per day on command, a pearl of power enables the possessor to recall any one spell of ninth level that she had prepared and then cast that day. The spell is then prepared again, just as if it had not been cast.",
      bonus: null,
      price: 81000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Ioun Stone (clear)",
      availability: 5,
      exclusiveClasses: [],
      description: "Sustains creature without food or water",
      bonus: null,
      price: 4000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Ioun Stone (Pale lavender)",
      availability: 11,
      exclusiveClasses: [],
      description:
          "Absorbs spells of 4th level or lower. After absorbing 20 spell levels, the stone burns out and turns to dull gray, forever useless.",
      bonus: null,
      price: 20000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Ioun Stone (Pale green)",
      availability: 12,
      exclusiveClasses: [],
      description:
          "+1 competence bonus on attack rolls, saves, skill checks, and ability checks",
      bonus: 1,
      price: 30000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Ioun Stone (Lavender and green)",
      availability: 19,
      exclusiveClasses: [],
      description:
          "Absorbs spells of 8th level or lower. After absorbing 50 spell levels, the stone burns out and turns dull gray, forever useless.",
      bonus: null,
      price: 48000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Ioun Stone (Iridescent)",
      availability: 9,
      exclusiveClasses: [],
      description: "Sustains creature without air",
      bonus: null,
      price: 18000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Instant fortress",
      availability: 18,
      exclusiveClasses: ["Wizard", "Arcanist", "Sorcerer", "Summoner"],
      description:
          "This metal cube is small, but when activated by speaking a command word it grows to form a tower 20 feet square and 30 feet high, with arrow slits on all sides and a crenellated battlement atop it. The metal walls extend 10 feet into the ground, rooting it to the spot and preventing it from being tipped over. The fortress has a small door that opens only at the command of the owner of the fortress—even knock spells can't open the door. The adamantine walls of an instant fortress have 100 hit points and hardness 20. The fortress cannot be repaired except by a wish or a miracle, which restores 50 points of damage taken. The fortress springs up in just 1 round, with the door facing the device's owner. The door opens and closes instantly at his command. People and creatures nearby (except the owner) must be careful not to be caught by the fortress's sudden growth. Anyone so caught takes 10d10 points of damage (Reflex DC 19 halves). The fortress is deactivated by speaking a command word (different from the one used to activate it). It cannot be deactivated unless it is empty.",
      bonus: null,
      price: 55000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Lord's banner (victory)",
      availability: 18,
      exclusiveClasses: ["Warrior", "Barbarian", "Bandit"],
      description:
          "A lord's banner is a cloth flag or standard, typically at least 2 feet wide and 4 feet long (though some are up to twice that size), meant to be carried and displayed on a lance, polearm, frame, or staff. It has no effect when not mounted properly or when laying on the ground. It normally depicts the insignia or heraldic symbol of a particular noble. A lord's banner may be carried (on foot or mounted) or planted. In the latter case, the banner does not need a bearer, but if it is toppled or touched by an enemy, it loses its effectiveness until reclaimed and replanted by allies of its owner. Allies of the owner of a lord's banner of victory gain a +2 morale bonus on attack rolls, saves, and skill checks for as long as they can see the banner.",
      bonus: 2,
      price: 100000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Carpet of flying (small)",
      availability: 10,
      exclusiveClasses: ["Wizard", "Arcanist", "Sorcerer", "Summoner", "Rogue"],
      description:
          "This rug is able to fly through the air as if affected by an overland flight spell of unlimited duration. Size = 5-ft.-by-5-ft; capacity = 200 lbs; speed = 40ft.",
      bonus: null,
      price: 20000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Carpet of flying",
      availability: 14,
      exclusiveClasses: ["Wizard", "Arcanist", "Sorcerer", "Summoner", "Rogue"],
      description:
          "This rug is able to fly through the air as if affected by an overland flight spell of unlimited duration. Size = 5-ft.-by-10-ft; capacity = 400 lbs; speed = 40ft.",
      bonus: null,
      price: 35000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Carpet of flying (great)",
      availability: 18,
      exclusiveClasses: ["Wizard", "Arcanist", "Sorcerer", "Summoner", "Rogue"],
      description:
          "This rug is able to fly through the air as if affected by an overland flight spell of unlimited duration. Size = 10-ft.-by-10-ft; capacity = 800 lbs; speed = 40ft.",
      bonus: null,
      price: 60000,
    ),
    WonderousItemsModel(
      type: "Slotless",
      name: "Orb of pure law",
      availability: 18,
      exclusiveClasses: ["Paladin"],
      description:
          "This featureless gray stone is perfectly smooth and flawlessly polished. The bearer of an orb of pure law gains a +4 deflection bonus to AC against attacks from chaotic creatures and a +4 resistance bonus on saving throws against polymorph effects, effects with the chaotic descriptor, and effects that inflict the confused condition. When held in hand, the bearer of the orb may use detect chaos and detect law at will. A lawful creature may hold the orb in hand and command it to invoke dispel chaos and arrow of law each once per day. The orb bestows one permanent negative level on any chaotic creature holding or carrying it. The negative level remains as long as the creature has the orb and disappears immediately when the orb is no longer held or carried. This negative level cannot be overcome in any way (including by restoration spells) while the bearer has the orb.",
      bonus: 4,
      price: 60000,
    ),
  ];
}
