import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ru_sign_lang_translate/app/presentation/screens/main_screen/bloc/main_screen_bloc.dart';
import 'package:ru_sign_lang_translate/app/presentation/screens/main_screen/main_screen_screen.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/app/widgets/backgrounds/default_black_background.dart';
import 'package:ru_sign_lang_translate/app/widgets/routes/default_page_route_without_animation.dart';
import 'package:ru_sign_lang_translate/di/injection.dart';

import 'bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  SplashScreen({required this.navigatorKey});

  @override
  Widget build(BuildContext context) => BlocListener<SplashBloc, SplashState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (context, state) async {
          var action = state.action;
          if (action is NavigateToMainScreen) {
            await setUpLocatorWithDependencies(context: context, navigatorKey: navigatorKey);
            Navigator.pushReplacement(
              context,
              PageRouteWithoutAnimation(
                builder: (BuildContext context) => BlocProvider(
                  create: (context) => MainScreenBloc(),
                  child: MainScreenScreen(),
                ),
              ),
            );
          }
        },
        child: Scaffold(
          body: DefaultBlackBackground(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 4),
                  Container(height: 1, width: 32, color: AppColors.white40),
                  const SizedBox(height: 16),
                  Text(
                    'Переводи язык жестов - легко',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
