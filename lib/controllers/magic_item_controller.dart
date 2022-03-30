import 'dart:math';

import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/equip_models/wonderous_items_model.dart';
import 'package:fantasy_name_generator/shared/data/wonderous_items_data.dart';
import 'package:flutter/cupertino.dart';

class MagicItemController extends ChangeNotifier {
  CharModel? character;
  var listOfWonderousItems = WonderousItemsData();
  Random randomIndex = Random();

  final List<String> itemsLabel = [
    "Belt",
    "Belt",
    "Belt",
    "Body",
    "Chest",
    "Eyes",
    "Feet",
    "Feet",
    "Hands",
    "Head",
    "Headband",
    "Headband",
    "Headband",
    "Neck",
    "Wrist",
    "Ring",
    "Slotless",
    "Slotless",
  ];

  bool magicItemsGenerated = false;

// section for applying magic to weapon

// Section for wonderouns items

  updateMagicItems() {
    magicItemsGenerated = !magicItemsGenerated;
    notifyListeners();
  }

  generateMagicEquip() {
    generateMagicItems();

    updateMagicItems();
  }

  resetItems() {
    character!.charEquip.wonderousItems = [];
    updateMagicItems();
  }

  List<String> findItemForBodyParts(int qnt) {
    List<String> listOfItemsForChar = [];
    List<String> listOfItemsLeft = [];
    listOfItemsLeft.addAll(itemsLabel);
    for (var i = 0; i < qnt; i++) {
      listOfItemsLeft.shuffle();
      var random = randomIndex.nextInt(listOfItemsLeft.length);
      if (random == listOfItemsLeft.length) {
        random--;
      }
      listOfItemsForChar.add(listOfItemsLeft[random]);
      if (listOfItemsLeft[random] != "Slotless") {
        listOfItemsLeft
            .removeWhere((element) => element == listOfItemsLeft[random]);
      }
    }
    return listOfItemsForChar;
  }

  int discoverMinAvailability(int lvAvailable) {
    var minLvAvailable = 0;
    if (lvAvailable > 8) {
      minLvAvailable = lvAvailable - 8;
    }
    return minLvAvailable;
  }

  List<WonderousItemsModel> findMagicItem(int lvAvailable) {
    var minLvAvailable = discoverMinAvailability(lvAvailable);
    var list = listOfWonderousItems.allItems
        .where((element) =>
            element.availability <= lvAvailable &&
            element.availability >= minLvAvailable &&
            (element.exclusiveClasses.isEmpty ||
                // ignore: iterable_contains_unrelated_type
                element.exclusiveClasses.contains(
                    (element) => element == character!.charClass.name)))
        .toList();
    return list;
  }

