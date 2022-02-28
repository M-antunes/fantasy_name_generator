import 'dart:convert';

class ResistanceModel {
  final int? fortitude;
  final int? reflex;
  final int? will;
  ResistanceModel({
    this.fortitude = 0,
    this.reflex = 0,
    this.will = 0,
  });

  ResistanceModel copyWith({
    int? fortitude,
    int? reflex,
    int? will,
  }) {
    return ResistanceModel(
      fortitude: fortitude ?? this.fortitude,
      reflex: reflex ?? this.reflex,
      will: will ?? this.will,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fortitude': fortitude,
      'reflex': reflex,
      'will': will,
    };
  }

  factory ResistanceModel.fromMap(Map<String, dynamic> map) {
    return ResistanceModel(
      fortitude: map['fortitude']?.toInt() ?? 0,
      reflex: map['reflex']?.toInt() ?? 0,
      will: map['will']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResistanceModel.fromJson(String source) =>
      ResistanceModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ResistanceModel(fortitude: $fortitude, reflex: $reflex, will: $will)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResistanceModel &&
        other.fortitude == fortitude &&
        other.reflex == reflex &&
        other.will == will;
  }

  @override
  int get hashCode => fortitude.hashCode ^ reflex.hashCode ^ will.hashCode;
}
