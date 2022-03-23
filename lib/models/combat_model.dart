import 'dart:convert';

class CombatModel {
  int? armourClass;
  int? armourTouch;
  int? armourSurprise;
  int? baseAttackBonus;
  String? primaryAttack;
  String? secundaryAttack;
  String? primaryDamage;
  String? secundaryDamage;
  int? combatManeuverBonus;
  int? combatManeuverDefense;
  CombatModel({
    this.armourClass = 0,
    this.armourTouch = 0,
    this.armourSurprise = 0,
    this.baseAttackBonus = 0,
    this.primaryAttack = "0",
    this.secundaryAttack = "0",
    this.primaryDamage = "0",
    this.secundaryDamage = "0",
    this.combatManeuverBonus = 0,
    this.combatManeuverDefense = 0,
  });

  CombatModel copyWith({
    int? armourClass,
    int? armourTouch,
    int? armourSurprise,
    int? baseAttackBonus,
    String? primaryAttack,
    String? secundaryAttack,
    String? primaryDamage,
    String? secundaryDamage,
    int? combatManeuverBonus,
    int? combatManeuverDefense,
  }) {
    return CombatModel(
      armourClass: armourClass ?? this.armourClass,
      armourTouch: armourTouch ?? this.armourTouch,
      armourSurprise: armourSurprise ?? this.armourSurprise,
      baseAttackBonus: baseAttackBonus ?? this.baseAttackBonus,
      primaryAttack: primaryAttack ?? this.primaryAttack,
      secundaryAttack: secundaryAttack ?? this.secundaryAttack,
      primaryDamage: primaryDamage ?? this.primaryDamage,
      secundaryDamage: secundaryDamage ?? this.secundaryDamage,
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
      'primaryAttack': primaryAttack,
      'secundaryAttack': secundaryAttack,
      'primaryDamage': primaryDamage,
      'secundaryDamage': secundaryDamage,
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
      primaryAttack: map['primaryAttack'],
      secundaryAttack: map['secundaryAttack'],
      primaryDamage: map['primaryDamage'],
      secundaryDamage: map['secundaryDamage'],
      combatManeuverBonus: map['combatManeuverBonus']?.toInt(),
      combatManeuverDefense: map['combatManeuverDefense']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CombatModel.fromJson(String source) =>
      CombatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CombatModel(armourClass: $armourClass, armourTouch: $armourTouch, armourSurprise: $armourSurprise, baseAttackBonus: $baseAttackBonus, primaryAttack: $primaryAttack, secundaryAttack: $secundaryAttack, primaryDamage: $primaryDamage, secundaryDamage: $secundaryDamage, combatManeuverBonus: $combatManeuverBonus, combatManeuverDefense: $combatManeuverDefense)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CombatModel &&
        other.armourClass == armourClass &&
        other.armourTouch == armourTouch &&
        other.armourSurprise == armourSurprise &&
        other.baseAttackBonus == baseAttackBonus &&
        other.primaryAttack == primaryAttack &&
        other.secundaryAttack == secundaryAttack &&
        other.primaryDamage == primaryDamage &&
        other.secundaryDamage == secundaryDamage &&
        other.combatManeuverBonus == combatManeuverBonus &&
        other.combatManeuverDefense == combatManeuverDefense;
  }

  @override
  int get hashCode {
    return armourClass.hashCode ^
        armourTouch.hashCode ^
        armourSurprise.hashCode ^
        baseAttackBonus.hashCode ^
        primaryAttack.hashCode ^
        secundaryAttack.hashCode ^
        primaryDamage.hashCode ^
        secundaryDamage.hashCode ^
        combatManeuverBonus.hashCode ^
        combatManeuverDefense.hashCode;
  }
}
