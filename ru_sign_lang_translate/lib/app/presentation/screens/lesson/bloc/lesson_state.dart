part of 'lesson_bloc.dart';

@freezed
class LessonState extends BaseBlocState with _$LessonState {
  factory LessonState({
    BlocAction? action,
  }) = _LessonState;
}
