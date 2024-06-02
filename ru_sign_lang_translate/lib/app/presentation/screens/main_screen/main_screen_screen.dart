import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ru_sign_lang_translate/app/presentation/screens/translator/bloc/translator_bloc.dart';
import 'package:ru_sign_lang_translate/app/presentation/screens/translator/translator_screen.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/app/widgets/buttons/app_button.dart';
import 'package:ru_sign_lang_translate/app/widgets/routes/default_page_route_without_animation.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_bloc_listener.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_bloc_stateless_widget.dart';

import 'bloc/main_screen_bloc.dart';

class MainScreenScreen extends BaseBlocStatelessWidget<MainScreenBloc, MainScreenEvent> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: _buildBody(context),
        ),
      );

  Widget _buildBody(BuildContext context) => BaseBlocListener<MainScreenBloc, MainScreenState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (context, state, action) async {
          if (action is NavigateToTranslator) {
            Navigator.push(
              context,
              PageRouteWithoutAnimation(
                builder: (BuildContext context) => BlocProvider(
                  create: (context) => TranslatorBloc(),
                  child: TranslatorScreen(),
                ),
              ),
            );
          }
        },
        child: Column(
          children: [
            _buildLogo(),
            const SizedBox(height: 30),
            _buildTranslateButton(context),
            const SizedBox(height: 20),
            _buildMicrophoneButton(),
            const SizedBox(height: 20),
            _buildEducationButton(),
          ],
        ),
      );

  Widget _buildLogo() => Container(color: AppColors.startPhotoFooterGradient, height: 200, width: 200);

  Widget _buildTranslateButton(BuildContext context) => AppButton(
        text: 'Переводчик',
        onPressed: () {
          getBloc(context).add(MainScreenEvent.translateClicked());
        },
      );

  Widget _buildMicrophoneButton() => AppButton(
        text: 'Голос в текст',
        onPressed: () {},
      );

  Widget _buildEducationButton() => AppButton(
        text: 'Обучение',
        onPressed: () {},
      );
}
