import 'dart:convert';

class CombatModel {
  int? armourClass;
  int? armourTouch;
  int? armourSurprise;
  int? baseAttackBonus;
  int? initiative;
  String? primaryAttack;
  String? secundaryAttack;
  String? primaryDamage;
  String? secundaryDamage;
  String? emergencyAttack;
  String? emergencyDamage;
  int? combatManeuverBonus;
  int? combatManeuverDefense;
  CombatModel({
    this.armourClass = 0,
    this.armourTouch = 0,
    this.armourSurprise = 0,
    this.baseAttackBonus = 0,
    this.initiative,
    this.primaryAttack = "0",
    this.secundaryAttack = "0",
    this.primaryDamage = "0",
    this.secundaryDamage = "0",
    this.emergencyAttack = "0",
    this.emergencyDamage = "0",
    this.combatManeuverBonus = 0,
    this.combatManeuverDefense = 0,
  });

  CombatModel copyWith({
    int? armourClass,
    int? armourTouch,
    int? armourSurprise,
    int? baseAttackBonus,
    int? initiative,
    String? primaryAttack,
    String? secundaryAttack,
    String? primaryDamage,
    String? secundaryDamage,
    String? emergencyAttack,
    String? emergencyDamage,
    int? combatManeuverBonus,
    int? combatManeuverDefense,
  }) {
    return CombatModel(
      armourClass: armourClass ?? this.armourClass,
      armourTouch: armourTouch ?? this.armourTouch,
      armourSurprise: armourSurprise ?? this.armourSurprise,
      baseAttackBonus: baseAttackBonus ?? this.baseAttackBonus,
      initiative: initiative ?? this.initiative,
      primaryAttack: primaryAttack ?? this.primaryAttack,
      secundaryAttack: secundaryAttack ?? this.secundaryAttack,
      primaryDamage: primaryDamage ?? this.primaryDamage,
      secundaryDamage: secundaryDamage ?? this.secundaryDamage,
      emergencyAttack: emergencyAttack ?? this.emergencyAttack,
      emergencyDamage: emergencyDamage ?? this.emergencyDamage,
      combatManeuverBonus: combatManeuverBonus ?? this.combatManeuverBonus,
      combatManeuverDefense:
          combatManeuverDefense ?? this.combatManeuverDefense,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'armourClass': armourClass,
      'armourTouch': armourTouch,
      'armourSurprise': armourSurprise,
      'baseAttackBonus': baseAttackBonus,
      'initiative': initiative,
      'primaryAttack': primaryAttack,
      'secundaryAttack': secundaryAttack,
      'primaryDamage': primaryDamage,
      'secundaryDamage': secundaryDamage,
      'emergencyAttack': emergencyAttack,
      'emergencyDamage': emergencyDamage,
      'combatManeuverBonus': combatManeuverBonus,
      'combatManeuverDefense': combatManeuverDefense,
    };
  }

  factory CombatModel.fromMap(Map<String, dynamic> map) {
    return CombatModel(
      armourClass: map['armourClass']?.toInt(),
      armourTouch: map['armourTouch']?.toInt(),
      armourSurprise: map['armourSurprise']?.toInt(),
      baseAttackBonus: map['baseAttackBonus']?.toInt(),
      initiative: map['initiative']?.toInt(),
      primaryAttack: map['primaryAttack'],
      secundaryAttack: map['secundaryAttack'],
      primaryDamage: map['primaryDamage'],
      secundaryDamage: map['secundaryDamage'],
      emergencyAttack: map['emergencyAttack'],
      emergencyDamage: map['emergencyDamage'],
      combatManeuverBonus: map['combatManeuverBonus']?.toInt(),
      combatManeuverDefense: map['combatManeuverDefense']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CombatModel.fromJson(String source) =>
      CombatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CombatModel(armourClass: $armourClass, armourTouch: $armourTouch, armourSurprise: $armourSurprise, baseAttackBonus: $baseAttackBonus, initiative: $initiative, primaryAttack: $primaryAttack, secundaryAttack: $secundaryAttack, primaryDamage: $primaryDamage, secundaryDamage: $secundaryDamage, emergencyAttack: $emergencyAttack, emergencyDamage: $emergencyDamage, combatManeuverBonus: $combatManeuverBonus, combatManeuverDefense: $combatManeuverDefense)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CombatModel &&
        other.armourClass == armourClass &&
        other.armourTouch == armourTouch &&
        other.armourSurprise == armourSurprise &&
        other.baseAttackBonus == baseAttackBonus &&
        other.initiative == initiative &&
        other.primaryAttack == primaryAttack &&
        other.secundaryAttack == secundaryAttack &&
        other.primaryDamage == primaryDamage &&
        other.secundaryDamage == secundaryDamage &&
        other.emergencyAttack == emergencyAttack &&
        other.emergencyDamage == emergencyDamage &&
        other.combatManeuverBonus == combatManeuverBonus &&
        other.combatManeuverDefense == combatManeuverDefense;
  }

  @override
  int get hashCode {
    return armourClass.hashCode ^
        armourTouch.hashCode ^
        armourSurprise.hashCode ^
        baseAttackBonus.hashCode ^
        initiative.hashCode ^
        primaryAttack.hashCode ^
        secundaryAttack.hashCode ^
        primaryDamage.hashCode ^
        secundaryDamage.hashCode ^
        emergencyAttack.hashCode ^
        emergencyDamage.hashCode ^
        combatManeuverBonus.hashCode ^
        combatManeuverDefense.hashCode;
  }
}
