import 'package:fantasy_name_generator/models/saved_char_models/char_stats_icon_model.dart';

class SavedCharData {
  final List<CharStatsIconModel> statsIconColumn = [
    CharStatsIconModel(
        iconlabel: "Ability Scores", iconSvg: "ability", isSelected: true),
    CharStatsIconModel(
        iconlabel: "Combat", iconSvg: "physical", isSelected: false),
    CharStatsIconModel(
        iconlabel: "Equipment", iconSvg: "knapsack", isSelected: false),
    CharStatsIconModel(
        iconlabel: "Features", iconSvg: "features", isSelected: false),
    CharStatsIconModel(iconlabel: "Feats", iconSvg: "feats", isSelected: false),
    CharStatsIconModel(
        iconlabel: "Skills", iconSvg: "skill", isSelected: false),
    CharStatsIconModel(
        iconlabel: "Spells", iconSvg: "spellbook", isSelected: false),
    CharStatsIconModel(iconlabel: "Loot", iconSvg: "loot", isSelected: false),
  ];
}
