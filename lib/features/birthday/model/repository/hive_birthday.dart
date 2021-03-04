import 'package:birthdaypal/features/birthday/model/presentation/birthday_vm.dart';
import 'package:hive/hive.dart';

part 'hive_birthday.g.dart';

@HiveType(typeId: 1)
class HiveBirthday {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  final int color;

  HiveBirthday(
      {required this.name, required this.date, required this.color});

  factory HiveBirthday.fromVM(BirthdayVM bd) {
    return HiveBirthday(name: bd.name, date: bd.date!, color: bd.color.value);
  }

  @override
  String toString() =>
      'HiveBirthday(name: $name, birthday: $date, color: $color)';
}
