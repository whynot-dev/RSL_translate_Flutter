import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ru_sign_lang_translate/app/navigation/navigation_action.dart';
import 'package:ru_sign_lang_translate/app/presentation/screens/lesson/bloc/lesson_bloc.dart';
import 'package:ru_sign_lang_translate/app/presentation/screens/lesson/lesson_screen.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/app/widgets/app_bars/default_appbar.dart';
import 'package:ru_sign_lang_translate/app/widgets/lists/lesson_item.dart';
import 'package:ru_sign_lang_translate/app/widgets/routes/default_page_route_without_animation.dart';
import 'package:ru_sign_lang_translate/core/ui/scroll_behavior/disable_glow_effect_scroll_behavior.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_bloc_listener.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_bloc_state_widget.dart';
import 'package:ru_sign_lang_translate/localization/app_localizations.dart';

import 'bloc/education_bloc.dart';

class EducationScreen extends StatefulWidget {
  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends BaseBlocStateWidget<EducationScreen, EducationBloc, EducationEvent> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.grayBackground,
        body: SafeArea(
          child: _buildBody(context),
        ),
      );

  Widget _buildBody(BuildContext context) => BaseBlocListener<EducationBloc, EducationState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (context, state, action) async {
          if (action is NavigateBack) {
            Navigator.pop(context);
          }
          if (action is NavigateToLesson) {
            Navigator.push(
              context,
              PageRouteWithoutAnimation(
                builder: (BuildContext context) => BlocProvider(
                  create: (context) => LessonBloc(lesson: action.lesson),
                  child: LessonScreen(),
                ),
              ),
            );
          }
        },
        child: ScrollConfiguration(
          behavior: const DisableGrowEffectScrollBehavior(),
          child: Column(
            children: [
              _buildAppBar(),
              Expanded(child: _buildLessons()),
            ],
          ),
        ),
      );

  Widget _buildAppBar() => DefaultAppbar(
        title: AppLocalizations.of(context).education,
        needDivider: true,
        onBackPressed: () {
          getBloc().add(EducationEvent.backClicked());
        },
      );

  Widget _buildLessons() => BlocBuilder<EducationBloc, EducationState>(
        buildWhen: (previous, current) => previous.lessons != current.lessons,
        builder: (context, state) => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: state.lessons.length,
          itemBuilder: (context, index) => LessonItem(
            title: '${AppLocalizations.of(context).lesson} ${index + 1}',
            lesson: state.lessons[index],
            lessonClicked: () {
              getBloc().add(EducationEvent.lessonClicked(state.lessons[index]));
            },
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
        ),
      );
}
