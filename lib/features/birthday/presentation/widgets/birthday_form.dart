import 'package:birthdaypal/app/config/enums.dart';
import 'package:birthdaypal/features/birthday/bloc/birthday_bloc/birthday_bloc.dart';
import 'package:birthdaypal/features/birthday/bloc/birthday_form_cubit/birthday_form_cubit.dart';
import 'package:birthdaypal/features/birthday/presentation/widgets/birthday_color_picker.dart';
import 'package:birthdaypal/features/birthday/presentation/widgets/birthday_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  TextEditingController _dateController;
  TextEditingController _nameController;

  @override
  void didChangeDependencies() {
    final cubit = BlocProvider.of<BirthdayFormCubit>(context);
    _dateController ??=
        TextEditingController(text: formatDate(cubit.state.birthday.date));
    _nameController ??= TextEditingController(text: cubit.state.birthday.name);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  String formatDate(DateTime date) {
    return date != null
        ? DateFormat.yMMMd(context.locale.languageCode).format(date)
        : '';
  }

  void handleDatePicker() async {
    final cubit = BlocProvider.of<BirthdayFormCubit>(context);
    FocusScope.of(context).requestFocus(new FocusNode());
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDate: cubit.state.birthday.date ?? DateTime.now(),
      lastDate: DateTime.now(),
    );
    cubit.setBirthday(date);
  }

  String stringValidator(String value) {
    return value.isNotEmpty ? null : tr('emptyFieldError');
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BirthdayFormCubit, BirthdayFormState>(
      listener: (context, state) {
        _dateController.text = formatDate(state.birthday.date);
      },
      listenWhen: (prev, current) => current.birthday != null,
      child: Padding(
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
              onChange: (string) {
                BlocProvider.of<BirthdayFormCubit>(context).setName(string);
              },
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
            BlocBuilder<BirthdayFormCubit, BirthdayFormState>(
              buildWhen: (previous, current) => current.birthday != null,
              builder: (context, state) {
                return BirthdayColorPicker(selectedColor: state.birthday.color);
              },
            ),
            kFormSizedBox,
            ElevatedButton(
              onPressed: () {
                final cubit = BlocProvider.of<BirthdayFormCubit>(context);
                if (Form.of(context).validate()) {
                  // TODO: before popping check for errors in saving
                  final birthday = cubit.state.birthday;
                  if (cubit.state.action == BirthdayFormAction.CREATE) {
                    RepositoryProvider.of<BirthdayBloc>(context)
                        .add(BirthdayCreate(birthday));
                  } else if (cubit.state.action == BirthdayFormAction.EDIT) {
                    RepositoryProvider.of<BirthdayBloc>(context)
                        .add(BirthdayEdit(birthday));
                  }
                  Navigator.of(context).pop();
                  cubit.reset();
                }
              },
              child: Text(tr('submit')),
            )
          ],
        ),
      ),
    );
  }
}
