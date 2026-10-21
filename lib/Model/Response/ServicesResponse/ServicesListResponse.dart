import 'dart:convert';
/// Data : {"Item":{"Categories":[{"Id":1,"NameAr":"معاملات ماليه","DescriptionAr":"معاملات ماليه","Icon":"-","Sort":1},{"Id":2,"NameAr":"خدمات حكوميه","DescriptionAr":"خدمات حكوميه","Icon":"-","Sort":2}],"Providers":[{"Id":1,"NameAr":"بى تك","DescriptionAr":"بى تك","Icon":"-","Sort":1,"CategoryId":1},{"Id":2,"NameAr":"خدمات المرور","DescriptionAr":"خدمات المرور","Icon":"-","Sort":2,"CategoryId":2}],"Services":[{"Id":1,"NameAr":"دفع فاتورة ب ى تك","Icon":"-","Sort":1,"ProviderId":1,"CurrentServiceProviderId":1,"ServiceConfig":{"DescriptionAr":"-","PoweredByAr":"CP","PriceValue":0.00,"PriceMinValue":1.00,"PriceMaxValue":1000.00,"PaymentType":1}},{"Id":2,"NameAr":"دفع مخالفات المرور","Icon":"-","Sort":1,"ProviderId":2,"CurrentServiceProviderId":1,"ServiceConfig":{"DescriptionAr":"test","PoweredByAr":"CP","PriceValue":0.00,"PriceMinValue":1.00,"PriceMaxValue":2.00,"PaymentType":1}}],"Parameters":[{"Id":7,"NameAr":"الرقم","MinLength":5,"MaxLength":5,"Sort":1,"ControleType":1,"ServiceId":1},{"Id":10,"NameAr":"الرقم القومي","MinLength":14,"MaxLength":14,"Sort":2,"ControleType":1,"ServiceId":2},{"Id":11,"NameAr":"الجزء الرقمي للوحة","MinLength":3,"MaxLength":5,"Sort":3,"ControleType":1,"ServiceId":2},{"Id":12,"NameAr":"عدد سنين التجديد","MinLength":3,"MaxLength":5,"Sort":3,"ControleType":1,"ServiceId":2},{"Id":13,"NameAr":"الموبايل","MinLength":3,"MaxLength":5,"Sort":3,"ControleType":1,"ServiceId":2}]},"Version":{"Api":"1"}}
/// Code : 200
/// Message : "عمليه ناجحه"

ServicesListResponse servicesListResponseFromJson(String str) => ServicesListResponse.fromJson(json.decode(str));
String servicesListResponseToJson(ServicesListResponse data) => json.encode(data.toJson());
class ServicesListResponse {
  ServicesListResponse({
      Data? data, 
      int? code, 
      String? message,}){
    _data = data;
    _code = code;
    _message = message;
}

  ServicesListResponse.fromJson(dynamic json) {
    _data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    _code = json['Code'];
    _message = json['Message'];
  }
  Data? _data;
  int? _code;
  String? _message;
ServicesListResponse copyWith({  Data? data,
  int? code,
  String? message,
}) => ServicesListResponse(  data: data ?? _data,
  code: code ?? _code,
  message: message ?? _message,
);
  Data? get data => _data;
  int? get code => _code;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['Data'] = _data?.toJson();
    }
    map['Code'] = _code;
    map['Message'] = _message;
    return map;
  }

}

