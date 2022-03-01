import 'dart:convert';

class GoodOrBadResistModel {
  final int level;
  final int good;
  final int bad;
  GoodOrBadResistModel({
    required this.level,
    required this.good,
    required this.bad,
  });

  GoodOrBadResistModel copyWith({
    int? level,
    int? good,
    int? bad,
  }) {
    return GoodOrBadResistModel(
      level: level ?? this.level,
      good: good ?? this.good,
      bad: bad ?? this.bad,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'level': level,
      'good': good,
      'bad': bad,
    };
  }

  factory GoodOrBadResistModel.fromMap(Map<String, dynamic> map) {
    return GoodOrBadResistModel(
      level: map['level']?.toInt() ?? 0,
      good: map['good']?.toInt() ?? 0,
      bad: map['bad']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory GoodOrBadResistModel.fromJson(String source) =>
      GoodOrBadResistModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'GoodOrBadResistModel(level: $level, good: $good, bad: $bad)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GoodOrBadResistModel &&
        other.level == level &&
        other.good == good &&
        other.bad == bad;
  }

  @override
  int get hashCode => level.hashCode ^ good.hashCode ^ bad.hashCode;
}
