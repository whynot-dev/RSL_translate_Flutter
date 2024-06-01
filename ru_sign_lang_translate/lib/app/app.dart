import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:ru_sign_lang_translate/app/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:ru_sign_lang_translate/app/presentation/screens/splash/splash_screen.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_body.dart';
import 'package:ru_sign_lang_translate/data/gateways/local/preferences_local_gateway.dart';
import 'package:ru_sign_lang_translate/di/injection.dart';
import 'package:ru_sign_lang_translate/localization/app_localizations.dart';

import 'resources/app_themes.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  PreferencesLocalGateway preferencesLocalGateway = injection();

  late StreamSubscription<bool> _keyboardSubscription;

  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityController _keyboardVisibilityController =
        KeyboardVisibilityController();
    _keyboardSubscription =
        _keyboardVisibilityController.onChange.listen((bool visible) {
      if (!visible) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      }
    });
  }

  @override
  void dispose() {
    _keyboardSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => OverlaySupport.global(
        child: MaterialApp(
          navigatorKey: navigatorKey,
          theme: AppThemes.appTheme,
          locale: Locale('ru'),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            AppLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [Locale('ru'), Locale('en')],
          home: BlocProvider(
            create: (BuildContext context) =>
                SplashBloc(preferencesLocalGateway: injection())
                  ..add(SplashEvent.checkAuthorizationStatus()),
            child: SplashScreen(navigatorKey: navigatorKey),
          ),
          //home: Container()),
        ),
      );
}
