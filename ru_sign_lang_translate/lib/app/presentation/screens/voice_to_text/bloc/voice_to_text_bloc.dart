import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ru_sign_lang_translate/app/navigation/navigation_action.dart';
import 'package:ru_sign_lang_translate/app/navigation/navigation_type.dart';
import 'package:ru_sign_lang_translate/app/presentation/screens/translator/bloc/translator_bloc.dart';
import 'package:ru_sign_lang_translate/core/bloc/base_bloc_state.dart';
import 'package:ru_sign_lang_translate/core/bloc/bloc_action.dart';

part 'voice_to_text_state.dart';

part 'voice_to_text_event.dart';

part 'voice_to_text_bloc.freezed.dart';

class VoiceToTextBloc extends Bloc<VoiceToTextEvent, VoiceToTextState> {
  VoiceToTextBloc() : super(VoiceToTextState()) {
    on<Init>(_init);
    on<BackClicked>(_backClicked);
  }

  FutureOr<void> _init(Init event, Emitter<VoiceToTextState> emit) {
    emit(state.copyWith());
  }

  FutureOr<void> _backClicked(BackClicked event, Emitter<VoiceToTextState> emit) {
    emit(state.copyWith(action: null));
    emit(state.copyWith(action: NavigateBack()));
  }
}
