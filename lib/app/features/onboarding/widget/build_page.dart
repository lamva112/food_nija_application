import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';

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
        SizedBox(height: getHeight(40)),
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
            height: getHeight(400),
            width: MediaQuery.of(context).size.width,
          ),
        ),
        SizedBox(height: getHeight(40)),
        AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, _) {
            return Transform.translate(
              offset: Offset(animationController.value * 500, 0),
              child: _,
            );
          },
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: getFont(25),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: getHeight(28)),
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
            style: TextStyle(
              fontSize: getFont(18),
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
