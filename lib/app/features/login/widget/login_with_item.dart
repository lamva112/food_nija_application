import 'package:flutter/material.dart';

class LoginItem extends StatelessWidget {
  final String image;
  final String title;
  final double width;
  final double height;
  final Color? color;
  const LoginItem({Key? key, required this.title, required this.image, required this.width, required this.height, this.color}) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(image),
          ),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
