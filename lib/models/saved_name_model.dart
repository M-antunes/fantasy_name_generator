import 'dart:convert';

import 'race_models/race_model.dart';

class SavedNameModel {
  /// 0 = female ;;; 1 = male
  final String gender;
  final String fullName;
  final String firstName;
  final String lastName;
  final RaceModel race;

  SavedNameModel({
    required this.gender,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.race,
  });

  SavedNameModel copyWith({
    String? gender,
    String? fullName,
    String? firstName,
    String? lastName,
    RaceModel? race,
  }) {
    return SavedNameModel(
      gender: gender ?? this.gender,
      fullName: fullName ?? this.fullName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      race: race ?? this.race,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'fullName': fullName,
      'firstName': firstName,
      'lastName': lastName,
      'race': race.toMap(),
    };
  }

  factory SavedNameModel.fromMap(Map<String, dynamic> map) {
    return SavedNameModel(
      gender: map['gender'] ?? '',
      fullName: map['fullName'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      race: RaceModel.fromMap(map['race']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SavedNameModel.fromJson(String source) =>
      SavedNameModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SavedNameModel(gender: $gender, fullName: $fullName, firstName: $firstName, lastName: $lastName, race: $race)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SavedNameModel &&
        other.gender == gender &&
        other.fullName == fullName &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.race == race;
  }

  @override
  int get hashCode {
    return gender.hashCode ^
        fullName.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        race.hashCode;
  }
}
