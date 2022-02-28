import 'dart:convert';

class ModAtributeModel {
  int? strength;
  int? dexterity;
  int? constitution;
  int? intelligence;
  int? wisdom;
  int? charisma;
  ModAtributeModel({
    this.strength = 0,
    this.dexterity = 0,
    this.constitution = 0,
    this.intelligence = 0,
    this.wisdom = 0,
    this.charisma = 0,
  });

  ModAtributeModel copyWith({
    int? strength,
    int? dexterity,
    int? constitution,
    int? intelligence,
    int? wisdom,
    int? charisma,
  }) {
    return ModAtributeModel(
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

  factory ModAtributeModel.fromMap(Map<String, dynamic> map) {
    return ModAtributeModel(
      strength: map['strength']?.toInt(),
      dexterity: map['dexterity']?.toInt(),
      constitution: map['constitution']?.toInt(),
      intelligence: map['intelligence']?.toInt(),
      wisdom: map['wisdom']?.toInt(),
      charisma: map['charisma']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModAtributeModel.fromJson(String source) =>
      ModAtributeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AtributeModel(strength: $strength, dexterity: $dexterity, constitution: $constitution, intelligence: $intelligence, wisdom: $wisdom, charisma: $charisma)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModAtributeModel &&
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
