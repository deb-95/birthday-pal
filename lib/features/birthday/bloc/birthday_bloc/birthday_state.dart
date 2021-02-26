part of 'birthday_bloc.dart';

@immutable
abstract class BirthdayState {}

class BirthdayInitial extends BirthdayState {}

class BirthdayReady extends BirthdayState {}

abstract class BirthdayRead extends BirthdayState {}

class BirthdayReadLoaded extends BirthdayRead {
  final List<BirthdayVM> birthday;

  BirthdayReadLoaded(this.birthday);
}

class BirthdayReadLoading extends BirthdayRead {}

class BirthdayReadError extends BirthdayRead {
  final String reason;

  BirthdayReadError(this.reason);
}

abstract class BirthdayCreating extends BirthdayState {}

class BirthdayCreatingLoading extends BirthdayCreating {}

class BirthdayCreatingError extends BirthdayCreating {
  final String reason;

  BirthdayCreatingError(this.reason);
}

abstract class BirthdayEditing extends BirthdayState {}

class BirthdayEditingLoading extends BirthdayEditing {}

class BirthdayEditingError extends BirthdayEditing {
  final String reason;

  BirthdayEditingError(this.reason);
}

abstract class BirthdayDeleting extends BirthdayState {}

class BirthdayDeletingLoading extends BirthdayDeleting {}

class BirthdayDeletingError extends BirthdayDeleting {
  final String reason;

  BirthdayDeletingError(this.reason);
}