/// Item : {"Categories":[{"Id":1,"NameAr":"معاملات ماليه","DescriptionAr":"معاملات ماليه","Icon":"-","Sort":1},{"Id":2,"NameAr":"خدمات حكوميه","DescriptionAr":"خدمات حكوميه","Icon":"-","Sort":2}],"Providers":[{"Id":1,"NameAr":"بى تك","DescriptionAr":"بى تك","Icon":"-","Sort":1,"CategoryId":1},{"Id":2,"NameAr":"خدمات المرور","DescriptionAr":"خدمات المرور","Icon":"-","Sort":2,"CategoryId":2}],"Services":[{"Id":1,"NameAr":"دفع فاتورة ب ى تك","Icon":"-","Sort":1,"ProviderId":1,"CurrentServiceProviderId":1,"ServiceConfig":{"DescriptionAr":"-","PoweredByAr":"CP","PriceValue":0.00,"PriceMinValue":1.00,"PriceMaxValue":1000.00,"PaymentType":1}},{"Id":2,"NameAr":"دفع مخالفات المرور","Icon":"-","Sort":1,"ProviderId":2,"CurrentServiceProviderId":1,"ServiceConfig":{"DescriptionAr":"test","PoweredByAr":"CP","PriceValue":0.00,"PriceMinValue":1.00,"PriceMaxValue":2.00,"PaymentType":1}}],"Parameters":[{"Id":7,"NameAr":"الرقم","MinLength":5,"MaxLength":5,"Sort":1,"ControleType":1,"ServiceId":1},{"Id":10,"NameAr":"الرقم القومي","MinLength":14,"MaxLength":14,"Sort":2,"ControleType":1,"ServiceId":2},{"Id":11,"NameAr":"الجزء الرقمي للوحة","MinLength":3,"MaxLength":5,"Sort":3,"ControleType":1,"ServiceId":2},{"Id":12,"NameAr":"عدد سنين التجديد","MinLength":3,"MaxLength":5,"Sort":3,"ControleType":1,"ServiceId":2},{"Id":13,"NameAr":"الموبايل","MinLength":3,"MaxLength":5,"Sort":3,"ControleType":1,"ServiceId":2}]}
/// Version : {"Api":"1"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      Item? item, 
      Version? version,}){
    _item = item;
    _version = version;
}

  Data.fromJson(dynamic json) {
    _item = json['ServiceList'] != null ? Item.fromJson(json['ServiceList']) : null;
    _version = json['Version'] != null ? Version.fromJson(json['Version']) : null;
  }
  Item? _item;
  Version? _version;
Data copyWith({  Item? item,
  Version? version,
}) => Data(  item: item ?? _item,
  version: version ?? _version,
);
  Item? get item => _item;
  Version? get version => _version;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_item != null) {
      map['ServiceList'] = _item?.toJson();
    }
    if (_version != null) {
      map['Version'] = _version?.toJson();
    }
    return map;
  }

}

/// Api : "1"

Version versionFromJson(String str) => Version.fromJson(json.decode(str));
String versionToJson(Version data) => json.encode(data.toJson());
class Version {
  Version({
      String? api,}){
    _api = api;
}

  Version.fromJson(dynamic json) {
    _api = json['Api'];
  }
  String? _api;
Version copyWith({  String? api,
}) => Version(  api: api ?? _api,
);
  String? get api => _api;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Api'] = _api;
    return map;
  }

}

/// Categories : [{"Id":1,"NameAr":"معاملات ماليه","DescriptionAr":"معاملات ماليه","Icon":"-","Sort":1},{"Id":2,"NameAr":"خدمات حكوميه","DescriptionAr":"خدمات حكوميه","Icon":"-","Sort":2}]
/// Providers : [{"Id":1,"NameAr":"بى تك","DescriptionAr":"بى تك","Icon":"-","Sort":1,"CategoryId":1},{"Id":2,"NameAr":"خدمات المرور","DescriptionAr":"خدمات المرور","Icon":"-","Sort":2,"CategoryId":2}]
/// Services : [{"Id":1,"NameAr":"دفع فاتورة ب ى تك","Icon":"-","Sort":1,"ProviderId":1,"CurrentServiceProviderId":1,"ServiceConfig":{"DescriptionAr":"-","PoweredByAr":"CP","PriceValue":0.00,"PriceMinValue":1.00,"PriceMaxValue":1000.00,"PaymentType":1}},{"Id":2,"NameAr":"دفع مخالفات المرور","Icon":"-","Sort":1,"ProviderId":2,"CurrentServiceProviderId":1,"ServiceConfig":{"DescriptionAr":"test","PoweredByAr":"CP","PriceValue":0.00,"PriceMinValue":1.00,"PriceMaxValue":2.00,"PaymentType":1}}]
/// Parameters : [{"Id":7,"NameAr":"الرقم","MinLength":5,"MaxLength":5,"Sort":1,"ControleType":1,"ServiceId":1},{"Id":10,"NameAr":"الرقم القومي","MinLength":14,"MaxLength":14,"Sort":2,"ControleType":1,"ServiceId":2},{"Id":11,"NameAr":"الجزء الرقمي للوحة","MinLength":3,"MaxLength":5,"Sort":3,"ControleType":1,"ServiceId":2},{"Id":12,"NameAr":"عدد سنين التجديد","MinLength":3,"MaxLength":5,"Sort":3,"ControleType":1,"ServiceId":2},{"Id":13,"NameAr":"الموبايل","MinLength":3,"MaxLength":5,"Sort":3,"ControleType":1,"ServiceId":2}]

