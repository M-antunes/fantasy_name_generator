import 'dart:convert';

class OffHandTypeModel {
  String name;
  bool isSelected;
  String picture;
  OffHandTypeModel({
    required this.name,
    required this.isSelected,
    required this.picture,
  });

  OffHandTypeModel copyWith({
    String? name,
    bool? isSelected,
    String? picture,
  }) {
    return OffHandTypeModel(
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

  factory OffHandTypeModel.fromMap(Map<String, dynamic> map) {
    return OffHandTypeModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
      picture: map['picture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OffHandTypeModel.fromJson(String source) =>
      OffHandTypeModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'OffHandTypeModel(name: $name, isSelected: $isSelected, picture: $picture)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OffHandTypeModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        other.picture == picture;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode ^ picture.hashCode;
}
