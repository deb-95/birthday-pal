import 'dart:ui';

import 'package:birthdaypal/features/birthday/model/presentation/birthday_vm.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'birthday_state.dart';

class BirthdayFormCubit extends Cubit<BirthdayFormState> {
  BirthdayFormCubit() : super(BirthdayFormInitial());

  void reset() {
    emit(BirthdayFormInitial());
  }

  void edit(BirthdayVM birthday) {
    emit(BirthdayFormEditing(
        name: birthday.name,
        birthday: birthday.birthday,
        color: birthday.color));
  }

  void setName(String name) {
    emit(BirthdayFormEditing(
        name: name, birthday: this.state.birthday, color: this.state.color));
  }

  void setBirthday(DateTime birthday) {
    emit(BirthdayFormEditing(
        name: this.state.name, birthday: birthday, color: this.state.color));
  }

  void setColor(Color color) {
    emit(BirthdayFormEditing(
        name: this.state.name, birthday: this.state.birthday, color: color));
  }
}
