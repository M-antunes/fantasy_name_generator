import 'dart:convert';

class NameModel {
  final String name;
  final String surname;
  final String fullName;
  final String gender;
  NameModel({
    required this.name,
    required this.surname,
    required this.fullName,
    required this.gender,
  });

  NameModel copyWith({
    String? name,
    String? surname,
    String? fullName,
    String? gender,
  }) {
    return NameModel(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
      'fullName': fullName,
      'gender': gender,
    };
  }

  factory NameModel.fromMap(Map<String, dynamic> map) {
    return NameModel(
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      fullName: map['fullName'] ?? '',
      gender: map['gender'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NameModel.fromJson(String source) =>
      NameModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NameModel(name: $name, surname: $surname, fullName: $fullName, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NameModel &&
        other.name == name &&
        other.surname == surname &&
        other.fullName == fullName &&
        other.gender == gender;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        surname.hashCode ^
        fullName.hashCode ^
        gender.hashCode;
  }
}
