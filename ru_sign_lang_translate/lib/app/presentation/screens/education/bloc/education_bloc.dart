import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ru_sign_lang_translate/app/navigation/navigation_action.dart';
import 'package:ru_sign_lang_translate/core/bloc/base_bloc_state.dart';
import 'package:ru_sign_lang_translate/core/bloc/bloc_action.dart';
import 'package:ru_sign_lang_translate/domain/entities/lesson_entity.dart';

part 'education_state.dart';

part 'education_event.dart';

part 'education_bloc.freezed.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  EducationBloc() : super(EducationState()) {
    on<Init>(_init);
    on<BackClicked>(_backClicked);
    on<LessonClicked>(_lessonClicked);
    add(EducationEvent.init());
  }

  FutureOr<void> _init(Init event, Emitter<EducationState> emit) {
    List<LessonEntity> lessons = [

      LessonEntity(nameGesture: 'День', valueGesture: 'день', url: 'https://surdo.me/wp-content/uploads/2023/09/Den.mp4'),
      LessonEntity(nameGesture: 'Здравствуйте', valueGesture: 'здравствуйте', url: 'https://surdo.me/wp-content/uploads/2023/07/zdravstvuiy.mp4'),
      LessonEntity(nameGesture: 'Понедельник', valueGesture: 'понедельник', url: 'https://surdo.me/wp-content/uploads/2023/09/Ponedelnik.mp4'),
      LessonEntity(nameGesture: 'Институт', valueGesture: 'институт', url: 'https://surdo.me/wp-content/uploads/2023/07/institut.mp4'),
      LessonEntity(nameGesture: 'Работа', valueGesture: 'работа', url: 'https://surdo.me/wp-content/uploads/2023/07/rabota.mp4'),
      LessonEntity(nameGesture: 'Идея', valueGesture: 'идея', url: 'https://surdo.me/wp-content/uploads/2023/09/Ideya.mp4'),
      LessonEntity(nameGesture: 'Назад', valueGesture: 'назад', url: 'https://surdo.me/wp-content/uploads/2023/07/nazad.mp4'),
      LessonEntity(nameGesture: 'Деньги', valueGesture: 'деньга', url: 'https://surdo.me/wp-content/uploads/2023/07/den_gi.mp4'),
      LessonEntity(nameGesture: 'Год', valueGesture: 'год', url: 'https://surdo.me/wp-content/uploads/2023/09/God.mp4'),
      LessonEntity(nameGesture: 'Думать', valueGesture: 'думать', url: 'https://surdo.me/wp-content/uploads/2023/07/dumat_.mp4'),

    ];

    emit(state.copyWith(lessons: lessons));
  }

  FutureOr<void> _backClicked(BackClicked event, Emitter<EducationState> emit) {
    emit(state.copyWith(action: null));
    emit(state.copyWith(action: NavigateBack()));
  }

  FutureOr<void> _lessonClicked(LessonClicked event, Emitter<EducationState> emit) {
    emit(state.copyWith(action: null));
    emit(state.copyWith(action: NavigateToLesson(lesson: event.lesson)));
  }
}
