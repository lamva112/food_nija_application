import 'package:flutter/material.dart';
typedef RatingCallback = Function(double rating);

class RatingBar extends StatefulWidget {

  const RatingBar.readOnly({
    Key? key,
    this.maxRating = 5,
    required this.filledIcon,
    required this.emptyIcon,
    required this.halfFilledIcon,
    this.isHalfAllowed = false,
    this.initialRating = 0.0,
    this.filledColor,
    this.emptyColor,
    this.halfFilledColor,
    this.size = 40,
  })  : _readOnly = true, onRatingChanged = null, super(key: key);

  final int maxRating;
  final IconData filledIcon;
  final IconData emptyIcon;
  final IconData halfFilledIcon;
  final double initialRating;
  final Color? filledColor;
  final Color? emptyColor;
  final Color? halfFilledColor;
  final double size;
  final bool isHalfAllowed;
  final bool _readOnly;
  final RatingCallback? onRatingChanged;

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  late double _currentRating;

  @override
  void initState() {
    super.initState();
    if (widget.isHalfAllowed) {
      _currentRating = widget.initialRating;
    } else {
      _currentRating = widget.initialRating.roundToDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.maxRating, (index) {
          return Builder(
            builder: (rowContext) => buildIcon(context, index + 1)
          );
        }),
      ),
    );
  }

  Widget buildIcon(BuildContext context, int position) {
    IconData iconData;
    Color color;
    double rating;
    if (widget._readOnly) {
      if (widget.isHalfAllowed) {
        rating = widget.initialRating;
      } else {
        rating = widget.initialRating.roundToDouble();
      }
    } else {
      rating = _currentRating;
    }
    if (position > rating + 0.5) {
      iconData = widget.emptyIcon;
      color = widget.emptyColor ?? Colors.grey;
    } else if (position == rating + 0.5) {
      iconData = widget.halfFilledIcon;
      color = widget.halfFilledColor ??
          widget.filledColor ??
          Theme.of(context).primaryColor;
    } else {
      iconData = widget.filledIcon;
      color = widget.filledColor ?? Theme.of(context).primaryColor;
    }
    return Icon(iconData, color: color, size: widget.size);
  }
}
