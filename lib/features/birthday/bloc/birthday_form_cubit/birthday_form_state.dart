part of 'birthday_form_cubit.dart';

@immutable
abstract class BirthdayFormState {
  final BirthdayFormAction action;
  final String name;
  final DateTime birthday;
  final Color color;

  BirthdayFormState({
    this.action,
    this.name,
    this.birthday,
    this.color,
  });
}

class BirthdayFormInitial extends BirthdayFormState {}

class BirthdayFormCreating extends BirthdayFormState {
  final BirthdayFormAction action = BirthdayFormAction.CREATE;
  final String name = "";
  final DateTime birthday = null;
  final Color color = Colors.blue;
}

class BirthdayFormEditing extends BirthdayFormState {
  final BirthdayFormAction action;
  final String name;
  final DateTime birthday;
  final Color color;

  BirthdayFormEditing({
    this.action,
    this.name,
    this.birthday,
    this.color,
  });
}
