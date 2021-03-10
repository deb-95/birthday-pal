import 'dart:ui';

import 'package:birthdaypal/features/birthday/model/presentation/birthday_form_data_vm.dart';
import 'package:birthdaypal/features/birthday/model/presentation/birthday_vm.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'birthday_form_state.dart';

class BirthdayFormCubit extends Cubit<BirthdayFormState> {
  BirthdayFormCubit() : super(BirthdayFormInitial());

  void reset() {
    emit(BirthdayFormInitial());
  }

  void create() {
    emit(BirthdayFormCreating());
  }

  void edit(BirthdayVM birthday) {
    emit(BirthdayFormEditing(
      birthday: BirthdayFormDataVM.fromBirthdayVM(birthday),
    ));
  }

  void setName(String name) {
    emit(BirthdayFormEditing(
      birthday: this.state.birthday.copyWith(name: name),
    ));
  }

  void setBirthday(DateTime date) {
    emit(BirthdayFormEditing(
        birthday: this.state.birthday.copyWith(date: date)));
  }

  void setColor(Color color) {
    emit(BirthdayFormEditing(
        birthday: this.state.birthday.copyWith(color: color)));
  }
}
