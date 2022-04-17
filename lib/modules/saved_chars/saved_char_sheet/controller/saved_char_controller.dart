import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';
import 'package:fantasy_name_generator/models/saved_char_models/char_stats_icon_model.dart';
import 'package:fantasy_name_generator/shared/data/saved_char_data/saved_char_data.dart';

class SavedCharController with ChangeNotifier {
  var icons = SavedCharData();
  late CharStatsIconModel tempIcon;
  List<CharStatsIconModel> allIcons = [];
  List<CharModel> allChars = [];
  List<CharModel> alchemists = [];
  List<CharModel> aristocrats = [];
  List<CharModel> bandits = [];
  List<CharModel> barbarians = [];
  List<String> classes = [];

  final List<KeyValueModel> classesStored = [
    KeyValueModel(key: 0, value: "Alchemist"),
    KeyValueModel(key: 1, value: "Antipaladin"),
    KeyValueModel(key: 2, value: "Arcanist"),
    KeyValueModel(key: 3, value: "Aristocrat"),
    KeyValueModel(key: 4, value: "Bandit"),
    KeyValueModel(key: 5, value: "Barbarian"),
    KeyValueModel(key: 6, value: "Bard"),
    KeyValueModel(key: 7, value: "Cleric"),
    KeyValueModel(key: 8, value: "Commoner"),
    KeyValueModel(key: 9, value: "Druid"),
    KeyValueModel(key: 10, value: "Monk"),
    KeyValueModel(key: 11, value: "Noble"),
    KeyValueModel(key: 12, value: "Paladin"),
    KeyValueModel(key: 13, value: "Ranger"),
    KeyValueModel(key: 14, value: "Rogue"),
    KeyValueModel(key: 15, value: "Samurai"),
    KeyValueModel(key: 16, value: "Sorcerer"),
    KeyValueModel(key: 17, value: "Summoner"),
    KeyValueModel(key: 18, value: "Warrior"),
    KeyValueModel(key: 19, value: "Wizard"),
  ];

  initializingController() {
    if (allIcons.isEmpty) {
      allIcons = icons.statsIconColumn;
      tempIcon = icons.statsIconColumn.first;
    }
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
    for (var i in allChars) {
      classes.add(i.charClass.name);
    }
    notifyListeners();
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
      notifyListeners();
    }
  }

  switchIconRow(int index, dynamic list) {
    for (var i in list) {
      i.isSelected = false;
    }
    list[index].isSelected = true;
    tempIcon = list[index];
    notifyListeners();
  }

  Future saveChar(CharModel char) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var charMap = char.toJson();
    String json = jsonEncode(charMap);
    prefs.setString("char", json);
  }

  ///Load chars from Shared preferences
  loadStoredCharacters() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic json = prefs.getString('char') ?? '';
    dynamic response = jsonDecode(json);

    CharModel charsGotten = CharModel.fromJson(response);
    allChars.add(charsGotten);
    notifyListeners();
    separateLoadedChars();
    getAvalableStoredClasses();
  }
}
