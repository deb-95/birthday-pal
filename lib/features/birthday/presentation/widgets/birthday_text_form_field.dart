import 'package:flutter/material.dart';

class BirthdayTextFormField extends StatelessWidget {
  final Icon icon;
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function(String)? onChange;

  const BirthdayTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.validator,
    required this.icon,
    this.onTap,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          icon: icon,
          labelText: labelText,
        ),
        validator: validator,
        onTap: onTap,
        onChanged: onChange,
      ),
    );
  }
}
