part of 'education_bloc.dart';

@freezed
class EducationState extends BaseBlocState with _$EducationState {
  factory EducationState({
    BlocAction? action,
    @Default([]) List<LessonEntity> lessons,
  }) = _EducationState;
}

class NavigateToLesson extends BlocAction {
  NavigateToLesson({
    required this.lesson,
  });

  final LessonEntity lesson;
}
