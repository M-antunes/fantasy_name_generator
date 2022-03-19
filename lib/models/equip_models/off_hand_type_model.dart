import 'dart:convert';

class OffHandTypeModel {
  String name;
  bool isSelected;
  String picture;
  String wielding;
  OffHandTypeModel({
    required this.name,
    required this.isSelected,
    required this.picture,
    required this.wielding,
  });

  OffHandTypeModel copyWith({
    String? name,
    bool? isSelected,
    String? picture,
    String? wielding,
  }) {
    return OffHandTypeModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      picture: picture ?? this.picture,
      wielding: wielding ?? this.wielding,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
      'picture': picture,
      'wielding': wielding,
    };
  }

  factory OffHandTypeModel.fromMap(Map<String, dynamic> map) {
    return OffHandTypeModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
      picture: map['picture'] ?? '',
      wielding: map['wielding'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OffHandTypeModel.fromJson(String source) =>
      OffHandTypeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OffHandTypeModel(name: $name, isSelected: $isSelected, picture: $picture, wielding: $wielding)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OffHandTypeModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        other.picture == picture &&
        other.wielding == wielding;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        isSelected.hashCode ^
        picture.hashCode ^
        wielding.hashCode;
  }
}
