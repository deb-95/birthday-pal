import 'package:birthdaypal/features/birthday/presentation/widgets/birthday_form.dart';
import 'package:flutter/material.dart';

class FormBottomSheet extends StatelessWidget {
  const FormBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BirthdayForm(),
      ),
    );
  }
}
