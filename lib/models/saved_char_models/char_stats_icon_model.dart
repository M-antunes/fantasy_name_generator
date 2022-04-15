import 'dart:convert';

class CharStatsIconModel {
  final String iconlabel;
  final String iconSvg;
  bool isSelected;
  CharStatsIconModel({
    required this.iconlabel,
    required this.iconSvg,
    required this.isSelected,
  });

  CharStatsIconModel copyWith({
    String? iconlabel,
    String? iconSvg,
    bool? isSelected,
  }) {
    return CharStatsIconModel(
      iconlabel: iconlabel ?? this.iconlabel,
      iconSvg: iconSvg ?? this.iconSvg,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'iconlabel': iconlabel,
      'iconSvg': iconSvg,
      'isSelected': isSelected,
    };
  }

  factory CharStatsIconModel.fromMap(Map<String, dynamic> map) {
    return CharStatsIconModel(
      iconlabel: map['iconlabel'] ?? '',
      iconSvg: map['iconSvg'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CharStatsIconModel.fromJson(String source) =>
      CharStatsIconModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CharStatsIcon(iconlabel: $iconlabel, iconSvg: $iconSvg, isSelected: $isSelected)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharStatsIconModel &&
        other.iconlabel == iconlabel &&
        other.iconSvg == iconSvg &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode =>
      iconlabel.hashCode ^ iconSvg.hashCode ^ isSelected.hashCode;
}
