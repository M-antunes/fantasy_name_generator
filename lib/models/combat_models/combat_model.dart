import 'dart:convert';

class CombatModel {
  int? armourClass;
  int? armourTouch;
  int? armourSurprise;
  int? baseAttackBonus;
  int? initiative;
  String? meleeAttack;
  String? rangeAttack;
  String? meleeDamage;
  String? rangeDamage;
  int? combatManeuverBonus;
  int? combatManeuverDefense;
  CombatModel({
    this.armourClass = 0,
    this.armourTouch = 0,
    this.armourSurprise = 0,
    this.baseAttackBonus = 0,
    this.initiative = 0,
    this.meleeAttack = "0",
    this.rangeAttack = "0",
    this.meleeDamage = "0",
    this.rangeDamage = "0",
    this.combatManeuverBonus = 0,
    this.combatManeuverDefense = 0,
  });

  CombatModel copyWith({
    int? armourClass,
    int? armourTouch,
    int? armourSurprise,
    int? baseAttackBonus,
    int? initiative,
    String? meleeAttack,
    String? rangeAttack,
    String? meleeDamage,
    String? rangeDamage,
    int? combatManeuverBonus,
    int? combatManeuverDefense,
  }) {
    return CombatModel(
      armourClass: armourClass ?? this.armourClass,
      armourTouch: armourTouch ?? this.armourTouch,
      armourSurprise: armourSurprise ?? this.armourSurprise,
      baseAttackBonus: baseAttackBonus ?? this.baseAttackBonus,
      initiative: initiative ?? this.initiative,
      meleeAttack: meleeAttack ?? this.meleeAttack,
      rangeAttack: rangeAttack ?? this.rangeAttack,
      meleeDamage: meleeDamage ?? this.meleeDamage,
      rangeDamage: rangeDamage ?? this.rangeDamage,
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
      'meleeAttack': meleeAttack,
      'rangeAttack': rangeAttack,
      'meleeDamage': meleeDamage,
      'rangeDamage': rangeDamage,
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
      meleeAttack: map['meleeAttack'],
      rangeAttack: map['rangeAttack'],
      meleeDamage: map['meleeDamage'],
      rangeDamage: map['rangeDamage'],
      combatManeuverBonus: map['combatManeuverBonus']?.toInt(),
      combatManeuverDefense: map['combatManeuverDefense']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CombatModel.fromJson(String source) =>
      CombatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CombatModel(armourClass: $armourClass, armourTouch: $armourTouch, armourSurprise: $armourSurprise, baseAttackBonus: $baseAttackBonus, initiative: $initiative, meleeAttack: $meleeAttack, rangeAttack: $rangeAttack, meleeDamage: $meleeDamage, rangeDamage: $rangeDamage, combatManeuverBonus: $combatManeuverBonus, combatManeuverDefense: $combatManeuverDefense)';
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
        other.meleeAttack == meleeAttack &&
        other.rangeAttack == rangeAttack &&
        other.meleeDamage == meleeDamage &&
        other.rangeDamage == rangeDamage &&
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
        meleeAttack.hashCode ^
        rangeAttack.hashCode ^
        meleeDamage.hashCode ^
        rangeDamage.hashCode ^
        combatManeuverBonus.hashCode ^
        combatManeuverDefense.hashCode;
  }
}
