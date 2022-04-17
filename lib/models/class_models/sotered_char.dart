import 'dart:convert';

class StoredCharClass {
  final String name;
  bool isSelected;
  StoredCharClass({
    required this.name,
    required this.isSelected,
  });

  StoredCharClass copyWith({
    String? name,
    bool? isSelected,
  }) {
    return StoredCharClass(
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

  factory StoredCharClass.fromMap(Map<String, dynamic> map) {
    return StoredCharClass(
      name: map['name'] ?? '',
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory StoredCharClass.fromJson(String source) =>
      StoredCharClass.fromMap(json.decode(source));

  @override
  String toString() => 'StoredChar(name: $name, isSelected: $isSelected)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StoredCharClass &&
        other.name == name &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode => name.hashCode ^ isSelected.hashCode;
}
