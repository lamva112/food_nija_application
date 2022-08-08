class Users {
  late String? uid;
  late String? username;
  late String? alias;
  late String? firstName;
  late String? lastName;
  late String? photoUrl;
  bool statusLogin;
  bool speciallyNotification;
  late String? phoneNumber;
  late String? paymentType;
  late String? address;
  Users({
    this.uid,
    this.username,
    this.photoUrl,
    this.alias,
    this.firstName,
    this.lastName,
    this.statusLogin = false,
    this.speciallyNotification = false,
    this.phoneNumber,
    this.paymentType,
    this.address,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "alias": alias,
        "photoUrl": photoUrl,
        "firstName": firstName,
        "lastName": lastName,
        "photoUrl": photoUrl,
        "speciallyNotification": speciallyNotification,
        "phoneNumber": phoneNumber,
        "paymentType": paymentType,
        "address": address,
      };
}
