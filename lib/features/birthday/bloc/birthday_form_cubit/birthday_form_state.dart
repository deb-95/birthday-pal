part of 'birthday_form_cubit.dart';

@immutable
abstract class BirthdayFormState {
  final BirthdayFormDataVM birthday;

  BirthdayFormState({
    required this.birthday,
  });
}

class BirthdayFormInitial extends BirthdayFormState {
  BirthdayFormInitial()
      : super(
          birthday: BirthdayFormDataVM(
            name: "",
            date: null,
            color: Color(4280391411),
          ),
        );
}

class BirthdayFormCreating extends BirthdayFormState {
  BirthdayFormCreating()
      : super(
          birthday: BirthdayFormDataVM(
            name: "",
            date: null,
            color: const Color(4280391411),
          ),
        );
}

class BirthdayFormEditing extends BirthdayFormState {
  final BirthdayFormDataVM birthday;

  BirthdayFormEditing({
    required this.birthday,
  }) : super(birthday: birthday);
}
