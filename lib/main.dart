import 'dart:io';

import 'package:birthdaypal/app/birthday_pal.dart';
import 'package:birthdaypal/app/routes/router.dart';
import 'package:birthdaypal/features/birthday/model/repository/hive_birthday.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() async {
  var path = Directory.current.path;
  Hive
    ..init(path)
    ..registerAdapter(HiveBirthdayAdapter());
  runApp(BirthdayPal(
    appRouter: AppRouter(),
  ));
}
