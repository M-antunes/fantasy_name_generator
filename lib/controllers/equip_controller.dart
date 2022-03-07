import 'package:fantasy_name_generator/models/char_model.dart';
import 'package:fantasy_name_generator/shared/data/default_char_model_data.dart';
import 'package:flutter/cupertino.dart';

class EquipController extends ChangeNotifier {
  CharModel char = DefaultCharModelData().defaultCharModel;
  int creationStage = 1;

  advanceCreationStage() {
    creationStage++;
    notifyListeners();
  }

  retreatCreationStage() {
    creationStage--;
    notifyListeners();
  }

  String? activateNextButton() {
    if (creationStage == 1) {
      advanceCreationStage();
      return null;
    }
  }
}
