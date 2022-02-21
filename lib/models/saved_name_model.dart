class SavedNameModel {
  final String firstName;
  final String lastName;
  final String race;

  /// 0 = female ;;; 1 = male
  final int gender;
  bool isSelected;
  SavedNameModel({
    required this.firstName,
    required this.lastName,
    required this.race,
    required this.gender,
    required this.isSelected,
  });
}
