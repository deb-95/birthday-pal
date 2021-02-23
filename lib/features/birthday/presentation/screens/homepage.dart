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
            showModalBottomSheet<void>(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
              isScrollControlled: true,
              builder: (context) => SafeArea(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: BirthdayForm(),
                ),
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
