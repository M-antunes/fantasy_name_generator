import 'dart:convert';

class RaceModel {
  final String name;
  bool isSelected;
  RaceModel({
    required this.name,
    required this.isSelected,
  });

  RaceModel copyWith({
    String? name,
    bool? isSelected,
  }) {
    return RaceModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
    };
  }

  factory RaceModel.fromMap(Map<String, dynamic> map) {
    return RaceModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory RaceModel.fromJson(String source) =>
      RaceModel.fromMap(json.decode(source));

  @override
  String toString() => 'RaceModel(name: $name, isSelected: $isSelected)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RaceModel &&
        other.name == name &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode;
}
