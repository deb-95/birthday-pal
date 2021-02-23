import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BirthdayForm extends StatefulWidget {
  @override
  _BirthdayFormState createState() => _BirthdayFormState();
}

class _BirthdayFormState extends State<BirthdayForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              labelText: tr('name'),
            ),
            validator: (String value) {
              return value.isNotEmpty ? null : tr('emptyFieldError');
            },
          ),
          TextFormField(
            controller: _dateController,
            decoration: InputDecoration(
              icon: Icon(Icons.calendar_today),
              labelText: tr('date'),
            ),
            onTap: () async {
              FocusScope.of(context).requestFocus(new FocusNode());
              DateTime date = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate:
                    DateTime.tryParse(_dateController.text) ?? DateTime.now(),
                lastDate: DateTime.now(),
              );
              _dateController.text =
                  DateFormat.yMMMd(context.locale.languageCode).format(date);
            },
            validator: (String value) {
              return value.isNotEmpty ? null : tr('emptyFieldError');
            },
          ),
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
