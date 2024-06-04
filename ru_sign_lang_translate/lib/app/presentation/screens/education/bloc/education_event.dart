part of 'education_bloc.dart';

@freezed
class EducationEvent with _$EducationEvent {
  const factory EducationEvent.init() = Init;
  const factory EducationEvent.backClicked() = BackClicked;
  const factory EducationEvent.lessonClicked(LessonEntity lesson) = LessonClicked;
}