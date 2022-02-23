class SavedNameModel {
  final String fullName;
  final String firstName;
  final String lastName;
  final String race;
  final String picture;

  /// 0 = female ;;; 1 = male
  final int gender;
  SavedNameModel({
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.race,
    required this.picture,
    required this.gender,
  });
}
