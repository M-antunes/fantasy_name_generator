import 'dart:convert';

class SpellModel {
  final String name;
  final int level;
  final String effect;
  final String school;
  final String castingTime;
  final String range;
  final String target;
  final String duration;
  final String savingThrow;
  final String spellResistance;
  final String magicType;
  bool canBePotion;
  String difficultClass;
  int conjurerLevel;
  bool isSelected;
  SpellModel({
    this.name = "",
    this.level = 0,
    this.effect = "",
    this.school = '',
    this.castingTime = "standard action",
    this.range = '',
    this.target = '',
    this.duration = '',
    this.savingThrow = 'no',
    this.spellResistance = "no",
    this.magicType = "",
    this.canBePotion = false,
    this.difficultClass = "",
    this.conjurerLevel = 0,
    this.isSelected = false,
  });

  SpellModel copyWith({
    String? name,
    int? level,
    String? effect,
    String? school,
    String? castingTime,
    String? range,
    String? target,
    String? duration,
    String? savingThrow,
    String? spellResistance,
    String? magicType,
    bool? canBePotion,
    String? difficultClass,
    int? conjurerLevel,
    bool? isSelected,
  }) {
    return SpellModel(
      name: name ?? this.name,
      level: level ?? this.level,
      effect: effect ?? this.effect,
      school: school ?? this.school,
      castingTime: castingTime ?? this.castingTime,
      range: range ?? this.range,
      target: target ?? this.target,
      duration: duration ?? this.duration,
      savingThrow: savingThrow ?? this.savingThrow,
      spellResistance: spellResistance ?? this.spellResistance,
      magicType: magicType ?? this.magicType,
      canBePotion: canBePotion ?? this.canBePotion,
      difficultClass: difficultClass ?? this.difficultClass,
      conjurerLevel: conjurerLevel ?? this.conjurerLevel,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'level': level,
      'effect': effect,
      'school': school,
      'castingTime': castingTime,
      'range': range,
      'target': target,
      'duration': duration,
      'savingThrow': savingThrow,
      'spellResistance': spellResistance,
      'magicType': magicType,
      'canBePotion': canBePotion,
      'difficultClass': difficultClass,
      'conjurerLevel': conjurerLevel,
      'isSelected': isSelected,
    };
  }

  factory SpellModel.fromMap(Map<String, dynamic> map) {
    return SpellModel(
      name: map['name'] ?? '',
      level: map['level']?.toInt() ?? 0,
      effect: map['effect'] ?? '',
      school: map['school'] ?? '',
      castingTime: map['castingTime'] ?? '',
      range: map['range'] ?? '',
      target: map['target'] ?? '',
      duration: map['duration'] ?? '',
      savingThrow: map['savingThrow'] ?? '',
      spellResistance: map['spellResistance'] ?? '',
      magicType: map['magicType'] ?? '',
      canBePotion: map['canBePotion'] ?? false,
      difficultClass: map['difficultClass'] ?? '',
      conjurerLevel: map['conjurerLevel']?.toInt() ?? 0,
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpellModel.fromJson(String source) =>
      SpellModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SpellModel(name: $name, level: $level, effect: $effect, school: $school, castingTime: $castingTime, range: $range, target: $target, duration: $duration, savingThrow: $savingThrow, spellResistance: $spellResistance, magicType: $magicType, canBePotion: $canBePotion, difficultClass: $difficultClass, conjurerLevel: $conjurerLevel, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpellModel &&
        other.name == name &&
        other.level == level &&
        other.effect == effect &&
        other.school == school &&
        other.castingTime == castingTime &&
        other.range == range &&
        other.target == target &&
        other.duration == duration &&
        other.savingThrow == savingThrow &&
        other.spellResistance == spellResistance &&
        other.magicType == magicType &&
        other.canBePotion == canBePotion &&
        other.difficultClass == difficultClass &&
        other.conjurerLevel == conjurerLevel &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        level.hashCode ^
        effect.hashCode ^
        school.hashCode ^
        castingTime.hashCode ^
        range.hashCode ^
        target.hashCode ^
        duration.hashCode ^
        savingThrow.hashCode ^
        spellResistance.hashCode ^
        magicType.hashCode ^
        canBePotion.hashCode ^
        difficultClass.hashCode ^
        conjurerLevel.hashCode ^
        isSelected.hashCode;
  }
}
