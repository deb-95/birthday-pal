part of 'birthday_form_cubit.dart';

@immutable
abstract class BirthdayFormState {
  final BirthdayFormAction? action;
  final BirthdayVM? birthday;

  BirthdayFormState({
    required this.action,
    required this.birthday,
  });
}

class BirthdayFormInitial extends BirthdayFormState {
  BirthdayFormInitial() : super(action: null, birthday: null);
}

class BirthdayFormCreating extends BirthdayFormState {
  BirthdayFormCreating()
      : super(
          action: BirthdayFormAction.CREATE,
          birthday: BirthdayVM(
            name: "",
            date: null,
            color: Color(4280391411),
          ),
        );
}

class BirthdayFormEditing extends BirthdayFormState {
  final BirthdayFormAction action;
  final BirthdayVM birthday;

  BirthdayFormEditing({
    required this.action,
    required this.birthday,
  }) : super(action: action, birthday: birthday);
}
