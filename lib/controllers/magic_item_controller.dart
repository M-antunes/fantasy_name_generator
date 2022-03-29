import 'dart:math';

import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/equip_models/wonderous_items_model.dart';
import 'package:fantasy_name_generator/shared/data/wonderous_items_data.dart';
import 'package:flutter/cupertino.dart';

class MagicItemController extends ChangeNotifier {
  CharModel? character;
  var listOfWonderousItems = WonderousItemsData();
  Random randomIndex = Random();

  List<String> itemsLabel = [
    "Belt",
    "Body",
    "Chest",
    "Eyes",
    "Feet",
    "Hands",
    "Head",
    "Headband",
    "Neck",
    "Cloak",
    "Wrist",
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
    switch (character!.charLevel) {
      case 10:
        generateMagicItemForLv2();
        break;
      default:
        return;
    }
    updateMagicItems();
  }

  resetItems() {
    character!.charEquip.wonderousItems = [];
    updateMagicItems();
  }

  List<String> findItemForBodyParts(int qnt) {
    List<String> listOfItemsForChar = [];
    List<String> listOfItemsLeft = itemsLabel;
    for (var i = 0; i < qnt; i++) {
      var random = randomIndex.nextInt(listOfItemsLeft.length - 1);
      listOfItemsForChar.add(listOfItemsLeft[random]);
      listOfItemsLeft.remove(listOfItemsLeft[random]);
    }
    return listOfItemsForChar;
  }

  List<WonderousItemsModel> findMagicItem(int lvAvailable) {
    var minLvavailable = 0;
    if (lvAvailable > 8) {
      minLvavailable = lvAvailable - 5;
    }
    var list = listOfWonderousItems.allItems
        .where((element) =>
            element.availability <= lvAvailable &&
            element.availability >= minLvavailable &&
            (element.exclusiveClasses == "Regular" ||
                element.exclusiveClasses == character!.charClass.name))
        .toList();
    return list;
  }

  generateMagicItemForLv2() {
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
      charMagicItems.add(list[random]);
    }
    character!.charEquip.wonderousItems = charMagicItems;
    addRingOfProtection();
    notifyListeners();
  }

  addRingOfProtection() {
    if (character!.charLevel > 1 && character!.charLevel < 5) {
      character!.charEquip.wonderousItems!
          .add(listOfWonderousItems.protRings[0]);
      notifyListeners();
      return;
    } else if (character!.charLevel > 4 && character!.charLevel < 9) {
      character!.charEquip.wonderousItems!
          .add(listOfWonderousItems.protRings[1]);
      notifyListeners();
      return;
    } else if (character!.charLevel > 8 && character!.charLevel < 13) {
      character!.charEquip.wonderousItems!
          .add(listOfWonderousItems.protRings[2]);
      notifyListeners();
      return;
    } else if (character!.charLevel > 12 && character!.charLevel < 16) {
      character!.charEquip.wonderousItems!
          .add(listOfWonderousItems.protRings[3]);
      notifyListeners();
      return;
    } else {
      character!.charEquip.wonderousItems!
          .add(listOfWonderousItems.protRings[4]);
      notifyListeners();
      return;
    }
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
