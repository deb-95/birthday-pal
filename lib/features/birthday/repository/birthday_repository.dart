import 'package:birthdaypal/features/birthday/model/repository/hive_birthday.dart';
import 'package:birthdaypal/features/birthday/repository/repository.dart';
import 'package:hive/hive.dart';

class BirthdayRepository extends Repository<HiveBirthday> {
  Box<HiveBirthday> _box;

  Future<void> init() async {
    _box = await Hive.openBox<HiveBirthday>('birthdays');
  }

  Future<void> close() async {
    _box.compact();
    _box.close();
  }

  @override
  Future<int> create(HiveBirthday el) async {
    return await _box.add(el);
  }

  @override
  Future<void> delete(int id) async {
    return await _box.deleteAt(id);
  }

  @override
  Future<void> edit(HiveBirthday el, int id) async {
    print('EDIT===============$id');
    return await _box.putAt(id, el);
  }

  @override
  List<HiveBirthday> getAll() {
    return _box.values.toList();
  }
}
