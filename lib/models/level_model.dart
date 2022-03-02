import 'dart:convert';

import 'package:fantasy_name_generator/models/key_value.model.dart';

class LevelModel {
  final int level;
  final int good;
  final int bad;
  final KeyValueModel? classTraits;
  LevelModel({
    required this.level,
    required this.good,
    required this.bad,
    this.classTraits,
  });

  LevelModel copyWith({
    int? level,
    int? good,
    int? bad,
    KeyValueModel? classTraits,
  }) {
    return LevelModel(
      level: level ?? this.level,
      good: good ?? this.good,
      bad: bad ?? this.bad,
      classTraits: classTraits ?? this.classTraits,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'level': level,
      'good': good,
      'bad': bad,
      'classTraits': classTraits?.toMap(),
    };
  }

  factory LevelModel.fromMap(Map<String, dynamic> map) {
    return LevelModel(
      level: map['level']?.toInt() ?? 0,
      good: map['good']?.toInt() ?? 0,
      bad: map['bad']?.toInt() ?? 0,
      classTraits: map['classTraits'] != null
          ? KeyValueModel.fromMap(map['classTraits'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LevelModel.fromJson(String source) =>
      LevelModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LevelModel(level: $level, good: $good, bad: $bad, classTraits: $classTraits)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LevelModel &&
        other.level == level &&
        other.good == good &&
        other.bad == bad &&
        other.classTraits == classTraits;
  }

  @override
  int get hashCode {
    return level.hashCode ^ good.hashCode ^ bad.hashCode ^ classTraits.hashCode;
  }
}
