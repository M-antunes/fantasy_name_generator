import 'dart:convert';

import 'package:flutter/foundation.dart';

class OffHandTypeModel {
  String name;
  bool isSelected;
  String picture;
  List<String> forbiddenTo;
  OffHandTypeModel({
    required this.name,
    required this.isSelected,
    required this.picture,
    required this.forbiddenTo,
  });

  OffHandTypeModel copyWith({
    String? name,
    bool? isSelected,
    String? picture,
    List<String>? forbiddenTo,
  }) {
    return OffHandTypeModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      picture: picture ?? this.picture,
      forbiddenTo: forbiddenTo ?? this.forbiddenTo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
      'picture': picture,
      'forbiddenTo': forbiddenTo,
    };
  }

  factory OffHandTypeModel.fromMap(Map<String, dynamic> map) {
    return OffHandTypeModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
      picture: map['picture'] ?? '',
      forbiddenTo: List<String>.from(map['forbiddenTo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OffHandTypeModel.fromJson(String source) =>
      OffHandTypeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OffHandTypeModel(name: $name, isSelected: $isSelected, picture: $picture, forbiddenTo: $forbiddenTo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OffHandTypeModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        other.picture == picture &&
        listEquals(other.forbiddenTo, forbiddenTo);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        isSelected.hashCode ^
        picture.hashCode ^
        forbiddenTo.hashCode;
  }
}