  generateMagicItems() {
    if (character!.charLevel < 4) {
      var random = randomIndex.nextInt(10);
      random < 5
          ? addIndispensableItem(listOfWonderousItems.protRings)
          : addIndispensableItem(listOfWonderousItems.resistCloaks);
      return;
    }
    var availableItems = findMagicItem(character!.charLevel);
    var numberOfItems = (character!.charLevel / 4).floor();
    var itemsPerBodyParts = findItemForBodyParts(numberOfItems);
    List<WonderousItemsModel> charMagicItems = [];
    for (var i = 0; i < numberOfItems; i++) {
      List<WonderousItemsModel> items = availableItems
          .where((element) => element.type == itemsPerBodyParts[i])
          .toList();
      var random = randomIndex.nextInt(items.length);
      if (random == items.length) {
        random--;
      }
      charMagicItems.add(items[random]);
    }
    character!.charEquip.wonderousItems = charMagicItems;
    if (itemsPerBodyParts.any((element) => element == "Belt")) {
      switch (character!.charClass.mainAtrb) {
        case "Str":
          adjustingItemForMainAtrbBoost("Belt", "Belt of giant strength",
              "Belt of physical might", "Belt of physical perfection");
          break;
        case "Dex":
          adjustingItemForMainAtrbBoost("Belt", "Belt of incredible dexterity",
              "Belt of physical might", "Belt of physical perfection");
          break;
        case "Int":
          adjustingItemForMainAtrbBoost("Belt", "Belt of mighty constitution",
              "Belt of physical might", "Belt of physical perfection");
          break;
        case "Wis":
          adjustingItemForMainAtrbBoost("Belt", "Belt of mighty constitution",
              "Belt of physical might", "Belt of physical perfection");
          break;
        default:
          adjustingItemForMainAtrbBoost("Belt", "Belt of mighty constitution",
              "Belt of physical might", "Belt of physical perfection");
      }
    }
    if (itemsPerBodyParts.any((element) => element == "Headband")) {
      switch (character!.charClass.mainAtrb) {
        case "Str":
          adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of inspired wisdom",
              "Headband of mental prowess",
              "Headband of mental superiority");
          break;
        case "Dex":
          adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of inspired wisdom",
              "Headband of mental prowess",
              "Headband of mental superiority");
          break;
        case "Int":
          adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of vast intelligence",
              "Headband of mental prowess",
              "Headband of mental superiority");
          break;
        case "Wis":
          adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of inspired wisdom",
              "Headband of mental prowess",
              "Headband of mental superiority");
          break;
        default:
          adjustingItemForMainAtrbBoost(
              "Headband",
              "Headband of alluring charisma",
              "Headband of mental prowess",
              "Headband of mental superiority");
      }
    }
    addIndispensableItem(listOfWonderousItems.protRings);
    addIndispensableItem(listOfWonderousItems.resistCloaks);
    adjustingIounStoneToClass();
    addExtraIounStone();
    character!.charEquip.wonderousItems!.shuffle();
    notifyListeners();
  }

  addIndispensableItem(List<WonderousItemsModel> list) {
    var random = randomIndex.nextInt(10);
    if (character!.charLevel > 1 && character!.charLevel < 5) {
      character!.charEquip.wonderousItems!.add(list[0]);
    } else if (character!.charLevel > 4 && character!.charLevel < 9) {
      random < 4
          ? character!.charEquip.wonderousItems!.add(list[0])
          : character!.charEquip.wonderousItems!.add(list[1]);
    } else if (character!.charLevel > 8 && character!.charLevel < 13) {
      random < 4
          ? character!.charEquip.wonderousItems!.add(list[1])
          : character!.charEquip.wonderousItems!.add(list[2]);
    } else if (character!.charLevel > 12 && character!.charLevel < 16) {
      random < 4
          ? character!.charEquip.wonderousItems!.add(list[2])
          : character!.charEquip.wonderousItems!.add(list[3]);
    } else {
      random < 4
          ? character!.charEquip.wonderousItems!.add(list[3])
          : character!.charEquip.wonderousItems!.add(list[4]);
    }
    notifyListeners();
  }

  adjustingBeltOrHeadband(String item, String itemName) {
    var list = listOfWonderousItems.allItems
        .where((element) =>
            element.name!.contains(itemName) &&
            element.availability <= character!.charLevel)
        .toList();
    character!.charEquip.wonderousItems!
        .removeWhere((element) => element.type == item);
    character!.charEquip.wonderousItems!.add(list.last);
    notifyListeners();
  }

  adjustingItemForMainAtrbBoost(
      String item, String lesser, String medium, String greater) {
    var randomChance = randomIndex.nextInt(10);
    if (character!.charLevel < 7) {
      adjustingBeltOrHeadband(item, lesser);
    } else if (character!.charLevel > 6 && character!.charLevel < 14) {
      randomChance < 4
          ? adjustingBeltOrHeadband(item, lesser)
          : adjustingBeltOrHeadband(item, medium);
    } else if (character!.charLevel > 14 && character!.charLevel < 21) {
      randomChance < 4
          ? adjustingBeltOrHeadband(item, medium)
          : adjustingBeltOrHeadband(item, greater);
    }
  }

  adjustingIounStoneToClass() {
    if (character!.charEquip.wonderousItems!
        .any((element) => element.name!.contains("Ioun Stone"))) {
      character!.charEquip.wonderousItems!
          .removeWhere((element) => element.name!.contains("Ioun Stone"));
      switch (character!.charClass.mainAtrb) {
        case "Str":
          var newIounStone = listOfWonderousItems.allItems
              .where((element) => element.name == "Ioun Stone (Pale blue)")
              .toList();
          character!.charEquip.wonderousItems!.addAll(newIounStone);
          break;
        case "Dex":
          var newIounStone = listOfWonderousItems.allItems
              .where((element) => element.name == "Ioun Stone (Deep red)")
              .toList();
          character!.charEquip.wonderousItems!.addAll(newIounStone);
          break;
        case "Int":
          var newIounStone = listOfWonderousItems.allItems
              .where(
                  (element) => element.name == "Ioun Stone (Scarlet and blue)")
              .toList();
          character!.charEquip.wonderousItems!.addAll(newIounStone);
          break;
        case "Wis":
          var newIounStone = listOfWonderousItems.allItems
              .where(
                  (element) => element.name == "Ioun Stone (Incandescent blue)")
              .toList();
          character!.charEquip.wonderousItems!.addAll(newIounStone);
          break;
        default:
          var newIounStone = listOfWonderousItems.allItems
              .where((element) => element.name == "Ioun Stone (Pink and green)")
              .toList();
          character!.charEquip.wonderousItems!.addAll(newIounStone);
      }
      notifyListeners();
    } else {
      return;
    }
  }

  addExtraIounStone() {
    if (character!.charLevel > 11) {
      var newIounStone = listOfWonderousItems.allItems
          .where((element) => element.name == "Ioun Stone (dusty rose)")
          .toList();
      character!.charEquip.wonderousItems!.addAll(newIounStone);
    }
    notifyListeners();
  }

  showItemDescription(int index) {
    if (character!.charEquip.wonderousItems![index].isSelected == true) {
      character!.charEquip.wonderousItems![index].isSelected = false;
      notifyListeners();
      return;
    }
    for (var i in character!.charEquip.wonderousItems!) {
      i.isSelected = false;
    }
    character!.charEquip.wonderousItems![index].isSelected = true;
    notifyListeners();
  }
}
