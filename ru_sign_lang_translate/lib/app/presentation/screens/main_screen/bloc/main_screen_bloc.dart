import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ru_sign_lang_translate/app/navigation/navigation_type.dart';
import 'package:ru_sign_lang_translate/core/bloc/base_bloc_state.dart';
import 'package:ru_sign_lang_translate/core/bloc/bloc_action.dart';

part 'main_screen_state.dart';

part 'main_screen_event.dart';

part 'main_screen_bloc.freezed.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenState()) {
    on<Init>(_init);
    on<TranslateClicked>(_translateClicked);
  }

  FutureOr<void> _init(Init event, Emitter<MainScreenState> emit) {
    emit(state.copyWith());
  }

  FutureOr<void> _translateClicked(TranslateClicked event, Emitter<MainScreenState> emit) {
    emit(state.copyWith(action: null));
    emit(state.copyWith(action: NavigateToTranslator()));
  }
}
