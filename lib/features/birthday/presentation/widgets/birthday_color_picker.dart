import 'package:birthdaypal/features/birthday/bloc/birthday_form_cubit/birthday_form_cubit.dart';
import 'package:birthdaypal/features/birthday/presentation/widgets/birthday_color_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const List<Color> kColors = [
  Color(4280391411),
  Color(4294961979),
  Color(4283215696),
  Color(4294198070),
  Color(4294940672)
];

class BirthdayColorPicker extends StatelessWidget {
  const BirthdayColorPicker({
    Key? key,
    required Color selectedColor,
  })   : _selectedColor = selectedColor,
        super(key: key);

  final Color _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: kColors
          .map((color) => BirthdayColorFormField(
                color: color,
                isSelected: _selectedColor == color,
                onTap: () {
                  BlocProvider.of<BirthdayFormCubit>(context).setColor(color);
                },
              ))
          .toList(),
    );
  }
}
