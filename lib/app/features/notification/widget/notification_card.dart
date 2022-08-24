import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';

// enum NotificationType { SUCCESSFUL, CANCEL, TOPUP }

class NotificationCard extends StatefulWidget {
  final snap;
  const NotificationCard({Key? key, required this.snap}) : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  // final NotificationType notificationType = NotificationType.TOPUP;

  // String getNotificationIcon() {
  //   if (notificationType == NotificationType.SUCCESSFUL) {
  //     return 'assets/images/success.png';
  //   } else if (notificationType == NotificationType.TOPUP) {
  //     return 'assets/images/topup.png';
  //   } else {
  //     return 'assets/images/cancel.png';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: getHeight(5)),
          child: ListTile(
            leading: Image.network(widget.snap["profilePic"],
                width: getWidth(50), height: getWidth(50), fit: BoxFit.cover),
            title: Text(widget.snap["title"]),
            subtitle: Row(
              children: [
                Text(widget.snap["date"]),
                Spacer(),
                Text(widget.snap["lasttime"]),
              ],
            ),
          ),
        ));
  }
}
