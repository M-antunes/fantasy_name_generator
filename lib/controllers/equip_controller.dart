import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/models/key_value.model.dart';
import 'package:fantasy_name_generator/shared/data/default_char_model_data.dart';
import 'package:flutter/cupertino.dart';

import '../models/equip_models/weapon_type_model.dart';
import '../shared/data/class_data.dart';
import '../shared/data/equip_data.dart';

class EquipController extends ChangeNotifier {
  CharModel char = DefaultCharModelData().defaultCharModel;
  int creationStage = 1;
  var listOfClasses = ClassData();
  var listOfEquip = EquipData();
  String fightStyle = "";
  String tempFightStyle = "";
  bool showOneHanded = false;
  bool showTwoHanded = false;
  bool showDistant = false;

  WeaponTypeModel? tempWeaponTypeForSwitching;
  WeaponTypeModel? chosenWeaponType;

  makeWeaponSegmentTrue(String show) {
    switch (show) {
      case "One-handed":
        showOneHanded = makeTheRestOfWeaponSegmentFalse(showOneHanded);
        notifyListeners();
        break;
      case "Two-handed":
        showTwoHanded = makeTheRestOfWeaponSegmentFalse(showTwoHanded);
        notifyListeners();
        break;
      case "Distant":
        showDistant = makeTheRestOfWeaponSegmentFalse(showDistant);
        notifyListeners();
        break;
      default:
    }
  }

  bool makeTheRestOfWeaponSegmentFalse(bool safe) {
    showOneHanded = false;
    showTwoHanded = false;
    showDistant = false;
    notifyListeners();
    if (safe) {
      safe = false;
    } else {
      safe = true;
    }
    return safe;
  }

  updateChosenweaponType() {
    chosenWeaponType = tempWeaponTypeForSwitching;
    notifyListeners();
  }

  switchWeaponType(WeaponTypeModel type, List<WeaponTypeModel> list) {
    type.isSelected = !type.isSelected;
    for (var select in list) {
      select.isSelected = false;
    }
    type.isSelected = !type.isSelected;
    tempWeaponTypeForSwitching = type;
    notifyListeners();
  }

  advanceCreationStage() {
    creationStage++;
    notifyListeners();
  }

  retreatCreationStage() {
    creationStage--;
    notifyListeners();
  }

  updateCombatStyle() {
    fightStyle = tempFightStyle;
    notifyListeners();
  }

  switchCombatStyle(KeyValueModel combatStyle) {
    listOfClasses.fightingStyle[0].value.key = false;
    listOfClasses.fightingStyle[1].value.key = false;
    combatStyle.value.key = !combatStyle.value.key;
    tempFightStyle = combatStyle.key;
    notifyListeners();
  }

  String? activateNextButton() {
    if (creationStage == 1) {
      advanceCreationStage();
      return null;
    }
    if (creationStage == 2) {
      advanceCreationStage();
      updateChosenweaponType();
      return null;
    }
  }
}
