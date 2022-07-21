import 'package:flutter/material.dart';

class LoginItem extends StatelessWidget {
  final String image;
  final String title;
  final double width;
  final double height;
  final Color? color;
  final double? iconRadius;
  const LoginItem({
    Key? key,
    required this.title,
    required this.image,
    required this.width,
    required this.height,
    this.color,
    this.iconRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: iconRadius,
          ),
          SizedBox(width: width / 15),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
