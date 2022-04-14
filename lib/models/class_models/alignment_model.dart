import 'dart:convert';

class AlignmentModel {
  String name;
  bool isSelected;
  String? abreviation;
  String description;
  AlignmentModel({
    required this.name,
    required this.isSelected,
    this.abreviation,
    required this.description,
  });

  AlignmentModel copyWith({
    String? name,
    bool? isSelected,
    String? abreviation,
    String? description,
  }) {
    return AlignmentModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      abreviation: abreviation ?? this.abreviation,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
      'abreviation': abreviation,
      'description': description,
    };
  }

  factory AlignmentModel.fromMap(Map<String, dynamic> map) {
    return AlignmentModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
      abreviation: map['abreviation'],
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AlignmentModel.fromJson(String source) =>
      AlignmentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AlignmentModel(name: $name, isSelected: $isSelected, abreviation: $abreviation, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlignmentModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        other.abreviation == abreviation &&
        other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        isSelected.hashCode ^
        abreviation.hashCode ^
        description.hashCode;
  }
}
