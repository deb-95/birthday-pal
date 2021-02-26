import 'dart:ui';

import 'package:birthdaypal/features/birthday/model/repository/hive_birthday.dart';

class BirthdayVM {
  final int id;
  final String name;
  final DateTime birthday;
  final Color color;

  BirthdayVM({this.id, this.name, this.birthday, this.color});

  factory BirthdayVM.fromHive(int id, HiveBirthday bd) {
    return BirthdayVM(
        id: id, name: bd.name, birthday: bd.birthday, color: Color(bd.color));
  }
}
