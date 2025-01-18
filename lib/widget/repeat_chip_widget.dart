import 'package:flutter/material.dart';

class RepeatChipWidget extends StatelessWidget {
  const RepeatChipWidget(
      {super.key,
      required this.label,
      required this.isSelected,
      required this.onItemClicked});

  final String label;
  final bool isSelected;
  final Function(String selectedLabel) onItemClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        onItemClicked(label);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(color: Colors.black26, width: 1.0)),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
