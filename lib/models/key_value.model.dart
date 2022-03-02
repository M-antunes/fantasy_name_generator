import 'dart:convert';

class KeyValueModel {
  dynamic key;
  dynamic value;
  KeyValueModel({
    required this.key,
    required this.value,
  });

  KeyValueModel copyWith({
    dynamic key,
    dynamic value,
  }) {
    return KeyValueModel(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'value': value,
    };
  }

  factory KeyValueModel.fromMap(Map<String, dynamic> map) {
    return KeyValueModel(
      key: map['key'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KeyValueModel.fromJson(String source) =>
      KeyValueModel.fromMap(json.decode(source));

  @override
  String toString() => 'KeyValueModel(key: $key, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KeyValueModel && other.key == key && other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}
