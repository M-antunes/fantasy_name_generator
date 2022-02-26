import 'dart:convert';

class ClassModel {
  final String name;
  bool isSelected;
  ClassModel({
    required this.name,
    required this.isSelected,
  });

  ClassModel copyWith({
    String? name,
    bool? isSelected,
  }) {
    return ClassModel(
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

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassModel.fromJson(String source) =>
      ClassModel.fromMap(json.decode(source));

  @override
  String toString() => 'ClassModel(name: $name, isSelected: $isSelected)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClassModel &&
        other.name == name &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode;
}
