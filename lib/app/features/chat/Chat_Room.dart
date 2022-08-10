import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_nija_application/app/change_notifies/user_provider.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ChatRoom extends StatefulWidget {
  String messagesId;
  String contactname;
  String contactphotoURl;
  ChatRoom(
      {super.key,
      required this.messagesId,
      required this.contactname,
      required this.contactphotoURl});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final TextEditingController _message = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController messageController = TextEditingController();

  GlobalKey<FormState> messageFormKey = GlobalKey<FormState>();

  File? imageFile;

  Future getImage({required String username, required String photoUrl}) async {
    ImagePicker _picker = ImagePicker();

    await _picker.pickImage(source: ImageSource.gallery).then((xFile) {
      if (xFile != null) {
        imageFile = File(xFile.path);
        uploadImage(userName: username, photoUrl: photoUrl);
      }
    });
  }

  Future uploadImage(
      {required String userName, required String photoUrl}) async {
    FocusScope.of(context).unfocus();
    String fileName = Uuid().v1();
    int status = 1;
    var ref = FirebaseStorage.instance.ref().child('images').child("$fileName");
    var uploadTask = await ref.putFile(imageFile!);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    await _firestore
        .collection('messages')
        .doc(widget.messagesId)
        .collection('chats')
        .doc(fileName)
        .set({
      "sendby": userName,
      "message": downloadUrl,
      "type": "img",
      "time": FieldValue.serverTimestamp(),
      "lasttime": DateFormat('hh:mm a').format(DateTime.now()),
    });

    await _firestore.collection('messages').doc(widget.messagesId).set({
      "user1": widget.contactname,
      "user2": userName,
      "photoUrl1": photoUrl,
      "photoUrl2": widget.contactphotoURl,
      "message": "Sent you an image",
      "type": "image",
      "lasttime": DateFormat('hh:mm a').format(DateTime.now()),
      "Members": [userName, widget.contactname],
      'RoomId': widget.messagesId,
    });
  }

  void onSendMessage(
      {required String username, required String photoUrl}) async {
    if (_message.text.isNotEmpty) {
      FocusScope.of(context).unfocus();
      Map<String, dynamic> messages = {
        "sendby": username,
        "message": _message.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
        "lasttime": DateFormat('hh:mm a').format(DateTime.now()),
      };

      await _firestore
          .collection('messages')
          .doc(widget.messagesId)
          .collection('chats')
          .add(messages);

      await _firestore.collection('messages').doc(widget.messagesId).set({
        "user1": widget.contactname,
        "user2": username,
        "photoUrl1": photoUrl,
        "photoUrl2": widget.contactphotoURl,
        "message": _message.text,
        "type": "text",
        "lasttime": DateFormat('hh:mm a').format(DateTime.now()),
        "Members": [username, widget.contactname],
        'RoomId': widget.messagesId,
      });
      _message.clear();
    } else {
      print("Enter Some Text");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
          ),
          Container(
            // scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: EdgeInsets.only(left: 12),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Iconsax.back_square,
                        size: 28,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {},
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          duration: Duration(milliseconds: 300),
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 64,
                                offset: Offset(8, 8),
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Container(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.center,
                            child: Icon(
                              Iconsax.call,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        padding: EdgeInsets.only(right: 28),
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {},
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            duration: Duration(milliseconds: 300),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 64,
                                  offset: Offset(8, 8),
                                ),
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Container(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.center,
                              child: Icon(
                                Iconsax.video,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      width: 12,
                    ),
                    AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 300),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: 48,
                        height: 48,
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.network(
                              widget.contactphotoURl,
                              fit: BoxFit.cover,
                              width: 48,
                              height: 48,
                            ),
                          ),
                        ),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        widget.contactname,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 672,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36.0),
                      topRight: Radius.circular(36.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 672,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 32),
                              Container(
                                height: size.height,
                                width: size.width,
                                padding: EdgeInsets.only(left: 24, right: 24),
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('messages')
                                      .doc(widget.messagesId)
                                      .collection('chats')
                                      .orderBy("time", descending: false)
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }

                                    return ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              SizedBox(height: 16),
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        Map<String, dynamic> map =
                                            snapshot.data!.docs[index].data()
                                                as Map<String, dynamic>;
                                        return messages(size, map, context,
                                            userProvider.getUser.username);
                                      },
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 32),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomSheet: Container(
        height: 54,
        width: size.width,
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 28, right: 28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          color: Colors.transparent,
        ),
        child: Row(
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.only(left: 4),
              onPressed: () {
                getImage(
                    username: userProvider.getUser.username,
                    photoUrl: userProvider.getUser.photoUrl);
              },
              icon: Icon(
                Iconsax.image,
                size: 28,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 18),
            Expanded(
                child: Form(
              key: messageFormKey,
              child: TextField(
                  controller: _message,
                  // onChanged: (value) => setState(() {
                  //       message = value;
                  //     }),
                  onEditingComplete: () {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    hintText: "Type your message...",
                  )),
            )),
            SizedBox(width: 20),
            Container(
              child: AnimatedContainer(
                alignment: Alignment.center,
                duration: Duration(milliseconds: 300),
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 64,
                      offset: Offset(8, 8),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.only(right: 8),
                  // padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(Iconsax.send1),
                    iconSize: 18,
                    color: Colors.white,
                    onPressed: () {
                      onSendMessage(
                        username: userProvider.getUser.username,
                        photoUrl: userProvider.getUser.photoUrl,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget messages(Size size, Map<String, dynamic> map, BuildContext context,
      String username) {
    return map['type'] == "text"
        ? Container(
            width: size.width,
            alignment: map['sendby'] == username
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: map['sendby'] == username
                ? Container(
                    // padding: EdgeInsets.only(
                    //     left: 28, right: 28),
                    child: Row(
                      children: [
                        Text(
                          map['lasttime'],
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.red,
                              fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        Container(
                          constraints: BoxConstraints(maxWidth: 264),
                          padding: EdgeInsets.only(
                              top: 16, left: 24, bottom: 16, right: 24),
                          // height: 73,
                          // width: 236 - 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.0),
                                topRight: Radius.circular(24.0),
                                bottomLeft: Radius.circular(24.0)),
                            color: Colors.grey,
                          ),
                          child: Text(
                            map['message'],
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    // padding: EdgeInsets.only(
                    //     left: 28, right: 28),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          width: 32,
                          height: 32,
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  // '${projects[index]!["background"]}'),
                                  widget.contactphotoURl,
                                ),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          constraints: BoxConstraints(maxWidth: 254),
                          padding: EdgeInsets.only(
                              top: 16, left: 24, bottom: 16, right: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24.0),
                                topRight: Radius.circular(24.0),
                                bottomRight: Radius.circular(24.0)),
                            color: Colors.pink,
                          ),
                          child: Text(
                            map['message'],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Spacer(),
                        Text(
                          map['lasttime'],
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ))
        : Container(
            height: 224,
            width: 138,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            alignment: map['sendby'] == username
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ShowImage(
                    username: widget.contactname,
                    map: map,
                    userUrl: widget.contactphotoURl,
                  ),
                ),
              ),
              child: map['sendby'] != username
                  ? Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: new BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  widget.contactphotoURl,
                                ),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          height: size.height / 4.5,
                          width: size.width / 2.5,
                          decoration: BoxDecoration(border: Border.all()),
                          alignment:
                              map['message'] != "" ? null : Alignment.center,
                          child: map['message'] != ""
                              ? Image.network(
                                  map['message'],
                                  fit: BoxFit.cover,
                                )
                              : CircularProgressIndicator(),
                        ),
                        Spacer(),
                        Text(
                          map['lasttime'],
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.pink,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Text(
                          map['lasttime'],
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: size.height / 4.5,
                          width: size.width / 2.5,
                          decoration: BoxDecoration(border: Border.all()),
                          alignment:
                              map['message'] != "" ? null : Alignment.center,
                          child: map['message'] != ""
                              ? Image.network(
                                  map['message'],
                                  fit: BoxFit.cover,
                                )
                              : CircularProgressIndicator(),
                        ),
                      ],
                    ),
            ),
          );
  }
}

class ShowImage extends StatelessWidget {
  final String username;
  final String userUrl;
  final Map<String, dynamic> map;
  const ShowImage(
      {Key? key,
      required this.username,
      required this.userUrl,
      required this.map})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Row(
      children: [
        Container(
          height: size.height,
          width: size.width,
          color: Colors.transparent,
          child: Image.network(map['message']),
        ),
      ],
    ));
  }
}
