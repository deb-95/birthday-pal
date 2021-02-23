import 'package:birthdaypal/features/birthday/presentation/widgets/birthday_form.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {
            Scaffold.of(context).showBottomSheet(
              (context) => FractionallySizedBox(
                heightFactor: 0.5,
                child: BirthdayForm(),
              ),
            );
          },
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
