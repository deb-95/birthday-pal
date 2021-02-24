import 'package:flutter/material.dart';

const kBorder = Border.symmetric(
  vertical: BorderSide(
    color: Colors.black,
    width: 1,
    style: BorderStyle.solid,
  ),
  horizontal: BorderSide(
    color: Colors.black,
    width: 1,
    style: BorderStyle.solid,
  ),
);

class BirthdayColorFormField extends StatelessWidget {
  final bool isSelected;
  final Color color;
  final void Function() onTap;

  const BirthdayColorFormField(
      {Key key, this.isSelected, this.color, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: isSelected ? 30 : 20,
          width: isSelected ? 30 : 20,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: isSelected ? 3.0 : 4.0,
                    spreadRadius: isSelected ? 1.0 : 0.2)
              ]),
        ),
      ),
    );
  }
}
