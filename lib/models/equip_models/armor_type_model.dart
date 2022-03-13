import 'dart:convert';

class ArmorTypeModel {
  String name;
  bool isSelected;
  String picture;
  ArmorTypeModel({
    required this.name,
    required this.isSelected,
    required this.picture,
  });

  ArmorTypeModel copyWith({
    String? name,
    bool? isSelected,
    String? picture,
  }) {
    return ArmorTypeModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
      'picture': picture,
    };
  }

  factory ArmorTypeModel.fromMap(Map<String, dynamic> map) {
    return ArmorTypeModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
      picture: map['picture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ArmorTypeModel.fromJson(String source) =>
      ArmorTypeModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ArmorTypeModel(name: $name, isSelected: $isSelected, picture: $picture)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ArmorTypeModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        other.picture == picture;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode ^ picture.hashCode;
}
