import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ru_sign_lang_translate/app/navigation/navigation_action.dart';
import 'package:ru_sign_lang_translate/app/widgets/app_bars/default_appbar.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_bloc_listener.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_bloc_state_widget.dart';

import 'bloc/voice_to_text_bloc.dart';

class VoiceToTextScreen extends StatefulWidget {
  @override
  State<VoiceToTextScreen> createState() => _VoiceToTextScreenState();
}

class _VoiceToTextScreenState extends BaseBlocStateWidget<VoiceToTextScreen, VoiceToTextBloc, VoiceToTextEvent> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: _buildBody(context),
        ),
      );

  Widget _buildBody(BuildContext context) => BaseBlocListener<VoiceToTextBloc, VoiceToTextState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (context, state, action) async {
          if (action is NavigateBack) {
            Navigator.pop(context);
          }
        },
        child: Column(
          children: [
            _buildAppBar(),
          ],
        ),
      );

  Widget _buildAppBar() => DefaultAppbar(
        title: 'Голос в текст',
        onBackPressed: () {
          getBloc().add(VoiceToTextEvent.backClicked());
        },
      );


}