Item itemFromJson(String str) => Item.fromJson(json.decode(str));
String itemToJson(Item data) => json.encode(data.toJson());
class Item {
  Item({
      List<Categories>? categories, 
      List<Providers>? providers, 
      List<Services>? services, 
      List<Parameters>? parameters,}){
    _categories = categories;
    _providers = providers;
    _services = services;
    _parameters = parameters;
}

  Item.fromJson(dynamic json) {
    if (json['Categories'] != null) {
      _categories = [];
      json['Categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    if (json['Providers'] != null) {
      _providers = [];
      json['Providers'].forEach((v) {
        _providers?.add(Providers.fromJson(v));
      });
    }
    if (json['Services'] != null) {
      _services = [];
      json['Services'].forEach((v) {
        _services?.add(Services.fromJson(v));
      });
    }
    if (json['Parameters'] != null) {
      _parameters = [];
      json['Parameters'].forEach((v) {
        _parameters?.add(Parameters.fromJson(v));
      });
    }
  }
  List<Categories>? _categories;
  List<Providers>? _providers;
  List<Services>? _services;
  List<Parameters>? _parameters;
Item copyWith({  List<Categories>? categories,
  List<Providers>? providers,
  List<Services>? services,
  List<Parameters>? parameters,
}) => Item(  categories: categories ?? _categories,
  providers: providers ?? _providers,
  services: services ?? _services,
  parameters: parameters ?? _parameters,
);
  List<Categories>? get categories => _categories;
  List<Providers>? get providers => _providers;
  List<Services>? get services => _services;
  List<Parameters>? get parameters => _parameters;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_categories != null) {
      map['Categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    if (_providers != null) {
      map['Providers'] = _providers?.map((v) => v.toJson()).toList();
    }
    if (_services != null) {
      map['Services'] = _services?.map((v) => v.toJson()).toList();
    }
    if (_parameters != null) {
      map['Parameters'] = _parameters?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Id : 7
/// NameAr : "الرقم"
/// MinLength : 5
/// MaxLength : 5
/// Sort : 1
/// ControleType : 1
/// ServiceId : 1

Parameters parametersFromJson(String str) => Parameters.fromJson(json.decode(str));
String parametersToJson(Parameters data) => json.encode(data.toJson());
class Parameters {
  Parameters({
      int? id, 
      String? nameAr, 
      int? minLength, 
      int? maxLength, 
      int? sort, 
      int? controleType, 
      int? serviceId,}){
    _id = id;
    _nameAr = nameAr;
    _minLength = minLength;
    _maxLength = maxLength;
    _sort = sort;
    _controleType = controleType;
    _serviceId = serviceId;
}

  Parameters.fromJson(dynamic json) {
    _id = json['Id'];
    _nameAr = json['NameAr'];
    _minLength = json['MinLength'];
    _maxLength = json['MaxLength'];
    _sort = json['Sort'];
    _controleType = json['ControleType'];
    _serviceId = json['ServiceId'];
  }
  int? _id;
  String? _nameAr;
  int? _minLength;
  int? _maxLength;
  int? _sort;
  int? _controleType;
  int? _serviceId;
Parameters copyWith({  int? id,
  String? nameAr,
  int? minLength,
  int? maxLength,
  int? sort,
  int? controleType,
  int? serviceId,
}) => Parameters(  id: id ?? _id,
  nameAr: nameAr ?? _nameAr,
  minLength: minLength ?? _minLength,
  maxLength: maxLength ?? _maxLength,
  sort: sort ?? _sort,
  controleType: controleType ?? _controleType,
  serviceId: serviceId ?? _serviceId,
);
  int? get id => _id;
  String? get nameAr => _nameAr;
  int? get minLength => _minLength;
  int? get maxLength => _maxLength;
  int? get sort => _sort;
  int? get controleType => _controleType;
  int? get serviceId => _serviceId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['NameAr'] = _nameAr;
    map['MinLength'] = _minLength;
    map['MaxLength'] = _maxLength;
    map['Sort'] = _sort;
    map['ControleType'] = _controleType;
    map['ServiceId'] = _serviceId;
    return map;
  }

}

/// Id : 1
/// NameAr : "دفع فاتورة ب ى تك"
/// Icon : "-"
/// Sort : 1
/// ProviderId : 1
/// CurrentServiceProviderId : 1
/// ServiceConfig : {"DescriptionAr":"-","PoweredByAr":"CP","PriceValue":0.00,"PriceMinValue":1.00,"PriceMaxValue":1000.00,"PaymentType":1}

Services servicesFromJson(String str) => Services.fromJson(json.decode(str));
String servicesToJson(Services data) => json.encode(data.toJson());
class Services {
  Services({
      int? id, 
      String? nameAr, 
      String? icon, 
      int? sort, 
      int? providerId, 
      int? currentServiceProviderId, 
      ServiceConfig? serviceConfig,}){
    _id = id;
    _nameAr = nameAr;
    _icon = icon;
    _sort = sort;
    _providerId = providerId;
    _currentServiceProviderId = currentServiceProviderId;
    _serviceConfig = serviceConfig;
}

  Services.fromJson(dynamic json) {
    _id = json['Id'];
    _nameAr = json['NameAr'];
    _icon = json['Icon'];
    _sort = json['Sort'];
    _providerId = json['ProviderId'];
    _currentServiceProviderId = json['CurrentServiceProviderId'];
    _serviceConfig = json['ServiceConfig'] != null ? ServiceConfig.fromJson(json['ServiceConfig']) : null;
  }
  int? _id;
  String? _nameAr;
  String? _icon;
  int? _sort;
  int? _providerId;
  int? _currentServiceProviderId;
  ServiceConfig? _serviceConfig;
Services copyWith({  int? id,
  String? nameAr,
  String? icon,
  int? sort,
  int? providerId,
  int? currentServiceProviderId,
  ServiceConfig? serviceConfig,
}) => Services(  id: id ?? _id,
  nameAr: nameAr ?? _nameAr,
  icon: icon ?? _icon,
  sort: sort ?? _sort,
  providerId: providerId ?? _providerId,
  currentServiceProviderId: currentServiceProviderId ?? _currentServiceProviderId,
  serviceConfig: serviceConfig ?? _serviceConfig,
);
  int? get id => _id;
  String? get nameAr => _nameAr;
  String? get icon => _icon;
  int? get sort => _sort;
  int? get providerId => _providerId;
  int? get currentServiceProviderId => _currentServiceProviderId;
  ServiceConfig? get serviceConfig => _serviceConfig;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['NameAr'] = _nameAr;
    map['Icon'] = _icon;
    map['Sort'] = _sort;
    map['ProviderId'] = _providerId;
    map['CurrentServiceProviderId'] = _currentServiceProviderId;
    if (_serviceConfig != null) {
      map['ServiceConfig'] = _serviceConfig?.toJson();
    }
    return map;
  }

}

/// DescriptionAr : "-"
/// PoweredByAr : "CP"
/// PriceValue : 0.00
/// PriceMinValue : 1.00
/// PriceMaxValue : 1000.00
/// PaymentType : 1

ServiceConfig serviceConfigFromJson(String str) => ServiceConfig.fromJson(json.decode(str));
String serviceConfigToJson(ServiceConfig data) => json.encode(data.toJson());
class ServiceConfig {
  ServiceConfig({
      String? descriptionAr, 
      String? poweredByAr, 
      double? priceValue, 
      double? priceMinValue, 
      double? priceMaxValue, 
      int? paymentType,}){
    _descriptionAr = descriptionAr;
    _poweredByAr = poweredByAr;
    _priceValue = priceValue;
    _priceMinValue = priceMinValue;
    _priceMaxValue = priceMaxValue;
    _paymentType = paymentType;
}

