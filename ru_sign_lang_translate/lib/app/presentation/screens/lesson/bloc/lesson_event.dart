part of 'lesson_bloc.dart';

@freezed
class LessonEvent with _$LessonEvent {
  const factory LessonEvent.init() = Init;
  const factory LessonEvent.backClicked() = BackClicked;
  const factory LessonEvent.lessonTypeChanged(LessonType lessonType) = LessonTypeChanged;
  const factory LessonEvent.switchCameraClicked() = SwitchCameraClicked;
}