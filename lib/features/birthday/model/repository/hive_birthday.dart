import 'dart:ui';

import 'package:hive/hive.dart';

part 'hive_birthday.g.dart';

@HiveType(typeId: 1)
class HiveBirthday {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final DateTime birthday;

  @HiveField(2)
  final Color color;

  HiveBirthday({this.name, this.birthday, this.color});
}
