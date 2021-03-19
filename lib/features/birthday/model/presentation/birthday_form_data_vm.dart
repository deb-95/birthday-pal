import 'dart:ui';

import 'package:birthdaypal/app/config/enums.dart';
import 'package:birthdaypal/features/birthday/model/presentation/birthday_vm.dart';

class BirthdayFormDataVM {
  final String name;
  final DateTime? date;
  final Color color;
  final int? id;

  const BirthdayFormDataVM({
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

  factory BirthdayFormDataVM.defaultBD() {
    return const BirthdayFormDataVM(
      name: "",
      date: null,
      color: Color(4280391411),
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

  BirthdayFormAction get action {
    return id == null ? BirthdayFormAction.CREATE : BirthdayFormAction.EDIT;
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
