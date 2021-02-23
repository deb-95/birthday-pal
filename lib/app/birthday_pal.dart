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
          home: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        title: Text('Birthday Pal'),
      ),
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
