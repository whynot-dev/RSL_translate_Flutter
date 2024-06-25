import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ru_sign_lang_translate/app/navigation/navigation_action.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/app/widgets/app_bars/default_appbar.dart';
import 'package:ru_sign_lang_translate/app/widgets/bottom_sheets/app_bottom_sheet.dart';
import 'package:ru_sign_lang_translate/app/widgets/buttons/default_button.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_bloc_listener.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_bloc_state_widget.dart';
import 'package:ru_sign_lang_translate/localization/app_localizations.dart';

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
          if (action is ShowLastPredictionsBottomSheet) {
            showLastPredictionsBottomSheet(gestures: state.gestures);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildCamera(),
            const SizedBox(height: 20),
            _buildCurrentPrediction(),
            _buildLoader(),
            const SizedBox(height: 15),
            _buildLastPredictionsButton(),
            const SizedBox(height: 20),
          ],
        ),
      );

  Widget _buildCamera() => BlocBuilder<TranslatorBloc, TranslatorState>(
        buildWhen: (previous, current) => previous.cameraController != current.cameraController,
        builder: (context, state) => Expanded(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: AppColors.gray6, blurRadius: 8, offset: const Offset(2, 10)),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                  child: Container(
                    color: AppColors.black,
                    child: state.cameraController != null ? CameraPreview(state.cameraController!) : const SizedBox(),
                  ),
                ),
              ),
              DefaultAppbar(
                title: AppLocalizations.of(context).translator,
                rightWidget: _buildCameraSwitchButton(context),
                onBackPressed: () {
                  getBloc().add(TranslatorEvent.backClicked());
                },
              ),
            ],
          ),
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

  Widget _buildLoader() => BlocBuilder<TranslatorBloc, TranslatorState>(
        buildWhen: (previous, current) => previous.needLoader != current.needLoader,
        builder: (context, state) => state.needLoader
            ? SpinKitThreeBounce(
                size: 25,
                color: AppColors.black4,
              )
            : const SizedBox(height: 25),
      );

  Widget _buildCurrentPrediction() => Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              AppLocalizations.of(context).currentGesture,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: AppColors.onBackground,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(color: AppColors.gray5, blurRadius: 10, offset: const Offset(0, 0)),
                ],
              ),
              child: _buildTextCurrentPrediction(),
            ),
          ),
        ],
      );

  Widget _buildTextCurrentPrediction() => BlocBuilder<TranslatorBloc, TranslatorState>(
        buildWhen: (previous, current) => previous.currentGesture != current.currentGesture,
        builder: (context, state) => Text(
          state.currentGesture ?? '---',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.onBackground,
          ),
        ),
      );

  Widget _buildLastPredictionsButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DefaultButton(
          text: AppLocalizations.of(context).lastFiveGestures,
          onPressed: () {
            getBloc().add(TranslatorEvent.showLastPredictionsClicked());
          },
        ),
      );

  void showLastPredictionsBottomSheet({List<String> gestures = const []}) {
    AppBottomSheet.show(
      context,
      Container(
        height: MediaQuery.of(context).size.height / 2.5,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 4,
                width: 48,
                decoration: BoxDecoration(color: AppColors.gray2, borderRadius: BorderRadius.circular(2)),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context).lastFiveGestures,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColors.onBackground,
              ),
            ),
            const SizedBox(height: 12),
            ...gestures.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  item,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19, color: AppColors.onBackground),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
