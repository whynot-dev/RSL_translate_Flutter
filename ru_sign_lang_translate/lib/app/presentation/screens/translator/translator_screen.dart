import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/app/widgets/app_bars/default_appbar.dart';
import 'package:ru_sign_lang_translate/app/widgets/backgrounds/default_black_background.dart';
import 'package:ru_sign_lang_translate/app/widgets/backgrounds/default_white_background.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_bloc_listener.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_bloc_state_widget.dart';

import 'bloc/translator_bloc.dart';

class TranslatorScreen extends StatefulWidget {
  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends BaseBlocStateWidget<TranslatorScreen, TranslatorBloc, TranslatorEvent> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.grayBackground,
        body: SafeArea(
          child: _buildBody(context),
        ),
      );

  Widget _buildBody(BuildContext context) => BaseBlocListener<TranslatorBloc, TranslatorState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (context, state, action) async {
          if (action is NavigateBack) {
            Navigator.pop(context);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildCamera(),
            const SizedBox(height: 20),
            _buildCurrentPredict(),
            const SizedBox(height: 10),
            _buildOldPredictions(),
            const SizedBox(height: 10),
            _buildResizedFrame(),
            const SizedBox(height: 10),
            _buildLoader(),
            const SizedBox(height: 40),
          ],
        ),
      );

  Widget _buildCamera() => BlocBuilder<TranslatorBloc, TranslatorState>(
        buildWhen: (previous, current) => previous.cameraController != current.cameraController,
        builder: (context, state) => Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                child: Container(
                  color: AppColors.black,
                  child: state.cameraController != null ? CameraPreview(state.cameraController!) : const SizedBox(),
                ),
              ),
              DefaultAppbar(
                title: 'Переводчик',
                rightWidget: _buildCameraSwitchButton(context),
                onBackPressed: () {
                  getBloc().add(TranslatorEvent.backClicked());
                },
              ),
            ],
          ),
        ),
      );

  Widget _buildCurrentPredict() => BlocBuilder<TranslatorBloc, TranslatorState>(
        buildWhen: (previous, current) => previous.currentGesture != current.currentGesture,
        builder: (context, state) => Container(
          padding: EdgeInsets.symmetric(horizontal: 55),
          alignment: Alignment.centerLeft,
          child: Text(
            'Текущий жест: ${state.currentGesture ?? ''}',
            style: TextStyle(fontSize: 16, color: AppColors.black),
          ),
        ),
      );

  Widget _buildOldPredictions() => BlocBuilder<TranslatorBloc, TranslatorState>(
        buildWhen: (previous, current) => previous.gestures != current.gestures,
        builder: (context, state) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 55),
          alignment: Alignment.centerLeft,
          child: Text(
            'последние 5 жестов: ${state.gestures}',
            style: TextStyle(fontSize: 16, color: AppColors.black),
          ),
        ),
      );

  Widget _buildResizedFrame() => BlocBuilder<TranslatorBloc, TranslatorState>(
        buildWhen: (previous, current) => previous.imageBytes != current.imageBytes,
        builder: (context, state) => Container(
          child: state.imageBytes != null ? Image.memory(state.imageBytes!) : const SizedBox(),
        ),
      );

  Widget _buildCameraSwitchButton(BuildContext context) => Container(
        padding: const EdgeInsets.all(12),
        child: IconButton(
          onPressed: () {
            getBloc().add(TranslatorEvent.switchCameraClicked());
          },
          visualDensity: VisualDensity.comfortable,
          icon: Icon(Icons.flip_camera_ios_outlined),
          color: AppColors.black,
          iconSize: 28,
          highlightColor: AppColors.gray2,
          disabledColor: AppColors.black,
        ),
      );

  Widget _buildLoader() => SpinKitThreeBounce(
    size: 25,
    color: AppColors.black4,
  );
}
