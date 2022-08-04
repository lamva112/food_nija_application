import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';

class FilterChipCustom extends StatefulWidget {
  final String title;
  final Color textColor;
  final Color bgColor;

  const FilterChipCustom({Key? key, required this.title, required this.bgColor, required this.textColor})
      : super(key: key);

  @override
  State<FilterChipCustom> createState() => _FilterChipCustomState();
}

class _FilterChipCustomState extends State<FilterChipCustom> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        widget.title,
        style: TextStyle(color: widget.textColor),
      ),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      backgroundColor: widget.bgColor,
      selected: _isSelected,
      padding: EdgeInsets.all(getWidth(13)),
    );
  }
}
