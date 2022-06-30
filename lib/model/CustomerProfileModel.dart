/// username : "shakeeb"
/// name : "Shakeeb Khan"
/// family_members : 4
/// phone_number : "+923147896819"
/// address : "Chungi #21, Multan"
/// subsidy_amount : 5000
/// subsidy_percentage : 25
/// starting_date : "2022-06-27T15:16:58.864207Z"
/// subsidy_date : "2022-06-27T15:16:58.883424Z"

class CustomerProfileModel {
  CustomerProfileModel({
      String? username, 
      String? name, 
      int? familyMembers, 
      String? phoneNumber, 
      String? address, 
      int? subsidyAmount, 
      int? subsidyPercentage, 
      String? startingDate, 
      String? subsidyDate,}){
    _username = username;
    _name = name;
    _familyMembers = familyMembers;
    _phoneNumber = phoneNumber;
    _address = address;
    _subsidyAmount = subsidyAmount;
    _subsidyPercentage = subsidyPercentage;
    _startingDate = startingDate;
    _subsidyDate = subsidyDate;
}

  CustomerProfileModel.fromJson(dynamic json) {
    _username = json['username'];
    _name = json['name'];
    _familyMembers = json['family_members'];
    _phoneNumber = json['phone_number'];
    _address = json['address'];
    _subsidyAmount = json['subsidy_amount'];
    _subsidyPercentage = json['subsidy_percentage'];
    _startingDate = json['starting_date'];
    _subsidyDate = json['subsidy_date'];
  }
  String? _username;
  String? _name;
  int? _familyMembers;
  String? _phoneNumber;
  String? _address;
  int? _subsidyAmount;
  int? _subsidyPercentage;
  String? _startingDate;
  String? _subsidyDate;
CustomerProfileModel copyWith({  String? username,
  String? name,
  int? familyMembers,
  String? phoneNumber,
  String? address,
  int? subsidyAmount,
  int? subsidyPercentage,
  String? startingDate,
  String? subsidyDate,
}) => CustomerProfileModel(  username: username ?? _username,
  name: name ?? _name,
  familyMembers: familyMembers ?? _familyMembers,
  phoneNumber: phoneNumber ?? _phoneNumber,
  address: address ?? _address,
  subsidyAmount: subsidyAmount ?? _subsidyAmount,
  subsidyPercentage: subsidyPercentage ?? _subsidyPercentage,
  startingDate: startingDate ?? _startingDate,
  subsidyDate: subsidyDate ?? _subsidyDate,
);
  String? get username => _username;
  String? get name => _name;
  int? get familyMembers => _familyMembers;
  String? get phoneNumber => _phoneNumber;
  String? get address => _address;
  int? get subsidyAmount => _subsidyAmount;
  int? get subsidyPercentage => _subsidyPercentage;
  String? get startingDate => _startingDate;
  String? get subsidyDate => _subsidyDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['name'] = _name;
    map['family_members'] = _familyMembers;
    map['phone_number'] = _phoneNumber;
    map['address'] = _address;
    map['subsidy_amount'] = _subsidyAmount;
    map['subsidy_percentage'] = _subsidyPercentage;
    map['starting_date'] = _startingDate;
    map['subsidy_date'] = _subsidyDate;
    return map;
  }

}