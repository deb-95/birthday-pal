import 'dart:ui';

import 'package:birthdaypal/features/birthday/model/presentation/birthday_form_data_vm.dart';
import 'package:birthdaypal/features/birthday/model/presentation/birthday_vm.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'birthday_form_state.dart';

class BirthdayFormCubit extends Cubit<BirthdayFormState> {
  BirthdayFormCubit()
      : super(BirthdayFormState(
          birthday: BirthdayFormDataVM.defaultBD(),
        ));

  void reset() {
    emit(BirthdayFormState(birthday: BirthdayFormDataVM.defaultBD()));
  }

  void create() {
    emit(BirthdayFormState(birthday: BirthdayFormDataVM.defaultBD()));
  }

  void edit(BirthdayVM birthday) {
    emit(BirthdayFormState(
      birthday: BirthdayFormDataVM.fromBirthdayVM(birthday),
    ));
  }

  void setName(String name) {
    emit(BirthdayFormState(
      birthday: this.state.birthday.copyWith(name: name),
    ));
  }

  void setBirthday(DateTime date) {
    emit(BirthdayFormState(birthday: this.state.birthday.copyWith(date: date)));
  }

  void setColor(Color color) {
    emit(BirthdayFormState(
        birthday: this.state.birthday.copyWith(color: color)));
  }
}
