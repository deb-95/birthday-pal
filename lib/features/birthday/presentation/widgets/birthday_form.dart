import 'package:birthdaypal/features/birthday/presentation/widgets/birthday_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

const kFormSizedBox = SizedBox(
  width: 50,
  height: 20,
);

class BirthdayForm extends StatefulWidget {
  @override
  _BirthdayFormState createState() => _BirthdayFormState();
}

class _BirthdayFormState extends State<BirthdayForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: FormBody(
        direction: MediaQuery.of(context).orientation == Orientation.portrait
            ? Axis.vertical
            : Axis.horizontal,
      ),
    );
  }
}

class FormBody extends StatefulWidget {
  final Axis direction;

  FormBody({Key key, @required this.direction}) : super(key: key);

  @override
  _FormBodyState createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void handleDatePicker() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDate: DateTime.tryParse(_dateController.text) ?? DateTime.now(),
      lastDate: DateTime.now(),
    );
    _dateController.text =
        DateFormat.yMMMd(context.locale.languageCode).format(date);
  }

  String stringValidator(String value) {
    return value.isNotEmpty ? null : tr('emptyFieldError');
  }

  @override
  void dispose() {
    _dateController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Flex(
        direction: widget.direction,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BirthdayTextFormField(
            controller: _nameController,
            icon: Icon(Icons.person),
            labelText: tr('name'),
            validator: stringValidator,
            onTap: () {},
          ),
          kFormSizedBox,
          BirthdayTextFormField(
            controller: _dateController,
            icon: Icon(Icons.calendar_today),
            labelText: tr('date'),
            validator: stringValidator,
            onTap: () => handleDatePicker(),
          ),
          kFormSizedBox,
          ElevatedButton(
            onPressed: () {
              if (Form.of(context).validate()) {
                // TODO: Save data
                Navigator.of(context).pop();
              }
            },
            child: Text(tr('submit')),
          )
        ],
      ),
    );
  }
}
