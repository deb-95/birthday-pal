part of 'birthday_form_cubit.dart';

@immutable
abstract class BirthdayFormState {
  final BirthdayFormAction action;
  final BirthdayFormDataVM birthday;

  BirthdayFormState({
    required this.action,
    required this.birthday,
  });
}

class BirthdayFormInitial extends BirthdayFormState {
  BirthdayFormInitial()
      : super(
          action: BirthdayFormAction.INIT,
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
          action: BirthdayFormAction.CREATE,
          birthday: BirthdayFormDataVM(
            name: "",
            date: null,
            color: Color(4280391411),
          ),
        );
}

class BirthdayFormEditing extends BirthdayFormState {
  final BirthdayFormAction action;
  final BirthdayFormDataVM birthday;

  BirthdayFormEditing({
    required this.action,
    required this.birthday,
  }) : super(action: action, birthday: birthday);
}
