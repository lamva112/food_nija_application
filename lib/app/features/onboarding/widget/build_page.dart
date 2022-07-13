import 'package:flutter/material.dart';

class BuildPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const BuildPage(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40,),
        Image.asset(
          image,
          height: 400,
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(height: 40,),
        Text(
          title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30,),
        Text(
          description,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
