import 'package:birthdaypal/features/birthday/model/presentation/birthday_vm.dart';
import 'package:hive/hive.dart';

part 'hive_birthday.g.dart';

@HiveType(typeId: 1)
class HiveBirthday {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final DateTime birthday;

  @HiveField(2)
  final int color;

  HiveBirthday({this.name, this.birthday, this.color});

  factory HiveBirthday.fromVM(BirthdayVM bd) {
    return HiveBirthday(
        name: bd.name, birthday: bd.birthday, color: bd.color.value);
  }

  @override
  String toString() =>
      'HiveBirthday(name: $name, birthday: $birthday, color: $color)';
}
