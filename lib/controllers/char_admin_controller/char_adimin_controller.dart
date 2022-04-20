import 'dart:convert';

import 'package:fantasy_name_generator/models/class_models/sotered_char.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/char_personal_models/char_model.dart';
import '../../models/saved_char_models/char_stats_icon_model.dart';
import '../../shared/data/saved_char_data/saved_char_data.dart';

class CharAdminController with ChangeNotifier {
  var icons = SavedCharData();
  late CharStatsIconModel tempIcon;
  List<CharStatsIconModel> allIcons = [];
  List<CharModel> allChars = [];
  List<CharModel> alchemists = [];
  List<CharModel> aristocrats = [];
  List<CharModel> bandits = [];
  List<CharModel> barbarians = [];
  List<StoredCharClass> storedClasses = [];

  initializingController() {
    if (allIcons.isEmpty) {
      allIcons = icons.statsIconColumn;
      tempIcon = icons.statsIconColumn.first;
    }
  }

  showClassList(int index, dynamic list) {
    if (list[index].isSelected == true) {
      list[index].isSelected = false;
      return;
    }
    for (var i in list) {
      i.isSelected = false;
    }
    list[index].isSelected = true;
  }

  showDescriptions(int index, dynamic list) {
    if (list[index].isSelected == true) {
      list[index].isSelected = false;
      notifyListeners();
      return;
    }
    for (var i in list) {
      i.isSelected = false;
    }
    list[index].isSelected = true;
    notifyListeners();
  }

  getAvalableStoredClasses() {
    List<String> classStrings = [];
    for (var i in allChars) {
      if (!classStrings.contains(i.charClass.name)) {
        classStrings.add(i.charClass.name);
      }
    }
    for (var i = 0; i < classStrings.length; i++) {
      for (var j = 0; j < 1; j++) {
        var newStoredClass =
            StoredCharClass(name: classStrings[j], isSelected: false);
        storedClasses.add(newStoredClass);
      }
      if (storedClasses[i].name != classStrings[i]) {
        var newStoredClass =
            StoredCharClass(name: classStrings[i], isSelected: false);
        storedClasses.add(newStoredClass);
      }
    }
    notifyListeners();
  }

  int claculateNumberOfCharsPerClass(String className) {
    int classQnt = 0;
    for (var i in allChars) {
      if (i.charClass.name == className) {
        classQnt++;
      }
    }
    return classQnt;
  }

  returningRightClassList(String className) {
    switch (className) {
      case "Barbarian":
        return barbarians;
      case "Alchemist":
        return barbarians;
      case "Bandit":
        return barbarians;
      case "Aristocrat":
        return barbarians;
    }
  }

  clearAllLists() {
    allChars.clear();
    alchemists.clear();
    aristocrats.clear();
    bandits.clear();
    barbarians.clear();
    storedClasses.clear();
  }

  separateLoadedChars() {
    for (var i in allChars) {
      switch (i.charClass.name) {
        case "Alchemist":
          alchemists.add(i);
          break;
        case "Aristocrat":
          aristocrats.add(i);
          break;
        case "Bandit":
          bandits.add(i);
          break;
        case "Barbarian":
          barbarians.add(i);
          break;
        default:
      }
    }
    notifyListeners();
  }

  switchIconRow(int index, dynamic list) {
    for (var i in list) {
      i.isSelected = false;
    }
    list[index].isSelected = true;
    tempIcon = list[index];
    notifyListeners();
  }

  Future saveCharInPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(allChars);
    prefs.setString("charact", json);
  }

  saveCharInHive(CharModel character) {
    saveCharacterInList(character);
    String json = jsonEncode(character);
    Hive.box("characters").add(json);
  }

  loadCharFromHive() {
    clearAllLists();
    var jsonLength = Hive.box('characters').length;
    for (var i = 0; i < jsonLength; i++) {
      var json = Hive.box('characters').get(i);
      var response = jsonDecode(json);
      var charGotten = CharModel.fromJson(response);
      allChars.add(charGotten);
    }
    getAvalableStoredClasses();
    separateLoadedChars();
  }

  ///Load chars from Shared preferences
  loadStoredCharacters() async {
    clearAllLists();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json = prefs.getString('charact') ?? '';
    if (json == '') {
      return;
    }
    var response = jsonDecode(json);
    var charsGotten = response.map((e) => CharModel.fromJson(e)).toList();
    for (var i in charsGotten) {
      CharModel savedChar = i as CharModel;
      allChars.add(savedChar);
    }
    getAvalableStoredClasses();
    separateLoadedChars();
  }

  saveCharacterInList(
    CharModel character,
  ) {
    allChars.add(character);
    notifyListeners();
  }
}
