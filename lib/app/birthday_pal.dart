import 'package:birthdaypal/app/routes/router.dart';
import 'package:birthdaypal/features/birthday/bloc/birthday_bloc/birthday_bloc.dart';
import 'package:birthdaypal/features/birthday/bloc/birthday_form_cubit/birthday_form_cubit.dart';
import 'package:birthdaypal/features/birthday/repository/birthday_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BirthdayPal extends StatelessWidget {
  final AppRouter appRouter;

  const BirthdayPal({Key key, this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: [Locale('en'), Locale('it')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: Builder(
        builder: (localizationContext) => MultiBlocProvider(
          providers: [
            BlocProvider<BirthdayBloc>(create: (_) => BirthdayBloc(BirthdayRepository())),
            BlocProvider<BirthdayFormCubit>(
              create: (_) => BirthdayFormCubit(),
            ),
          ],
          child: MaterialApp(
            localizationsDelegates: localizationContext.localizationDelegates,
            supportedLocales: localizationContext.supportedLocales,
            locale: localizationContext.locale,
            title: 'BirthdayPal',
            onGenerateRoute: appRouter.onGenerateRoute,
          ),
        ),
      ),
    );
  }
}
