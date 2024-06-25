import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ru_sign_lang_translate/app/presentation/screens/education/bloc/education_bloc.dart';
import 'package:ru_sign_lang_translate/app/presentation/screens/education/education_screen.dart';
import 'package:ru_sign_lang_translate/app/presentation/screens/translator/bloc/translator_bloc.dart';
import 'package:ru_sign_lang_translate/app/presentation/screens/translator/translator_screen.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/app/widgets/buttons/default_button.dart';
import 'package:ru_sign_lang_translate/app/widgets/routes/default_page_route_without_animation.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_bloc_listener.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_bloc_stateless_widget.dart';
import 'package:ru_sign_lang_translate/gen/assets.gen.dart';
import 'package:ru_sign_lang_translate/localization/app_localizations.dart';

import 'bloc/main_screen_bloc.dart';

class MainScreenScreen extends BaseBlocStatelessWidget<MainScreenBloc, MainScreenEvent> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.25),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.blue1, AppColors.blue2],
                    ),
                  ),
                  //child:,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(Assets.images.stripTop),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(Assets.images.stripBottom),
              ),
              _buildBody(context)
            ],
          ),
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
          if (action is NavigateToEducation) {
            Navigator.push(
              context,
              PageRouteWithoutAnimation(
                builder: (BuildContext context) => BlocProvider(
                  create: (context) => EducationBloc(),
                  child: EducationScreen(),
                ),
              ),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogo(),
              const SizedBox(height: 40),
              _buildTranslateButton(context),
              const SizedBox(height: 40),
              _buildEducationButton(context),
            ],
          ),
        ),
      );

  //Widget _buildLogo() =>

  Widget _buildLogo() => Container(
        height: 200,
        child: SvgPicture.asset(Assets.images.logo, color: AppColors.white4),
      );

  Widget _buildTranslateButton(BuildContext context) => DefaultButton(
        color: AppColors.white4,
        text: AppLocalizations.of(context).translator,
        onPressed: () {
          getBloc(context).add(MainScreenEvent.translateClicked());
        },
      );

  Widget _buildEducationButton(BuildContext context) => DefaultButton(
        color: AppColors.white4,
        text:  AppLocalizations.of(context).education,
        onPressed: () {
          getBloc(context).add(MainScreenEvent.educationClicked());
        },
      );
}
