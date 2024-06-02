import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ru_sign_lang_translate/app/navigation/navigation_type.dart';
import 'package:ru_sign_lang_translate/core/bloc/base_bloc_state.dart';
import 'package:ru_sign_lang_translate/core/bloc/bloc_action.dart';

part 'lesson_state.dart';

part 'lesson_event.dart';

part 'lesson_bloc.freezed.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonBloc() : super(LessonState()) {
    on<Init>(_init);
  }

  FutureOr<void> _init(Init event, Emitter<LessonState> emit) {
    emit(state.copyWith());
  }
}
