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
  ];

  bool magicItemsGenerated = false;

// section for applying magic to weapon

// Section for wonderouns items

  updateMagicItems() {
    magicItemsGenerated = !magicItemsGenerated;
    notifyListeners();
  }

  generateMagicEquip() {
    generateMagicItemForLv2();

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
      listOfItemsLeft
          .removeWhere((element) => element == listOfItemsLeft[random]);
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

  generateMagicItemForLv2() {
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
    List<WonderousItemsModel> charPossibleMagicItems = [];
    List<WonderousItemsModel> charMagicItems = [];
    for (var i = 0; i < numberOfItems; i++) {
      List<WonderousItemsModel> item = availableItems
          .where((element) => element.type == itemsPerBodyParts[i])
          .toList();
      charPossibleMagicItems.addAll(item);
    }

    for (var i = 0; i < numberOfItems; i++) {
      var list = charPossibleMagicItems
          .where((element) => element.type == itemsPerBodyParts[i])
          .toList();
      var random = randomIndex.nextInt(list.length);
      if (random == list.length) {
        random--;
      }
      charMagicItems.add(list[random]);
    }
    character!.charEquip.wonderousItems = charMagicItems;
    if (itemsPerBodyParts
        .any((element) => element == "belt" || element == "Headband")) {
      adjustingItemForMainAtrbBoost();
    }
    addIndispensableItem(listOfWonderousItems.protRings);
    addIndispensableItem(listOfWonderousItems.resistCloaks);
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

  adjustingItemForMainAtrbBoost() {
    switch (character!.charClass.mainAtrb) {
      case "Str":
        adjustingBeltOrHeadband("Belt", "Belt of giant strength");
        break;
      case "Dex":
        adjustingBeltOrHeadband("Belt", "Belt of incredible dexterity");
        break;
      case "Int":
        adjustingBeltOrHeadband("Headband", "Headband of vast intelligence");
        break;
      case "Wis":
        adjustingBeltOrHeadband("Headband", "Headband of inspired wisdom");
        break;
      default:
        adjustingBeltOrHeadband("Headband", "Headband of alluring charisma");
    }
  }

  adjustingHeadbandToChar() {}

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
