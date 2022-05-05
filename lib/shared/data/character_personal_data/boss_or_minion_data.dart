import 'package:fantasy_name_generator/models/boss_or_minion_model.dart';

class BossOrMinionData {
  List<BossOrMinionModel> boosAndMinion = [
    BossOrMinionModel(
      name: "MINION",
      svg: "assets/images/minions.svg",
      description:
          "Minions exist to serve their masters. They're not unique, don't have last names and their alignments always match their masters (bosses). They'll probably die for their masters. Each master or boss can have more than one minions. Minions have few powerful items and are considerably weaker than their boss.\n• Sorceres, Paladins and Antipaladins can never be minions.",
      isSelected: true,
    ),
    BossOrMinionModel(
      name: "BOSS",
      svg: "assets/images/boss.svg",
      description:
          "Bosses are strong characters regardless of race and class. They posses powerful items that will be used in the encounters. They have unique names, alignments, sometimes exclusive powers depending on level chosen. They can have minions to serve them.\n• Commoners can never be bosses.",
      isSelected: false,
    ),
  ];
}
