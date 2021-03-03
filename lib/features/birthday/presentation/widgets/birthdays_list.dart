import 'package:birthdaypal/features/birthday/model/presentation/birthday_vm.dart';
import 'package:flutter/material.dart';

import 'birthday_card.dart';

class BirthdaysList extends StatelessWidget {
  const BirthdaysList({
    Key key,
    this.birthdays,
  }) : super(key: key);

  final List<BirthdayVM> birthdays;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width < 800 ? 1 : 2,
          childAspectRatio: 3,
        ),
        itemBuilder: (ctx, index) {
          return BirthdayCard(
            birthday: birthdays[index],
          );
        },
        itemCount: birthdays.length,
      ),
    );
  }
}
