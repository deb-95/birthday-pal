import 'dart:ui';

import 'package:birthdaypal/features/birthday/model/presentation/birthday_vm.dart';

class BirthdayFormDataVM {
  final String name;
  final DateTime? date;
  final Color color;
  final int? id;

  BirthdayFormDataVM({
    required this.name,
    this.date,
    this.id,
    required this.color,
  });

  factory BirthdayFormDataVM.fromBirthdayVM(BirthdayVM birthdayVM) {
    return BirthdayFormDataVM(
      color: birthdayVM.color,
      date: birthdayVM.date,
      name: birthdayVM.name,
      id: birthdayVM.id,
    );
  }

  BirthdayVM toBirthdayVM() {
    return BirthdayVM(
      color: this.color,
      date: this.date!,
      name: this.name,
      id: this.id,
    );
  }

  BirthdayFormDataVM copyWith({
    int? id,
    String? name,
    DateTime? date,
    Color? color,
  }) {
    return BirthdayFormDataVM(
      name: name ?? this.name,
      date: date ?? this.date,
      color: color ?? this.color,
      id: id ?? this.id,
    );
  }
}
