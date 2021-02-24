import 'package:birthdaypal/app/routes/router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
        builder: (localizationContext) => MaterialApp(
          localizationsDelegates: localizationContext.localizationDelegates,
          supportedLocales: localizationContext.supportedLocales,
          locale: localizationContext.locale,
          title: 'BirthdayPal',
          onGenerateRoute: appRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
