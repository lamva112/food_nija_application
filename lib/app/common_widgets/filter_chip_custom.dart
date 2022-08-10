import 'package:flutter/material.dart';
import 'package:food_nija_application/app/core/utils/size_config.dart';

class FilterChipCustom extends StatefulWidget {
  final String title;
  final Color textColor;
  final Color bgColor;
  final Icon? icon;
  final bool isChecked;
  final Function(bool, String) onSelected;

  const FilterChipCustom({
    Key? key,
    required this.title,
    required this.bgColor,
    required this.textColor,
    required this.onSelected,
    this.icon,
    this.isChecked = false,
  }) : super(key: key);

  @override
  State<FilterChipCustom> createState() => _FilterChipCustomState();
}

class _FilterChipCustomState extends State<FilterChipCustom> {
  late bool _isSelected = widget.isChecked;

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
          widget.onSelected(_isSelected, widget.title);
        });
      },
      backgroundColor: widget.bgColor,
      selected: _isSelected,
      labelPadding: EdgeInsets.symmetric(vertical: getHeight(5), horizontal: getWidth(5)),
      avatar: widget.icon,
    );
  }
}
