import 'dart:convert';

class AlignmentModel {
  String name;
  bool isSelected;
  AlignmentModel({
    required this.name,
    required this.isSelected,
  });

  AlignmentModel copyWith({
    String? name,
    bool? isSelected,
  }) {
    return AlignmentModel(
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

  factory AlignmentModel.fromMap(Map<String, dynamic> map) {
    return AlignmentModel(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlignmentModel.fromJson(String source) =>
      AlignmentModel.fromMap(json.decode(source));

  @override
  String toString() => 'AlignmentModel(name: $name, isSelected: $isSelected)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlignmentModel &&
        other.name == name &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode;
}
