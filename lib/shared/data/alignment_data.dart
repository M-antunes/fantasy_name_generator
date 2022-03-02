import 'package:fantasy_name_generator/models/alignment_model.dart';

class AlignmentData {
  List<AlignmentModel> allAlignments = [
    AlignmentModel(isSelected: false, abreviation: "LG.", name: "Lawful Good"),
    AlignmentModel(
        isSelected: false, abreviation: "L.N.", name: "Lawful Neutral"),
    AlignmentModel(isSelected: false, abreviation: "L.E.", name: "Lawful Evil"),
    AlignmentModel(
        isSelected: false, abreviation: "N.G.", name: "Neutral Good"),
    AlignmentModel(isSelected: false, abreviation: "N.", name: "Neutral"),
    AlignmentModel(
        isSelected: false, abreviation: "N.E.", name: "Neutral Evil"),
    AlignmentModel(
        isSelected: false, abreviation: "C.G.", name: "Chaotic Good"),
    AlignmentModel(
        isSelected: false, abreviation: "C.N.", name: "Chaotic Neutral"),
    AlignmentModel(
        isSelected: false, abreviation: "C.E.", name: "Chaotic Evil"),
  ];
}
