class CreateNewAccountResponse {
  Data? data;
  int? code;
  String? message;

  CreateNewAccountResponse({this.data, this.code, this.message});

  CreateNewAccountResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  bool? isActive;
  String? firstName;
  String? lastName;
  String?  userName;
  String?  email;
  String?  password;
  String?  phoneNumber;
  String?  nationlID;
  String?  shopName;
  int?  agentRequestStatus;
  int?  parentId;
  int? villageId;
  List<int>?  attachmentsIds;

  Data(
      {this.id,
        this.isActive,
        this.firstName,
        this.lastName,
        this.userName,
        this.email,
        this.password,
        this.phoneNumber,
        this.nationlID,
        this.shopName,
        this.agentRequestStatus,
        this.parentId,
        this.villageId,
        this.attachmentsIds});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    isActive = json['IsActive'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    userName = json['UserName'];
    email = json['Email'];
    password = json['Password'];
    phoneNumber = json['PhoneNumber'];
    nationlID = json['NationlID'];
    shopName = json['ShopName'];
    agentRequestStatus = json['AgentRequestStatus'];
    parentId = json['ParentId'];
    villageId = json['VillageId'];
    attachmentsIds = json['attachmentsIds'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['IsActive'] = this.isActive;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['UserName'] = this.userName;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['PhoneNumber'] = this.phoneNumber;
    data['NationlID'] = this.nationlID;
    data['ShopName'] = this.shopName;
    data['AgentRequestStatus'] = this.agentRequestStatus;
    data['ParentId'] = this.parentId;
    data['VillageId'] = this.villageId;
    data['attachmentsIds'] = this.attachmentsIds;
    return data;
  }
}