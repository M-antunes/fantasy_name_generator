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
  String? dualWieldAttack;
  String? dualWieldDamage;
  int? combatManeuverBonus;
  int? combatManeuverDefense;
  String? touchAttack;
  int? concentration;
  String? spellRsistance;
  String? overcomeSpellRsistance;
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
    this.dualWieldAttack = "0",
    this.dualWieldDamage = "0",
    this.combatManeuverBonus = 0,
    this.combatManeuverDefense = 0,
    this.touchAttack = "0",
    this.concentration = 0,
    this.spellRsistance = "0",
    this.overcomeSpellRsistance = "0",
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
    String? dualWieldAttack,
    String? dualWieldDamage,
    int? combatManeuverBonus,
    int? combatManeuverDefense,
    String? touchAttack,
    int? concentration,
    String? spellRsistance,
    String? overcomeSpellRsistance,
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
      dualWieldAttack: dualWieldAttack ?? this.dualWieldAttack,
      dualWieldDamage: dualWieldDamage ?? this.dualWieldDamage,
      combatManeuverBonus: combatManeuverBonus ?? this.combatManeuverBonus,
      combatManeuverDefense:
          combatManeuverDefense ?? this.combatManeuverDefense,
      touchAttack: touchAttack ?? this.touchAttack,
      concentration: concentration ?? this.concentration,
      spellRsistance: spellRsistance ?? this.spellRsistance,
      overcomeSpellRsistance:
          overcomeSpellRsistance ?? this.overcomeSpellRsistance,
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
      'dualWieldAttack': dualWieldAttack,
      'dualWieldDamage': dualWieldDamage,
      'combatManeuverBonus': combatManeuverBonus,
      'combatManeuverDefense': combatManeuverDefense,
      'touchAttack': touchAttack,
      'concentration': concentration,
      'spellRsistance': spellRsistance,
      'overcomeSpellRsistance': overcomeSpellRsistance,
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
      dualWieldAttack: map['dualWieldAttack'],
      dualWieldDamage: map['dualWieldDamage'],
      combatManeuverBonus: map['combatManeuverBonus']?.toInt(),
      combatManeuverDefense: map['combatManeuverDefense']?.toInt(),
      touchAttack: map['touchAttack'],
      concentration: map['concentration']?.toInt(),
      spellRsistance: map['spellRsistance'],
      overcomeSpellRsistance: map['overcomeSpellRsistance'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CombatModel.fromJson(String source) =>
      CombatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CombatModel(armourClass: $armourClass, armourTouch: $armourTouch, armourSurprise: $armourSurprise, baseAttackBonus: $baseAttackBonus, initiative: $initiative, meleeAttack: $meleeAttack, rangeAttack: $rangeAttack, meleeDamage: $meleeDamage, rangeDamage: $rangeDamage, dualWieldAttack: $dualWieldAttack, dualWieldDamage: $dualWieldDamage, combatManeuverBonus: $combatManeuverBonus, combatManeuverDefense: $combatManeuverDefense, touchAttack: $touchAttack, concentration: $concentration, spellRsistance: $spellRsistance, overcomeSpellRsistance: $overcomeSpellRsistance)';
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
        other.dualWieldAttack == dualWieldAttack &&
        other.dualWieldDamage == dualWieldDamage &&
        other.combatManeuverBonus == combatManeuverBonus &&
        other.combatManeuverDefense == combatManeuverDefense &&
        other.touchAttack == touchAttack &&
        other.concentration == concentration &&
        other.spellRsistance == spellRsistance &&
        other.overcomeSpellRsistance == overcomeSpellRsistance;
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
        dualWieldAttack.hashCode ^
        dualWieldDamage.hashCode ^
        combatManeuverBonus.hashCode ^
        combatManeuverDefense.hashCode ^
        touchAttack.hashCode ^
        concentration.hashCode ^
        spellRsistance.hashCode ^
        overcomeSpellRsistance.hashCode;
  }
}
