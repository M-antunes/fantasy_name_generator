import 'package:flutter/material.dart';

import '../../models/char_personal_models/char_model.dart';

class CharAdminController {
  saveCharacterInList(
    CharModel character,
    List<CharModel> allChars,
    VoidCallback errorMessage,
  ) {
    for (var i in allChars) {
      if (i.charName.fullName == character.charName.fullName) {
        errorMessage;
        return;
      }
    }
    return character;
  }
}
