import 'package:fantasy_name_generator/controllers/stage_controller/char_controller.dart';
import 'package:fantasy_name_generator/controllers/stage_controller/imports.dart';

class MinionController with ChangeNotifier {
  late RaceModel tempRaceForSwitching;
  late ClassModel tempClassForSwitching;
  var listOfRaces = RaceData();
  late CombatStyleChoiceModel tempStyleForSwitching;

  starttempRace() {
    tempRaceForSwitching = listOfRaces.races[0];
  }
}
