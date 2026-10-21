class AddressResponse {
  Data? data;
  int? code;
  String? message;

  AddressResponse({this.data, this.code, this.message});

  AddressResponse.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    code = json['Code'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Code'] = this.code;
    data['Message'] = this.message;
    return data;
  }
}

class Data {
  List<Governorates>? governorates;
  List<Cities>? cities;
  List<Villages>? villages;

  Data({this.governorates, this.cities, this.villages});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Governorates'] != null) {
      governorates = [];
      json['Governorates'].forEach((v) {
        governorates!.add(new Governorates.fromJson(v));
      });
    }
    if (json['Cities'] != null) {
      cities = [];
      json['Cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
    if (json['Villages'] != null) {
      villages = [];
      json['Villages'].forEach((v) {
        villages!.add(new Villages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.governorates != null) {
      data['Governorates'] = this.governorates!.map((v) => v.toJson()).toList();
    }
    if (this.cities != null) {
      data['Cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    if (this.villages != null) {
      data['Villages'] = this.villages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Governorates {
  int? id;
  bool? isActive;
  String? name;

  Governorates({this.id, this.isActive, this.name});

  Governorates.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    isActive = json['IsActive'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['IsActive'] = this.isActive;
    data['Name'] = this.name;
    return data;
  }
}

class Cities {
  int? id;
  bool? isActive;
  String? name;
  int? governorateId;

  Cities({this.id, this.isActive, this.name, this.governorateId});

  Cities.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    isActive = json['IsActive'];
    name = json['Name'];
    governorateId = json['GovernorateId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['IsActive'] = this.isActive;
    data['Name'] = this.name;
    data['GovernorateId'] = this.governorateId;
    return data;
  }
}

class Villages {
  int? id;
  bool? isActive;
  String? name;
  int? cityId;

  Villages({this.id, this.isActive, this.name, this.cityId});

  Villages.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    isActive = json['IsActive'];
    name = json['Name'];
    cityId = json['CityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['IsActive'] = this.isActive;
    data['Name'] = this.name;
    data['CityId'] = this.cityId;
    return data;
  }
}
