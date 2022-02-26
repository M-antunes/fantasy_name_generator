import 'dart:convert';

class AtributeModel {
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;
  AtributeModel({
    required this.strength,
    required this.dexterity,
    required this.constitution,
    required this.intelligence,
    required this.wisdom,
    required this.charisma,
  });

  AtributeModel copyWith({
    int? strength,
    int? dexterity,
    int? constitution,
    int? intelligence,
    int? wisdom,
    int? charisma,
  }) {
    return AtributeModel(
      strength: strength ?? this.strength,
      dexterity: dexterity ?? this.dexterity,
      constitution: constitution ?? this.constitution,
      intelligence: intelligence ?? this.intelligence,
      wisdom: wisdom ?? this.wisdom,
      charisma: charisma ?? this.charisma,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'strength': strength,
      'dexterity': dexterity,
      'constitution': constitution,
      'intelligence': intelligence,
      'wisdom': wisdom,
      'charisma': charisma,
    };
  }

  factory AtributeModel.fromMap(Map<String, dynamic> map) {
    return AtributeModel(
      strength: map['strength']?.toInt() ?? 0,
      dexterity: map['dexterity']?.toInt() ?? 0,
      constitution: map['constitution']?.toInt() ?? 0,
      intelligence: map['intelligence']?.toInt() ?? 0,
      wisdom: map['wisdom']?.toInt() ?? 0,
      charisma: map['charisma']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AtributeModel.fromJson(String source) =>
      AtributeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AtributeModel(strength: $strength, dexterity: $dexterity, constitution: $constitution, intelligence: $intelligence, wisdom: $wisdom, charisma: $charisma)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AtributeModel &&
        other.strength == strength &&
        other.dexterity == dexterity &&
        other.constitution == constitution &&
        other.intelligence == intelligence &&
        other.wisdom == wisdom &&
        other.charisma == charisma;
  }

  @override
  int get hashCode {
    return strength.hashCode ^
        dexterity.hashCode ^
        constitution.hashCode ^
        intelligence.hashCode ^
        wisdom.hashCode ^
        charisma.hashCode;
  }
}
