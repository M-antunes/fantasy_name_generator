import '../../../../../../models/equip_models/wonderous_items_model.dart';
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
    if (level == 1) {
      itemList = [];
    } else if (level > 2 && level < 8) {
      itemList.isEmpty ? itemList = [] : itemList.add(list[0]);
    } else if (level > 7 && level < 11) {
      random < 6 ? itemList.add(list[0]) : itemList.add(list[1]);
    } else if (level > 10 && level < 14) {
      random < 6 ? itemList.add(list[1]) : itemList.add(list[2]);
    } else if (level > 13 && level < 17) {
      random < 6 ? itemList.add(list[2]) : itemList.add(list[3]);
    } else {
      random < 5 ? itemList.add(list[3]) : itemList.add(list[4]);
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
}
