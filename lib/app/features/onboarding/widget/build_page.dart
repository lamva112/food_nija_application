import 'package:flutter/material.dart';

class BuildPage extends StatefulWidget {
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
  State<BuildPage> createState() => _BuildPageState();
}

class _BuildPageState extends State<BuildPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: -1,
      upperBound: 1,
    );
    animationController.animateTo(
      0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 1500),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, _) {
            return Transform.translate(
              offset: Offset(0, animationController.value * 200),
              child: _,
            );
          },
          child: Image.asset(
            widget.image,
            height: 400,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, _) {
            return Transform.translate(
              offset: Offset(animationController.value * 500 , 0),
              child: _,
            );
          },
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, _) {
            return Transform.translate(
              offset: Offset(animationController.value * -500, 0),
              child: _,
            );
          },
          child: Text(
            widget.description,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
