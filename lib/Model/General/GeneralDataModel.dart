class GeneralDataModel {
  GeneralDataModel({
      this.key, 
      this.value,});

  GeneralDataModel.fromJson(dynamic json) {
    key = json['key'];
    value = json['value'];
  }
  String? key;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['value'] = value;
    return map;
  }

}