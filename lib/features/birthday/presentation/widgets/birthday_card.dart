import 'package:birthdaypal/features/birthday/bloc/birthday_bloc/birthday_bloc.dart';
import 'package:birthdaypal/features/birthday/bloc/birthday_form_cubit/birthday_form_cubit.dart';
import 'package:birthdaypal/features/birthday/model/presentation/birthday_vm.dart';
import 'package:birthdaypal/features/birthday/presentation/widgets/form_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BirthdayCard extends StatelessWidget {
  const BirthdayCard({
    Key? key,
    required this.birthday,
  }) : super(key: key);

  final BirthdayVM birthday;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(birthday.toString()),
      onDismissed: (_) {
        BlocProvider.of<BirthdayBloc>(context)
            .add(BirthdayDelete(birthday.id!));
      },
      child: Card(
        elevation: 10,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            ColoredSideBand(color: birthday.color),
            BirthdayInfos(birthday: birthday),
            ActionButtons(birthday: birthday)
          ],
        ),
      ),
    );
  }
}

class ColoredSideBand extends StatelessWidget {
  const ColoredSideBand({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 10,
        ),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}

class BirthdayInfos extends StatelessWidget {
  const BirthdayInfos({
    Key? key,
    required this.birthday,
  }) : super(key: key);

  final BirthdayVM birthday;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('${birthday.name}'),
            Text(
                '${DateFormat.MMMEd(context.locale.languageCode).format(birthday.date)}'),
            Text('${birthday.years} ${tr("years")}')
          ],
        ),
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    Key? key,
    required this.birthday,
  }) : super(key: key);

  final BirthdayVM birthday;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<BirthdayFormCubit>(context).edit(birthday);
              showModalBottomSheet<void>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: const Radius.circular(25.0),
                  ),
                ),
                isScrollControlled: true,
                builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<BirthdayFormCubit>(context),
                  child: FormBottomSheet(),
                ),
              );
            },
            child: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
