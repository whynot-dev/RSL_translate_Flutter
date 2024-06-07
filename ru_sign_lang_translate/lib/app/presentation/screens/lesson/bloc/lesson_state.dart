part of 'lesson_bloc.dart';

@freezed
class LessonState extends BaseBlocState with _$LessonState {
  factory LessonState({
    BlocAction? action,
    required LessonEntity lesson,
    @Default(LessonType.theory) LessonType selectedLessonType,
    CameraController? cameraController,
    VideoPlayerController? videoController,
    @Default(false)bool isStartingPractice,
    String? prediction,
  }) = _LessonState;
}
