import 'dart:convert';

class AlignmentModel {
  String name;
  bool isSelected;
  String? abreviation;
  AlignmentModel({
    required this.name,
    required this.isSelected,
    this.abreviation,
  });

  AlignmentModel copyWith({
    String? name,
    bool? isSelected,
    String? abreviation,
  }) {
    return AlignmentModel(
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
      abreviation: abreviation ?? this.abreviation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isSelected': isSelected,
      'abreviation': abreviation,
    };
  }

  factory AlignmentModel.fromMap(Map<String, dynamic> map) {
    return AlignmentModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
      abreviation: map['abreviation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AlignmentModel.fromJson(String source) =>
      AlignmentModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AlignmentModel(name: $name, isSelected: $isSelected, abreviation: $abreviation)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlignmentModel &&
        other.name == name &&
        other.isSelected == isSelected &&
        other.abreviation == abreviation;
  }

  @override
  int get hashCode =>
      name.hashCode ^ isSelected.hashCode ^ abreviation.hashCode;
}
