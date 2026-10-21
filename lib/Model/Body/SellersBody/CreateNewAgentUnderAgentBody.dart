class CreateNewAgentUnderAgentBody {
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? password;
  String? phoneNumber;
  String? nationlID;
  String? shopName;
  String? Address;
  int? villageId;
  int? AppType;
  List<int>? attachmentsIds;

  CreateNewAgentUnderAgentBody(
      {this.firstName,
        this.lastName,
        this.userName,
        this.email,
        this.AppType,
        this.password,
        this.phoneNumber,
        this.nationlID,
        this.shopName,
        this.Address,
        this.villageId,
        this.attachmentsIds});

  CreateNewAgentUnderAgentBody.fromJson(Map<String, dynamic> json) {
    Address = json['FullAddress'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    userName = json['UserName'];
    AppType = json['AppType'];
    email = json['Email'];
    password = json['Password'];
    phoneNumber = json['PhoneNumber'];
    nationlID = json['NationlID'];
    shopName = json['ShopName'];
    villageId = json['VillageId'];
    attachmentsIds = json['attachmentsIds'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FullAddress'] = this.Address;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['UserName'] = this.userName;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['AppType'] = this.AppType;
    data['PhoneNumber'] = this.phoneNumber;
    data['NationlID'] = this.nationlID;
    data['ShopName'] = this.shopName;
    data['VillageId'] = this.villageId;
    data['attachmentsIds'] = this.attachmentsIds;
    return data;
  }
}