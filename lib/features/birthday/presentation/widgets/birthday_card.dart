import 'package:birthdaypal/features/birthday/bloc/birthday_bloc/birthday_bloc.dart';
import 'package:birthdaypal/features/birthday/bloc/birthday_form_cubit/birthday_form_cubit.dart';
import 'package:birthdaypal/features/birthday/model/presentation/birthday_vm.dart';
import 'package:birthdaypal/features/birthday/presentation/screens/birthday_homepage.dart';
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
    return Card(
      elevation: 10,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 10,
                    ),
                    child: Container(
                      color: birthday.color,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('${birthday.name}'),
                        Text('${birthday.date.toString()}'),
                        Text('${DateTime.now().year - birthday.date!.year}')
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<BirthdayBloc>(context)
                              .add(BirthdayDelete(birthday.id!));
                        },
                        child: Icon(Icons.delete),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<BirthdayFormCubit>(context)
                              .edit(birthday);
                          showModalBottomSheet<void>(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0),
                              ),
                            ),
                            isScrollControlled: true,
                            builder: (_) => BlocProvider.value(
                              value:
                                  BlocProvider.of<BirthdayFormCubit>(context),
                              child: FormBottomSheet(),
                            ),
                          );
                        },
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
