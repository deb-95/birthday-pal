import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BirthdayPal extends StatelessWidget {
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
          home: Scaffold(
            appBar: AppBar(
              title: Text('Material App Bar'),
            ),
            body: Center(
              child: Container(
                child: Text('Hello World'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
