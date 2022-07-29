class User {
  late String? uid;
  late String? username;
  late String? password;
  late String? alias;
  late String? firstName;
  late String? lastName;
  late bool? statusLogin;
  late bool? speciallyNotification;
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
    this.statusLogin,
    this.speciallyNotification,
    this.phoneNumber,
    this.image,
    this.paymentType,
  });
}
