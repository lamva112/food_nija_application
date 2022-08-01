class User {
  late String? uid;
  late String? username;
  late String? password;
  late String? alias;
  late String? firstName;
  late String? lastName;
  bool statusLogin;
  bool speciallyNotification;
  late String? phoneNumber;
  late String? image;
  late int? paymentType;
  User({
    this.uid,
    this.username,
    this.password,
    this.alias,
    this.firstName,
    this.lastName,
    this.statusLogin = false,
    this.speciallyNotification = false,
    this.phoneNumber,
    this.image,
    this.paymentType,
  });
}
