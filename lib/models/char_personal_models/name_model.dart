import 'dart:convert';

class NameModel {
  final String name;
  final String surname;
  final String fullName;
  final String gender;
  final String personalPronoun;
  final String possessiveAdjective;
  final String objectPronoun;
  NameModel({
    required this.name,
    required this.surname,
    required this.fullName,
    required this.gender,
    required this.personalPronoun,
    required this.possessiveAdjective,
    required this.objectPronoun,
  });

  NameModel copyWith({
    String? name,
    String? surname,
    String? fullName,
    String? gender,
    String? personalPronoun,
    String? possessiveAdjective,
    String? objectPronoun,
  }) {
    return NameModel(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      personalPronoun: personalPronoun ?? this.personalPronoun,
      possessiveAdjective: possessiveAdjective ?? this.possessiveAdjective,
      objectPronoun: objectPronoun ?? this.objectPronoun,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
      'fullName': fullName,
      'gender': gender,
      'personalPronoun': personalPronoun,
      'possessiveAdjective': possessiveAdjective,
      'objectPronoun': objectPronoun,
    };
  }

  factory NameModel.fromMap(Map<String, dynamic> map) {
    return NameModel(
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      fullName: map['fullName'] ?? '',
      gender: map['gender'] ?? '',
      personalPronoun: map['personalPronoun'] ?? '',
      possessiveAdjective: map['possessiveAdjective'] ?? '',
      objectPronoun: map['objectPronoun'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NameModel.fromJson(String source) =>
      NameModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NameModel(name: $name, surname: $surname, fullName: $fullName, gender: $gender, personalPronoun: $personalPronoun, possessiveAdjective: $possessiveAdjective, objectPronoun: $objectPronoun)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NameModel &&
        other.name == name &&
        other.surname == surname &&
        other.fullName == fullName &&
        other.gender == gender &&
        other.personalPronoun == personalPronoun &&
        other.possessiveAdjective == possessiveAdjective &&
        other.objectPronoun == objectPronoun;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        surname.hashCode ^
        fullName.hashCode ^
        gender.hashCode ^
        personalPronoun.hashCode ^
        possessiveAdjective.hashCode ^
        objectPronoun.hashCode;
  }
}