  ServiceConfig.fromJson(dynamic json) {
    _descriptionAr = json['DescriptionAr'];
    _poweredByAr = json['PoweredByAr'];
    _priceValue = json['PriceValue'];
    _priceMinValue = json['PriceMinValue'];
    _priceMaxValue = json['PriceMaxValue'];
    _paymentType = json['PaymentType'];
  }
  String? _descriptionAr;
  String? _poweredByAr;
  double? _priceValue;
  double? _priceMinValue;
  double? _priceMaxValue;
  int? _paymentType;
ServiceConfig copyWith({  String? descriptionAr,
  String? poweredByAr,
  double? priceValue,
  double? priceMinValue,
  double? priceMaxValue,
  int? paymentType,
}) => ServiceConfig(  descriptionAr: descriptionAr ?? _descriptionAr,
  poweredByAr: poweredByAr ?? _poweredByAr,
  priceValue: priceValue ?? _priceValue,
  priceMinValue: priceMinValue ?? _priceMinValue,
  priceMaxValue: priceMaxValue ?? _priceMaxValue,
  paymentType: paymentType ?? _paymentType,
);
  String? get descriptionAr => _descriptionAr;
  String? get poweredByAr => _poweredByAr;
  double? get priceValue => _priceValue;
  double? get priceMinValue => _priceMinValue;
  double? get priceMaxValue => _priceMaxValue;
  int? get paymentType => _paymentType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['DescriptionAr'] = _descriptionAr;
    map['PoweredByAr'] = _poweredByAr;
    map['PriceValue'] = _priceValue;
    map['PriceMinValue'] = _priceMinValue;
    map['PriceMaxValue'] = _priceMaxValue;
    map['PaymentType'] = _paymentType;
    return map;
  }

}

