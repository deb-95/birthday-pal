import 'dart:ui';

import 'package:birthdaypal/features/birthday/model/repository/hive_birthday.dart';

class BirthdayVM {
  final String name;
  final DateTime birthday;
  final Color color;

  BirthdayVM({this.name, this.birthday, this.color});

  factory BirthdayVM.fromHive(HiveBirthday bd) {
    return BirthdayVM(name: bd.name, birthday: bd.birthday, color: bd.color);
  }
}
