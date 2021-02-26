import 'dart:async';

import 'package:birthdaypal/features/birthday/model/presentation/birthday_vm.dart';
import 'package:birthdaypal/features/birthday/model/repository/hive_birthday.dart';
import 'package:birthdaypal/features/birthday/repository/birthday_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'birthday_event.dart';
part 'birthday_state.dart';

class BirthdayBloc extends Bloc<BirthdayEvent, BirthdayState> {
  BirthdayBloc(BirthdayRepository repository)
      : _repository = repository,
        super(BirthdayInitial());

  final BirthdayRepository _repository;

  @override
  Stream<BirthdayState> mapEventToState(
    BirthdayEvent event,
  ) async* {
    if (event is BirthdayInit) {
      await _repository.init();
      yield BirthdayReady();
    } else if (event is BirthdayFetch) {
      try {
        final birthdays = _getBirthdays();
        yield BirthdayReadLoaded(birthdays);
      } catch (e) {
        yield BirthdayReadError(e.toString());
      }
    } else if (event is BirthdayCreate) {
      yield BirthdayCreatingLoading();
      final index =
          await _repository.create(HiveBirthday.fromVM(event.birthday));
      if (index > 0) {
        yield BirthdayReadLoaded(_getBirthdays());
      } else {
        yield BirthdayCreatingError('Error adding ${event.birthday}');
      }
    } else if (event is BirthdayEdit) {
      final outcome = await _repository.edit(
          HiveBirthday.fromVM(event.birthday), event.birthday.id);
      // TODO: handle outcome
      yield (BirthdayReadLoaded(_getBirthdays()));
    } else if (event is BirthdayDelete) {
      final outcome = await _repository.delete(event.id);
      // TODO: handle outcome
      yield (BirthdayReadLoaded(_getBirthdays()));
    }
  }

  List<BirthdayVM> _getBirthdays() {
    final birthdays = _repository.getAll();
    return List<BirthdayVM>.generate(
      birthdays.length,
      (int i) => BirthdayVM.fromHive(i, birthdays[i]),
    );
  }

  @override
  Future<void> close() async {
    _repository.close();
    return super.close();
  }
}
