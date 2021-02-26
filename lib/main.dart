import 'dart:io';

import 'package:birthdaypal/app/birthday_pal.dart';
import 'package:birthdaypal/app/config/my_bloc_observer.dart';
import 'package:birthdaypal/app/routes/router.dart';
import 'package:birthdaypal/features/birthday/model/repository/hive_birthday.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  Hive
    ..init(appDocPath)
    ..registerAdapter(HiveBirthdayAdapter());
  runApp(BirthdayPal(
    appRouter: AppRouter(),
  ));
}
