import 'package:birthdaypal/features/birthday/bloc/birthday_form_cubit/birthday_cubit.dart';
import 'package:birthdaypal/features/birthday/presentation/screens/birthday_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BirthdayHomepage.route:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<BirthdayFormCubit>(
            create: (_) => BirthdayFormCubit(),
            child: BirthdayHomepage(),
          ),
        );
    }
    return null;
  }
}
