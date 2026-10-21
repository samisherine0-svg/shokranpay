/// Key : "XX"
/// Value : "xx"

class DetailsPayModel {
  DetailsPayModel({
    String? key,
    String? value,
    bool? isSeperator,
  }) {
    _key = key;
    _value = value;
    _isSeperator = isSeperator;
  }

  DetailsPayModel.fromJson(dynamic json) {
    _key = json['Key'];
    _value = json['Value'];
    _isSeperator = json['isSeperator'];
  }

  String? _key;
  String? _value;
  bool? _isSeperator;

  DetailsPayModel copyWith({
    String? key,
    String? value,
    bool? isSeperator,
  }) =>
      DetailsPayModel(
        key: key ?? _key,
        value: value ?? _value,
        isSeperator: isSeperator ?? _isSeperator,
      );

  String? get key => _key;

  String? get value => _value;

  bool? get isSeperator => _isSeperator;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Key'] = _key;
    map['Value'] = _value;
    map['isSeperator'] = _isSeperator;
    return map;
  }
}
