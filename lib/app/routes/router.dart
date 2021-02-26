import 'package:birthdaypal/features/birthday/presentation/screens/birthday_homepage.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BirthdayHomepage.route:
        return MaterialPageRoute(
            // builder: (context) => BlocProvider<BirthdayFormCubit>(
            //   create: (_) => BirthdayFormCubit(),
            //   child: BirthdayHomepage(),
            // ),
            builder: (context) => BirthdayHomepage());
    }
    return null;
  }
}
