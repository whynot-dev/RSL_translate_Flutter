import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ru_sign_lang_translate/localization/app_localizations.dart';

abstract class BaseBlocStateWidget<W extends StatefulWidget, B extends Bloc,E> extends State<W> {

  AppLocalizations get localization => AppLocalizations.of(context);
  B getBloc({BuildContext? targetContext}) =>  targetContext != null ? targetContext.read<B>() : context.read<B>();

  void sendEvent(E event,{BuildContext? targetContext}) {
    if(mounted) {
      getBloc(targetContext: targetContext).add(event);
    }
  }

  MediaQueryData get mediaQuery => MediaQuery.of(context);
}