/// Id : 1
/// NameAr : "بى تك"
/// DescriptionAr : "بى تك"
/// Icon : "-"
/// Sort : 1
/// CategoryId : 1

Providers providersFromJson(String str) => Providers.fromJson(json.decode(str));
String providersToJson(Providers data) => json.encode(data.toJson());
class Providers {
  Providers({
      int? id, 
      String? nameAr, 
      String? descriptionAr, 
      String? icon, 
      int? sort, 
      int? categoryId,}){
    _id = id;
    _nameAr = nameAr;
    _descriptionAr = descriptionAr;
    _icon = icon;
    _sort = sort;
    _categoryId = categoryId;
}

  Providers.fromJson(dynamic json) {
    _id = json['Id'];
    _nameAr = json['NameAr'];
    _descriptionAr = json['DescriptionAr'];
    _icon = json['Icon'];
    _sort = json['Sort'];
    _categoryId = json['CategoryId'];
  }
  int? _id;
  String? _nameAr;
  String? _descriptionAr;
  String? _icon;
  int? _sort;
  int? _categoryId;
Providers copyWith({  int? id,
  String? nameAr,
  String? descriptionAr,
  String? icon,
  int? sort,
  int? categoryId,
}) => Providers(  id: id ?? _id,
  nameAr: nameAr ?? _nameAr,
  descriptionAr: descriptionAr ?? _descriptionAr,
  icon: icon ?? _icon,
  sort: sort ?? _sort,
  categoryId: categoryId ?? _categoryId,
);
  int? get id => _id;
  String? get nameAr => _nameAr;
  String? get descriptionAr => _descriptionAr;
  String? get icon => _icon;
  int? get sort => _sort;
  int? get categoryId => _categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['NameAr'] = _nameAr;
    map['DescriptionAr'] = _descriptionAr;
    map['Icon'] = _icon;
    map['Sort'] = _sort;
    map['CategoryId'] = _categoryId;
    return map;
  }

}

/// Id : 1
/// NameAr : "معاملات ماليه"
/// DescriptionAr : "معاملات ماليه"
/// Icon : "-"
/// Sort : 1

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));
String categoriesToJson(Categories data) => json.encode(data.toJson());
class Categories {
  Categories({
      int? id, 
      String? nameAr, 
      String? descriptionAr, 
      String? icon, 
      int? sort,}){
    _id = id;
    _nameAr = nameAr;
    _descriptionAr = descriptionAr;
    _icon = icon;
    _sort = sort;
}

  Categories.fromJson(dynamic json) {
    _id = json['Id'];
    _nameAr = json['NameAr'];
    _descriptionAr = json['DescriptionAr'];
    _icon = json['Icon'];
    _sort = json['Sort'];
  }
  int? _id;
  String? _nameAr;
  String? _descriptionAr;
  String? _icon;
  int? _sort;
Categories copyWith({  int? id,
  String? nameAr,
  String? descriptionAr,
  String? icon,
  int? sort,
}) => Categories(  id: id ?? _id,
  nameAr: nameAr ?? _nameAr,
  descriptionAr: descriptionAr ?? _descriptionAr,
  icon: icon ?? _icon,
  sort: sort ?? _sort,
);
  int? get id => _id;
  String? get nameAr => _nameAr;
  String? get descriptionAr => _descriptionAr;
  String? get icon => _icon;
  int? get sort => _sort;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = _id;
    map['NameAr'] = _nameAr;
    map['DescriptionAr'] = _descriptionAr;
    map['Icon'] = _icon;
    map['Sort'] = _sort;
    return map;
  }

}