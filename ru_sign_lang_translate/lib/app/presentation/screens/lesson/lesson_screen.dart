import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ru_sign_lang_translate/app/navigation/navigation_action.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/app/widgets/app_bars/default_appbar.dart';
import 'package:ru_sign_lang_translate/app/widgets/selectors/switcher_widget.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_bloc_listener.dart';
import 'package:ru_sign_lang_translate/core/ui/widgets/base_bloc_state_widget.dart';
import 'package:ru_sign_lang_translate/domain/enums/lesson_type.dart';
import 'package:video_player/video_player.dart';

import 'bloc/lesson_bloc.dart';

class LessonScreen extends StatefulWidget {
  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends BaseBlocStateWidget<LessonScreen, LessonBloc, LessonEvent> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.grayBackground,
        body: SafeArea(
          child: _buildBody(context),
        ),
      );

  Widget _buildBody(BuildContext context) => BaseBlocListener<LessonBloc, LessonState>(
        listenWhen: (previous, current) => previous.action != current.action,
        listener: (context, state, action) async {
          if (action is NavigateBack) {
            Navigator.pop(context);
          }
        },
        child: Column(
          children: [
            _buildAppBar(),
            const SizedBox(height: 40),
            _buildToggleButtons(),
            const SizedBox(height: 40),
            _buildPlayerOrCamera(),
          ],
        ),
      );

  Widget _buildAppBar() => BlocBuilder<LessonBloc, LessonState>(
        buildWhen: (previous, current) => previous.lesson != current.lesson,
        builder: (context, state) => DefaultAppbar(
          title: state.lesson.nameGesture,
          needDivider: true,
          onBackPressed: () {
            getBloc().add(LessonEvent.backClicked());
          },
        ),
      );

  Widget _buildToggleButtons() => BlocBuilder<LessonBloc, LessonState>(
        buildWhen: (previous, current) => previous.selectedLessonType != current.selectedLessonType,
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SwitcherWidget(
            selectedLessonType: state.selectedLessonType,
            onTap: (lessonType) {
              getBloc().add(LessonEvent.lessonTypeChanged(lessonType));
            },
          ),
        ),
      );

  Widget _buildPlayerOrCamera() => BlocBuilder<LessonBloc, LessonState>(
        buildWhen: (previous, current) => previous.selectedLessonType != current.selectedLessonType,
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              firstChild: _buildVideoPlayer(),
              secondChild: _buildCamera(),
              crossFadeState:
                  state.selectedLessonType == LessonType.theory ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            ),
          ),
        ),
      );

  Widget _buildVideoPlayer() => BlocBuilder<LessonBloc, LessonState>(
        buildWhen: (previous, current) => previous.videoController != current.videoController,
        builder: (context, state) => state.videoController != null
            ? Container(
                decoration: BoxDecoration(
                  color: AppColors.black,
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2.3,
                    child: AspectRatio(
                      aspectRatio: state.videoController!.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          VideoPlayer(state.videoController!),
                          _ControlsOverlay(
                            controller: state.videoController!,
                            onChanged: () {
                              setState(() {});
                            },
                          ),
                          VideoProgressIndicator(
                            state.videoController!,
                            allowScrubbing: true,
                            padding: const EdgeInsets.only(bottom: 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      );

  // TODO добавить текст "повторите жест, несколько раз" и выводить что то когда правильно распознало
  Widget _buildCamera() => BlocBuilder<LessonBloc, LessonState>(
        buildWhen: (previous, current) => previous.cameraController != current.cameraController,
        builder: (context, state) => Container(
          color: AppColors.black,
          child: state.cameraController != null ? CameraPreview(state.cameraController!) : const SizedBox(),
        ),
      );
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({
    required this.controller,
    this.onChanged,
  });

  final VoidCallback? onChanged;

  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            reverseDuration: const Duration(milliseconds: 200),
            child: controller.value.isPlaying
                ? const SizedBox.shrink()
                : const ColoredBox(
                    color: Colors.black26,
                    child: Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 100.0,
                        semanticLabel: 'Play',
                      ),
                    ),
                  ),
          ),
          GestureDetector(
            onTap: () {
              controller.value.isPlaying ? controller.pause() : controller.play();
              onChanged?.call();
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: PopupMenuButton<double>(
              initialValue: controller.value.playbackSpeed,
              tooltip: 'Playback speed',
              onSelected: (double speed) {
                controller.setPlaybackSpeed(speed);
                onChanged?.call();
              },
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<double>>[
                  for (final double speed in _examplePlaybackRates)
                    PopupMenuItem<double>(
                      value: speed,
                      child: Text('${speed}x'),
                    )
                ];
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  // Using less vertical padding as the text is also longer
                  // horizontally, so it feels like it would need more spacing
                  // horizontally (matching the aspect ratio of the video).
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Text('${controller.value.playbackSpeed}x', style: TextStyle(fontSize: 25)),
              ),
            ),
          ),
        ],
      );
}
