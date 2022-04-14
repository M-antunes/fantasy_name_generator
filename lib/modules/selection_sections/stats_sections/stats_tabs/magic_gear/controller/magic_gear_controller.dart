import 'package:fantasy_name_generator/models/combat_models/base_atribute_model.dart';

import '../../../../../../models/equip_models/magic_equip_models/wonderous_items_model.dart';
import '../../../../../../shared/utils/utils.dart';

class MagicGearController {
  final List<String> itemsLabel = [
    "Body",
    "Chest",
    "Eyes",
    "Feet",
    "Feet",
    "Hands",
    "Head",
    "Wrist",
    "Ring",
    "Slotless",
  ];

  List<WonderousItemsModel> addExtraIounStones(
      int level, List<WonderousItemsModel> list, String mainAtrb) {
    if (level < 9) {
      return [];
    }
    List<WonderousItemsModel> charList = [];
    var newIounStone = list
        .where((element) => element.name == "Ioun Stone (dusty rose)")
        .toList();
    charList.addAll(newIounStone);
    if (level < 11) {
      return [];
    }
    switch (mainAtrb) {
      case "strength":
        charList.addAll(findingRightIounStone("Ioun Stone (Pale blue)", list));
        break;
      case "dexterity":
        charList.addAll(findingRightIounStone("Ioun Stone (Deep red)", list));
        break;
      case "intelligence":
        charList.addAll(
            findingRightIounStone("Ioun Stone (Scarlet and blue)", list));
        break;
      case "wisdom":
        charList.addAll(
            findingRightIounStone("Ioun Stone (Incandescent blue)", list));
        break;
      default:
        charList
            .addAll(findingRightIounStone("Ioun Stone (Pink and green)", list));
    }
    return charList;
  }

  List<WonderousItemsModel> addIndispensableItem(
      List<WonderousItemsModel> list, int level) {
    var random = generateRandom(13);
    List<WonderousItemsModel> itemList = [];
    List<WonderousItemsModel> possibleItems = list;
    if (level == 1) {
      itemList = [];
    } else if (level > 2 && level < 8) {
      itemList = [possibleItems[0]];
    } else if (level > 7 && level < 11) {
      random < 6
          ? itemList = [possibleItems[0]]
          : itemList = [possibleItems[1]];
    } else if (level > 10 && level < 14) {
      random < 6
          ? itemList = [possibleItems[1]]
          : itemList = [possibleItems[2]];
    } else if (level > 13 && level < 17) {
      random < 6
          ? itemList = [possibleItems[2]]
          : itemList = [possibleItems[3]];
    } else {
      random < 5
          ? itemList = [possibleItems[3]]
          : itemList = [possibleItems[4]];
    }
    return itemList;
  }

  List<WonderousItemsModel> findingRightIounStone(
      String iounStone, List<WonderousItemsModel> list) {
    return list.where((element) => element.name == iounStone).toList();
  }

  List<WonderousItemsModel> findMagicItem(
      int lvAvailable, List<WonderousItemsModel> allitems, String className) {
    var list = allitems
        .where((element) =>
            element.availability <= lvAvailable &&
            (element.exclusiveClasses.isEmpty ||
                // ignore: iterable_contains_unrelated_type
                element.exclusiveClasses
                    .contains((element) => element == className)))
        .toList();
    return list;
  }

  List<String> findItemForBodyParts(int qnt) {
    List<String> listOfItemsForChar = [];
    List<String> listOfItemsLeft = [];
    listOfItemsLeft.addAll(itemsLabel);
    for (var i = 0; i < qnt; i++) {
      listOfItemsLeft.shuffle();
      var random = generateRandom(listOfItemsLeft.length);
      listOfItemsForChar.add(listOfItemsLeft[random]);
      if (listOfItemsLeft[random] != "Slotless") {
        listOfItemsLeft
            .removeWhere((element) => element == listOfItemsLeft[random]);
      }
    }
    return listOfItemsForChar;
  }

