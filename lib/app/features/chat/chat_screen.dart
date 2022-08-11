import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_nija_application/app/change_notifies/user_provider.dart';
import 'package:food_nija_application/app/common_widgets/button_back.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';
import 'package:food_nija_application/app/core/utils/translations.dart';
import 'package:food_nija_application/app/core/values/app_colors.dart';
import 'package:food_nija_application/app/features/chat/Chat_Room.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    // CustomSize().init(context);
    Size size = MediaQuery.of(context).size;
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final FirebaseAuth _auth = FirebaseAuth.instance;

    String chatRoomId(String user1, String user2) {
      if (user1.compareTo(user2) == -1) {
        return "$user1$user2";
      } else {
        return "$user2$user1";
      }
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundLoginColor,
      body: Container(
        child: Stack(children: [
          Image.asset(
            'assets/images/bg_app_short.png',
            height: getHeight(200),
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(20),
              vertical: getHeight(40),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ButtonBack(),
                SizedBox(
                  height: getHeight(24),
                ),
                Text(
                  Translations.of(context).text('Chat'),
                  style: TextStyle(
                    fontSize: getFont(25),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: getHeight(14),
                ),
                SizedBox(
                  width: size.width,
                  height: 48,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .where('uid', isNotEqualTo: userProvider.getUser.uid)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, position) {
                          return Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                String roomId = '';
                                roomId = chatRoomId(
                                  userProvider.getUser.username,
                                  snapshot.data!.docs[position]
                                      .data()['username'],
                                );
                                if (roomId != '') {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ChatRoom(
                                        contactname: snapshot
                                            .data!.docs[position]
                                            .data()['username'],
                                        contactphotoURl: snapshot
                                            .data!.docs[position]
                                            .data()['photoUrl'],
                                        messagesId: roomId,
                                      ),
                                    ),
                                  );
                                }

                                print("$roomId");
                              },
                              child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(milliseconds: 10),
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(48),
                                ),
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  width: 80,
                                  height: 80,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(48),
                                      child: Image.network(
                                        snapshot.data!.docs[position]
                                            .data()['photoUrl'],
                                        width: 48,
                                        height: 48,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, position) => const SizedBox(
                          height: 10,
                        ),
                        itemCount: snapshot.data!.docs.length,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: getHeight(12),
                ),
                Container(
                  width: size.width,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('messages')
                        .where("Members",
                            arrayContains: userProvider.getUser.username)
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, position) {
                          return Container(
                            padding: EdgeInsets.only(left: 4, right: 4),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                String roomId = snapshot.data!.docs[position]
                                    .data()['RoomId'];
                                String contactname = snapshot
                                            .data!.docs[position]
                                            .data()['user1'] ==
                                        userProvider.getUser.username
                                    ? snapshot.data!.docs[position]
                                        .data()['user2']
                                    : snapshot.data!.docs[position]
                                        .data()['user1'];
                                String contactphotoURl = snapshot
                                            .data!.docs[position]
                                            .data()['photoUrl1'] ==
                                        userProvider.getUser.photoUrl
                                    ? snapshot.data!.docs[position]
                                        .data()['photoUrl2']
                                    : snapshot.data!.docs[position]
                                        .data()['photoUrl1'];
                                if (roomId != '') {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => ChatRoom(
                                        contactname: contactname,
                                        contactphotoURl: contactphotoURl,
                                        messagesId: roomId,
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 81,
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Container(
                                  width: size.width,
                                  height: 81,
                                  // ignore: sort_child_properties_last
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 10,
                                              left: 9,
                                              right: 18,
                                            ),
                                            child: Container(
                                              width: 62,
                                              height: 62,
                                              // ignore: sort_child_properties_last
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: Image.network(
                                                  snapshot.data!.docs[position]
                                                                  .data()[
                                                              'photoUrl1'] ==
                                                          userProvider
                                                              .getUser.photoUrl
                                                      ? snapshot
                                                          .data!.docs[position]
                                                          .data()['photoUrl2']
                                                      : snapshot
                                                          .data!.docs[position]
                                                          .data()['photoUrl1'],
                                                  fit: BoxFit.cover,
                                                  width: 32,
                                                  height: 32,
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    snapshot.data!.docs[position]
                                                                    .data()[
                                                                'user1'] ==
                                                            userProvider.getUser
                                                                .username
                                                        ? snapshot.data!
                                                            .docs[position]
                                                            .data()['user2']
                                                        : snapshot.data!
                                                            .docs[position]
                                                            .data()['user1'],
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.textColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                snapshot.data!.docs[position]
                                                    .data()['message'],
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data!.docs[position]
                                                      .data()['lasttime'],
                                                  style: TextStyle(
                                                    color: AppColors.textColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, position) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: snapshot.data!.docs.length,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
