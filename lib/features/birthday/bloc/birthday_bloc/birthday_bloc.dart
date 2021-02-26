import 'dart:async';

import 'package:birthdaypal/features/birthday/model/presentation/birthday_vm.dart';
import 'package:birthdaypal/features/birthday/model/repository/hive_birthday.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'birthday_event.dart';
part 'birthday_state.dart';

class BirthdayBloc extends Bloc<BirthdayEvent, BirthdayState> {
  BirthdayBloc() : super(BirthdayInitial());

  Box<HiveBirthday> _box;

  @override
  Stream<BirthdayState> mapEventToState(
    BirthdayEvent event,
  ) async* {
    if (event is BirthdayInit) {
      _box = await Hive.openBox<HiveBirthday>('birthdays');
      yield BirthdayReady();
    } else if (event is BirthdayFetch) {
      try {
        final birthdays = getBirthdays();
        yield BirthdayReadLoaded(birthdays);
      } catch (e) {
        yield BirthdayReadError(e.toString());
      }
    } else if (event is BirthdayCreate) {
      yield BirthdayCreatingLoading();

      final index = await _box.add(
        HiveBirthday(
            name: event.birthday.name,
            birthday: event.birthday.birthday,
            color: event.birthday.color.value),
      );
      if (index > 0) {
        yield BirthdayReadLoaded(getBirthdays());
      } else {
        yield BirthdayCreatingError('Error adding ${event.birthday}');
      }
    } else if (event is BirthdayEdit) {
      final outcome = await _box.putAt(
        event.birthday.id,
        HiveBirthday(
            name: event.birthday.name,
            birthday: event.birthday.birthday,
            color: event.birthday.color.value),
      );
      // TODO: handle outcome
      yield (BirthdayReadLoaded(getBirthdays()));
    } else if (event is BirthdayDelete) {
      final outcome = await _box.deleteAt(event.id);
      // TODO: handle outcome
      yield (BirthdayReadLoaded(getBirthdays()));
    }
  }

  List<BirthdayVM> getBirthdays() {
    return [
      for (final key in _box.keys) BirthdayVM.fromHive(key, _box.get(key))
    ];
  }

  @override
  Future<void> close() async {
    _box.compact();
    _box.close();
    return super.close();
  }
}