  List<WonderousItemsModel> getWonderousItems(int level, String combatStyle,
      String mainAtrb, List<WonderousItemsModel> allitems, String className) {
    var availableItems = findMagicItem(level, allitems, className);
    var numberOfItems = (level / 5).floor();
    var itemsPerBodyParts = findItemForBodyParts(numberOfItems);
    List<WonderousItemsModel> charMagicItems = [];
    for (var i = 0; i < numberOfItems; i++) {
      List<WonderousItemsModel> items = availableItems
          .where((element) => element.type == itemsPerBodyParts[i])
          .toList();
      var random = generateRandom(items.length);
      var newItem = items[random];
      while (charMagicItems.any((element) => element == items[random])) {
        var newRandom = generateRandom(items.length);
        newItem = items[newRandom];
      }
      charMagicItems.add(newItem);
    }
    if (((combatStyle == "Physical" || combatStyle == "Hybrid") && level > 6) ||
        (combatStyle == "Spellcaster" && level > 9)) {
      switch (mainAtrb) {
        case "strength":
          charMagicItems.addAll(adjustingItemForMainAtrbBoost(
              "Belt",
              "Belt of giant strength",
              "Belt of physical might",
              "Belt of physical perfection",
              level,
              allitems));
          break;
        case "dexterity":
          charMagicItems.addAll(adjustingItemForMainAtrbBoost(
              "Belt",
              "Belt of incredible dexterity",
              "Belt of physical might",
              "Belt of physical perfection",
              level,
              allitems));
          break;
        case "intelligence":
          charMagicItems.addAll(adjustingItemForMainAtrbBoost(
              "Belt",
              "Belt of mighty constitution",
              "Belt of physical might",
              "Belt of physical perfection",
              level,
              allitems));
          break;
        case "wisdom":
          charMagicItems.addAll(adjustingItemForMainAtrbBoost(
              "Belt",
              "Belt of mighty constitution",
              "Belt of physical might",
              "Belt of physical perfection",
              level,
              allitems));
          break;
        default:
          charMagicItems.addAll(adjustingItemForMainAtrbBoost(
              "Belt",
              "Belt of mighty constitution",
              "Belt of physical might",
              "Belt of physical perfection",
              level,
              allitems));
      }
    }
    if (((combatStyle == "Physical" || combatStyle == "Hybrid") && level > 9) ||
        (combatStyle == "Spellcaster" && level > 6)) {
      switch (mainAtrb) {
        case "strength":
          charMagicItems.addAll(adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of inspired wisdom",
              "Headband of mental prowess",
              "Headband of mental superiority",
              level,
              allitems));
          break;
        case "dexterity":
          charMagicItems.addAll(adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of inspired wisdom",
              "Headband of mental prowess",
              "Headband of mental superiority",
              level,
              allitems));
          break;
        case "intelligence":
          charMagicItems.addAll(adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of vast intelligence",
              "Headband of mental prowess",
              "Headband of mental superiority",
              level,
              allitems));
          break;
        case "wisdom":
          charMagicItems.addAll(adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of inspired wisdom",
              "Headband of mental prowess",
              "Headband of mental superiority",
              level,
              allitems));
          break;
        default:
          charMagicItems.addAll(adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of alluring charisma",
              "Headband of mental prowess",
              "Headband of mental superiority",
              level,
              allitems));
      }
    }
    return charMagicItems;
  }

  List<WonderousItemsModel> adjustingItemForMainAtrbBoost(
      String item,
      String lesser,
      String medium,
      String greater,
      int level,
      List<WonderousItemsModel> wonderous) {
    List<WonderousItemsModel> wonderousItems = [];

    var randomChance = generateRandom(11);
    if (level > 4 && level < 11) {
      wonderousItems = adjustingBeltOrHeadband(item, lesser, level, wonderous);
    } else if (level > 10 && level < 15) {
      randomChance < 4
          ? wonderousItems =
              adjustingBeltOrHeadband(item, lesser, level, wonderous)
          : wonderousItems =
              adjustingBeltOrHeadband(item, medium, level, wonderous);
    } else if (level > 14 && level < 21) {
      randomChance < 4
          ? wonderousItems =
              adjustingBeltOrHeadband(item, medium, level, wonderous)
          : wonderousItems =
              adjustingBeltOrHeadband(item, greater, level, wonderous);
    }
    return wonderousItems;
  }

  List<WonderousItemsModel> adjustingBeltOrHeadband(String item,
      String itemName, int level, List<WonderousItemsModel> allItems) {
    var min = discoverMinAvailability(level);
    List<WonderousItemsModel> wonderousItems = [];
    var list = allItems
        .where((element) =>
            element.name!.contains(itemName) &&
            element.availability <= level &&
            element.availability >= min)
        .toList();
    wonderousItems.removeWhere((element) => element.type == item);
    var random = generateRandom(11);
    random > 6 ? wonderousItems.add(list.last) : wonderousItems.add(list.first);
    return wonderousItems;
  }

  AtributeModel getAtrbBoostFromWonderousItem(
      List<WonderousItemsModel>? charItems,
      int level,
      String mainAtrb,
      AtributeModel charAtrb) {
    AtributeModel atrbBoost = AtributeModel();
    if (charItems == null) {
      return atrbBoost;
    }
    if (charItems.isEmpty) {
      return atrbBoost;
    }
    //Boost in atribute from iounstone (mandatory)
    if (level > 11) {
      switch (mainAtrb) {
        case "strength":
          atrbBoost.strength += 2;
          break;
        case "dexterity":
          atrbBoost.dexterity += 2;
          break;
        case "intelligence":
          atrbBoost.intelligence += 2;
          break;
        case "wisdom":
          atrbBoost.wisdom += 2;
          break;
        default:
          atrbBoost.charisma += 2;
      }
    }
    List<WonderousItemsModel> list = charItems;
    AtributeModel mentalAtr = AtributeModel();
    AtributeModel physicalAtr = AtributeModel();
    List<int> boosts = [];
    if (list.any((element) => element.type == "Belt")) {
      if (mainAtrb == "strength") {
        boosts = identifyBoost(list, "might", "perfection", "Belt");
        if (boosts.length == 3) {
          physicalAtr.strength = boosts.first;
          physicalAtr.dexterity = boosts.first;
          physicalAtr.constitution = boosts.first;
        } else if (boosts.length == 2) {
          physicalAtr.strength = boosts.first;
          physicalAtr.constitution = boosts.first;
        } else if (boosts.length == 1) {
          physicalAtr.strength = boosts.first;
        }
      } else if (mainAtrb == "dexterity") {
        boosts = identifyBoost(list, "might", "perfection", "Belt");
        if (boosts.length == 3) {
          physicalAtr.strength = boosts.first;
          physicalAtr.dexterity = boosts.first;
          physicalAtr.constitution = boosts.first;
        } else if (boosts.length == 2) {
          physicalAtr.dexterity = boosts.first;
          physicalAtr.constitution = boosts.first;
        } else if (boosts.length == 1) {
          physicalAtr.dexterity = boosts.first;
        }
      } else {
        boosts = identifyBoost(list, "might", "perfection", "Belt");
        if (boosts.length == 3) {
          physicalAtr.strength = boosts.first;
          physicalAtr.dexterity = boosts.first;
          physicalAtr.constitution = boosts.first;
        } else if (boosts.length == 2) {
          physicalAtr.dexterity = boosts.first;
          physicalAtr.constitution = boosts.first;
        } else if (boosts.length == 1) {
          physicalAtr.constitution = boosts.first;
        }
      }
    }
    if (list.any((element) => element.type == "Headband")) {
      if (mainAtrb == "intelligence") {
        boosts = identifyBoost(list, "prowess", "superiority", "Headband");
        if (boosts.length == 3) {
          mentalAtr.intelligence = boosts.first;
          mentalAtr.wisdom = boosts.first;
          mentalAtr.charisma = boosts.first;
        } else if (boosts.length == 2) {
          mentalAtr.intelligence = boosts.first;
          mentalAtr.charisma = boosts.first;
        } else if (boosts.length == 1) {
          mentalAtr.intelligence = boosts.first;
        }
      } else if (mainAtrb == "wisdom") {
        boosts = identifyBoost(list, "prowess", "superiority", "Headband");
        if (boosts.length == 3) {
          mentalAtr.intelligence = boosts.first;
          mentalAtr.wisdom = boosts.first;
          mentalAtr.charisma = boosts.first;
        } else if (boosts.length == 2) {
          mentalAtr.intelligence = boosts.first;
          mentalAtr.wisdom = boosts.first;
        } else if (boosts.length == 1) {
          mentalAtr.wisdom = boosts.first;
        }
      } else if (mainAtrb == "charisma") {
        boosts = identifyBoost(list, "prowess", "superiority", "Headband");
        if (boosts.length == 3) {
          mentalAtr.intelligence = boosts.first;
          mentalAtr.wisdom = boosts.first;
          mentalAtr.charisma = boosts.first;
        } else if (boosts.length == 2) {
          mentalAtr.charisma = boosts.first;
          mentalAtr.wisdom = boosts.first;
        } else if (boosts.length == 1) {
          mentalAtr.charisma = boosts.first;
        }
      } else {
        boosts = identifyBoost(list, "prowess", "superiority", "Headband");
        if (boosts.length == 3) {
          mentalAtr.intelligence = boosts.first;
          mentalAtr.wisdom = boosts.first;
          mentalAtr.charisma = boosts.first;
        } else if (boosts.length == 2) {
          mentalAtr.intelligence = boosts.first;
          mentalAtr.wisdom = boosts.first;
        } else if (boosts.length == 1) {
          mentalAtr.wisdom = boosts.first;
        }
      }
    }
    charAtrb.strength += physicalAtr.strength;
    charAtrb.dexterity += physicalAtr.dexterity;
    charAtrb.constitution += physicalAtr.constitution;
    charAtrb.intelligence += mentalAtr.intelligence;
    charAtrb.wisdom += mentalAtr.wisdom;
    charAtrb.charisma += mentalAtr.charisma;
    return charAtrb;
  }

  identifyBoost(
      List<WonderousItemsModel> list, String dual, String all, String type) {
    WonderousItemsModel? boostyItem;
    List<int> boosts = [];
    for (var i = 0; i < list.length; i++) {
      if (list[i].name!.contains(type)) {
        boostyItem = list[i];
        if (boostyItem.name!.contains(dual)) {
          boosts.add(boostyItem.bonus!);
          boosts.add(boostyItem.bonus!);
        } else if (boostyItem.name!.contains(all)) {
          boosts.add(boostyItem.bonus!);
          boosts.add(boostyItem.bonus!);
          boosts.add(boostyItem.bonus!);
        } else {
          boosts.add(boostyItem.bonus!);
        }
        return boosts;
      }
    }
  }

  WonderousItemsModel findTomeOrManual(
      String atrb, List<WonderousItemsModel> books, int level) {
    List<WonderousItemsModel> list = books
        .where((element) =>
            element.availability <= level &&
            element.description!.contains(atrb))
        .toList();
    return list.last;
  }

  List<WonderousItemsModel> getTomesOrManuals(int level, String mainAtrb,
      List<WonderousItemsModel> books, String battleStyle) {
    List<WonderousItemsModel> tomesAndManuals = [];
    if (level < 15) {
      return [];
    }
    List<WonderousItemsModel> boostBooks = [];
    if (level > 14 && level < 18) {
      boostBooks.add(findTomeOrManual(mainAtrb, books, level));
      boostBooks.add(findTomeOrManual("constitution", books, level));
      tomesAndManuals.addAll(boostBooks);
    } else if (level > 17 && level < 21) {
      boostBooks.add(findTomeOrManual(mainAtrb, books, level));
      boostBooks.add(findTomeOrManual("constitution", books, level));
      if ((battleStyle == "Hybrid" || battleStyle == "Spellcaster") &&
          mainAtrb != "dexterity") {
        boostBooks.add(findTomeOrManual("dexterity", books, level));
        tomesAndManuals.add(boostBooks.last);
      } else {
        boostBooks.add(findTomeOrManual("wisdom", books, level));
        tomesAndManuals.addAll(boostBooks);
      }
    }
    return tomesAndManuals;
  }

  AtributeModel boostWithTomeOrManual(
      int level,
      String mainAtrb,
      List<WonderousItemsModel> books,
      List<WonderousItemsModel> charBooks,
      String battleStyle,
      AtributeModel charAtrb) {
    AtributeModel atribute = AtributeModel();
    if (level < 15) {
      return charAtrb;
    }
    List<WonderousItemsModel> boostBooks = charBooks;
    if (level > 14 && level < 18) {
      atribute = bosstRightAtributeWithTomeOrManual(
          [mainAtrb, "constitution"], boostBooks.last.bonus!, 0);
    } else if (level > 17 && level < 21) {
      if ((battleStyle == "Hybrid" || battleStyle == "Spellcaster") &&
          mainAtrb != "dexterity") {
        atribute = bosstRightAtributeWithTomeOrManual(
            [mainAtrb, "constitution", "dexterity"], boostBooks.last.bonus!, 0);
      } else {
        atribute = bosstRightAtributeWithTomeOrManual(
            [mainAtrb, "constitution", "wisdom"], boostBooks.last.bonus!, 0);
      }
    }
    charAtrb.strength += atribute.strength;
    charAtrb.dexterity += atribute.dexterity;
    charAtrb.constitution += atribute.constitution;
    charAtrb.intelligence += atribute.intelligence;
    charAtrb.wisdom += atribute.wisdom;
    charAtrb.charisma += atribute.charisma;
    return charAtrb;
  }

  AtributeModel bosstRightAtributeWithTomeOrManual(
      List<String> atrb, int boost, int noBoost) {
    AtributeModel atribute = AtributeModel();
    atribute.strength = atrb.contains("strength") ? boost : noBoost;
    atribute.dexterity = atrb.contains("dexterity") ? boost : noBoost;
    atribute.constitution = atrb.contains("constitution") ? boost : noBoost;
    atribute.intelligence = atrb.contains("intelligence") ? boost : noBoost;
    atribute.wisdom = atrb.contains("wisdom") ? boost : noBoost;
    atribute.charisma = atrb.contains("charisma") ? boost : noBoost;
    return atribute;
  }
}
