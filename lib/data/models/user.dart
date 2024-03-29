import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_nija_application/app/core/utils/firebase_consts.dart';

class Users {
  late String uid;
  late String username;
  late String alias;
  late String firstName;
  late String lastName;
  late String photoUrl;
  bool statusLogin;
  bool speciallyNotification;
  late String phoneNumber;
  late String paymentType;
  late String address;
  late String userEmail;
  var userCart = [];
  var userWish = [];
  Users({
    required this.uid,
    required this.username,
    required this.photoUrl,
    required this.alias,
    required this.firstName,
    required this.lastName,
    this.statusLogin = false,
    this.speciallyNotification = false,
    required this.phoneNumber,
    required this.paymentType,
    required this.address,
    required this.userEmail,
    required this.userCart,
    required this.userWish,
  });

  static Users fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Users(
      username: snapshot["username"],
      uid: snapshot["uid"],
      alias: snapshot["alias"],
      photoUrl: snapshot["photoUrl"],
      firstName: snapshot["firstName"],
      lastName: snapshot["lastName"],
      statusLogin: snapshot["statusLogin"],
      speciallyNotification: snapshot["speciallyNotification"],
      phoneNumber: snapshot["phoneNumber"],
      paymentType: snapshot["paymentType"],
      address: snapshot["address"],
      userEmail: snapshot["userEmail"],
      userCart: snapshot['userCart'],
      userWish: snapshot['userWish'],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "alias": alias,
        "photoUrl": photoUrl,
        "firstName": firstName,
        "lastName": lastName,
        "statusLogin": statusLogin,
        "speciallyNotification": speciallyNotification,
        "phoneNumber": phoneNumber,
        "paymentType": paymentType,
        "address": address,
        "userEmail": userEmail,
        "userCart": userCart,
        "userWish": userWish,
      };
}
