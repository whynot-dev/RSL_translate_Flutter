import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ru_sign_lang_translate/app/navigation/navigation_type.dart';
import 'package:ru_sign_lang_translate/core/bloc/base_bloc_state.dart';
import 'package:ru_sign_lang_translate/core/bloc/bloc_action.dart';

part 'education_state.dart';

part 'education_event.dart';

part 'education_bloc.freezed.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  EducationBloc() : super(EducationState()) {
    on<Init>(_init);
  }

  FutureOr<void> _init(Init event, Emitter<EducationState> emit) {
    emit(state.copyWith());
  }
}
