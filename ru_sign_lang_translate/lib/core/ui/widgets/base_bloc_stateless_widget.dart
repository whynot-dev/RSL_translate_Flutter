import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBlocStatelessWidget<B extends Bloc,E> extends StatelessWidget {
  B getBloc(BuildContext context) => context.read<B>();

  void sendEvent(E event,BuildContext targetContext) {
    getBloc(targetContext).add(event);
  }
}