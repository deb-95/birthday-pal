import 'package:birthdaypal/features/birthday/bloc/birthday_bloc/birthday_bloc.dart';
import 'package:birthdaypal/features/birthday/bloc/birthday_form_cubit/birthday_form_cubit.dart';
import 'package:birthdaypal/features/birthday/presentation/widgets/birthdays_list.dart';
import 'package:birthdaypal/features/birthday/presentation/widgets/form_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BirthdayHomepage extends StatefulWidget {
  static const route = '/';

  const BirthdayHomepage({
    Key? key,
  }) : super(key: key);

  @override
  _BirthdayHomepageState createState() => _BirthdayHomepageState();
}

class _BirthdayHomepageState extends State<BirthdayHomepage> {
  @override
  void initState() {
    if (context.read<BirthdayBloc>().state is BirthdayInitial) {
      context.read<BirthdayBloc>().add(BirthdayInit());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BirthdayBloc, BirthdayState>(
      listener: (context, state) {
        context.read<BirthdayBloc>().add(BirthdayFetch());
      },
      listenWhen: (previous, current) => current is BirthdayReady,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<BirthdayFormCubit>(context).create();
            showModalBottomSheet<void>(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              isScrollControlled: true,
              builder: (_) => FormBottomSheet(),
            );
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('Birthday Pal'),
        ),
        body: Center(
          child: BlocBuilder<BirthdayBloc, BirthdayState>(
            builder: (context, state) {
              if (state is BirthdayReadLoaded) {
                return BirthdaysList(birthdays: state.birthdays);
              } else if (state is BirthdayReadError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.reason),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
