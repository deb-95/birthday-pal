part of 'birthday_cubit.dart';

@immutable
abstract class BirthdayFormState {
  final String name;
  final DateTime birthday;
  final Color color;

  BirthdayFormState({
    this.name,
    this.birthday,
    this.color,
  });
}

class BirthdayFormInitial extends BirthdayFormState {
  final String name = "";
  final DateTime birthday = null;
  final Color color = Colors.blue;
}

class BirthdayFormEditing extends BirthdayFormState {
  final String name;
  final DateTime birthday;
  final Color color;

  BirthdayFormEditing({
    this.name,
    this.birthday,
    this.color,
  });
}
