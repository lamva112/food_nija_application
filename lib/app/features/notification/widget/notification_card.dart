import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';

enum NotificationType { SUCCESSFUL, CANCEL, TOPUP }

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);
  final NotificationType notificationType = NotificationType.TOPUP;

  String getNotificationIcon() {
    if (notificationType == NotificationType.SUCCESSFUL) {
      return 'assets/images/success.png';
    } else if (notificationType == NotificationType.TOPUP) {
      return 'assets/images/topup.png';
    } else {
      return 'assets/images/cancel.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: getHeight(5)),
          child: ListTile(
            leading: Image.asset(getNotificationIcon(),
                width: getWidth(50), height: getWidth(50), fit: BoxFit.cover),
            title: Text('Your order has been taken by the driver'),
            subtitle: Text('Recently'),
          ),
        ));
  }
}
