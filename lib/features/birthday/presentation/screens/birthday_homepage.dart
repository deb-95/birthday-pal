import 'package:birthdaypal/features/birthday/bloc/birthday_bloc/birthday_bloc.dart';
import 'package:birthdaypal/features/birthday/bloc/birthday_form_cubit/birthday_form_cubit.dart';
import 'package:birthdaypal/features/birthday/model/presentation/birthday_vm.dart';
import 'package:birthdaypal/features/birthday/presentation/widgets/birthday_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BirthdayHomepage extends StatefulWidget {
  static const route = '/';

  const BirthdayHomepage({
    Key key,
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
            final formCubit = BlocProvider.of<BirthdayFormCubit>(context);
            formCubit.create();
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
              print(state);
              if (state is BirthdayReadLoaded) {
                return Column(
                  children:
                      state.birthday.map((bd) => Text("${bd.name}")).toList(),
                );
              } else if (state is BirthdayReadError) {
                print(state.reason);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

class BirthdayCard extends StatelessWidget {
  const BirthdayCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height / 7,
        ),
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
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text('Name'), Text('Date'), Text('Years')],
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
                          onPressed: () {},
                          child: Icon(Icons.delete),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<BirthdayFormCubit>(context).edit(
                                BirthdayVM(
                                    name: "Deb",
                                    birthday: DateTime.parse("1995-06-29"),
                                    color: Colors.yellow));
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
      ),
    );
  }
}

class FormBottomSheet extends StatelessWidget {
  const FormBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BirthdayForm(),
      ),
    );
  }
}
