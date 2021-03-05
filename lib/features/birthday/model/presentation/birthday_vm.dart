import 'dart:ui';

import 'package:birthdaypal/features/birthday/model/repository/hive_birthday.dart';

class BirthdayVM {
  final int? id;
  final String name;
  final DateTime date;
  final Color color;

  int get years {
    return DateTime.now().year - date.year;
  }

  BirthdayVM({
    this.id,
    required this.name,
    required this.date,
    required this.color,
  });

  factory BirthdayVM.fromHive(int id, HiveBirthday bd) {
    return BirthdayVM(
        id: id, name: bd.name, date: bd.date, color: Color(bd.color));
  }

  BirthdayVM copyWith({
    int? id,
    String? name,
    DateTime? date,
    Color? color,
  }) {
    return BirthdayVM(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return 'BirthdayVM(id: $id, name: $name, date: $date, color: $color)';
  }
}
