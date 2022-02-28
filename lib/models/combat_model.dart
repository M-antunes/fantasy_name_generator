import 'dart:convert';

class CombatModel {
  final int? armourClass;
  final int? armourTouch;
  final int? armourSurprise;
  final int? baseAttackBonus;
  final int? primaryAttack;
  final int? secundaryAttack;
  final int? combatManeuverBonus;
  final int? combatManeuverDefense;
  CombatModel({
    this.armourClass = 10,
    this.armourTouch = 10,
    this.armourSurprise = 10,
    this.baseAttackBonus = 0,
    this.primaryAttack = 0,
    this.secundaryAttack = 0,
    this.combatManeuverBonus = 0,
    this.combatManeuverDefense = 10,
  });

  CombatModel copyWith({
    int? armourClass,
    int? armourTouch,
    int? armourSurprise,
    int? baseAttackBonus,
    int? primaryAttack,
    int? secundaryAttack,
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
      primaryAttack: map['primaryAttack']?.toInt(),
      secundaryAttack: map['secundaryAttack']?.toInt(),
      combatManeuverBonus: map['combatManeuverBonus']?.toInt(),
      combatManeuverDefense: map['combatManeuverDefense']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CombatModel.fromJson(String source) =>
      CombatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CombatModel(armourClass: $armourClass, armourTouch: $armourTouch, armourSurprise: $armourSurprise, baseAttackBonus: $baseAttackBonus, primaryAttack: $primaryAttack, secundaryAttack: $secundaryAttack, combatManeuverBonus: $combatManeuverBonus, combatManeuverDefense: $combatManeuverDefense)';
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
        combatManeuverBonus.hashCode ^
        combatManeuverDefense.hashCode;
  }
}
