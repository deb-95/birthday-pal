part of 'birthday_form_cubit.dart';

@immutable
abstract class BirthdayFormState {
  final BirthdayFormAction action;
  final BirthdayVM birthday;

  BirthdayFormState({
    this.action,
    this.birthday,
  });
}

class BirthdayFormInitial extends BirthdayFormState {}

class BirthdayFormCreating extends BirthdayFormState {
  final BirthdayFormAction action = BirthdayFormAction.CREATE;
  final BirthdayVM birthday =
      BirthdayVM(name: "", birthday: null, color: Color(4280391411));
}

class BirthdayFormEditing extends BirthdayFormState {
  final BirthdayFormAction action;
  final BirthdayVM birthday;

  BirthdayFormEditing({
    this.action,
    this.birthday,
  });
}
