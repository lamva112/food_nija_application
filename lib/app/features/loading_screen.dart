import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingManager extends StatefulWidget {
  const LoadingManager({Key? key, required this.isLoading, required this.child})
      : super(key: key);
  final bool isLoading;
  final Widget child;

  @override
  State<LoadingManager> createState() => _LoadingManagerState();
}

class _LoadingManagerState extends State<LoadingManager> {
  late Animation<double> containerSize;
  late AnimationController animationController;
  late Duration animationDuration = const Duration(milliseconds: 270);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        widget.isLoading
            ? Container(
                color: Colors.black.withOpacity(0.5),
              )
            : Container(),
        widget.isLoading
            ? const Center(
                child: SpinKitFadingCube(
                  color: Colors.greenAccent,
                  size: 50.0,
                ),
              )
            : Container(),
      ],
    );
  }
}
