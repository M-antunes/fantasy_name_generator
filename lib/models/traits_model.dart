import 'dart:convert';

class TraitModel {
  final String traiName;
  final int levelAcquired;
  final String traiDescription;
  final int? multiplier;
  bool isSelected;
  TraitModel({
    required this.traiName,
    required this.levelAcquired,
    required this.traiDescription,
    this.multiplier,
    required this.isSelected,
  });

  TraitModel copyWith({
    String? traiName,
    int? levelAcquired,
    String? traiDescription,
    int? multiplier,
    bool? isSelected,
  }) {
    return TraitModel(
      traiName: traiName ?? this.traiName,
      levelAcquired: levelAcquired ?? this.levelAcquired,
      traiDescription: traiDescription ?? this.traiDescription,
      multiplier: multiplier ?? this.multiplier,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'traiName': traiName,
      'levelAcquired': levelAcquired,
      'traiDescription': traiDescription,
      'multiplier': multiplier,
      'isSelected': isSelected,
    };
  }

  factory TraitModel.fromMap(Map<String, dynamic> map) {
    return TraitModel(
      traiName: map['traiName'] ?? '',
      levelAcquired: map['levelAcquired']?.toInt() ?? 0,
      traiDescription: map['traiDescription'] ?? '',
      multiplier: map['multiplier']?.toInt(),
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TraitModel.fromJson(String source) =>
      TraitModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TraitModel(traiName: $traiName, levelAcquired: $levelAcquired, traiDescription: $traiDescription, multiplier: $multiplier, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TraitModel &&
        other.traiName == traiName &&
        other.levelAcquired == levelAcquired &&
        other.traiDescription == traiDescription &&
        other.multiplier == multiplier &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return traiName.hashCode ^
        levelAcquired.hashCode ^
        traiDescription.hashCode ^
        multiplier.hashCode ^
        isSelected.hashCode;
  }
}
