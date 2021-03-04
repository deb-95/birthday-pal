import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class MyBlocObserver extends BlocObserver {
  final logger = Logger();

  @override
  void onCreate(Bloc bloc) {
    logger.i('Created $bloc');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    logger.i('Event $event from $bloc');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    logger.e(bloc, stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(Bloc bloc) {
    super.onClose(bloc);
  }
}
