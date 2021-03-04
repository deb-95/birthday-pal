part of 'birthday_bloc.dart';

@immutable
abstract class BirthdayEvent {}

class BirthdayInit extends BirthdayEvent {}

class BirthdayFetch extends BirthdayEvent {}

// Edit -> EditState
class BirthdayEdit extends BirthdayEvent {
  final BirthdayVM birthday;

  BirthdayEdit(this.birthday);
}

// Delete -> DeleteState
class BirthdayDelete extends BirthdayEvent {
  final int? id;

  BirthdayDelete(this.id);
}

// Create -> CreateState
class BirthdayCreate extends BirthdayEvent {
  final BirthdayVM birthday;

  BirthdayCreate(this.birthday);
}
