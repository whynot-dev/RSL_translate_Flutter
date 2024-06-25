import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ru_sign_lang_translate/core/bloc/bloc_action.dart';
import 'package:ru_sign_lang_translate/data/gateways/local/preferences_local_gateway.dart';

part 'splash_bloc.freezed.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    required this.preferencesLocalGateway,
  }) : super(SplashState()) {
    on<CheckAuthorizationStatus>(_checkAuthorizationStatus);
  }

  PreferencesLocalGateway preferencesLocalGateway;

  FutureOr<void> _checkAuthorizationStatus(CheckAuthorizationStatus event, Emitter<SplashState> emit) async {
    emit(state.copyWith(action: null));
    emit(state.copyWith(action: NavigateToMainScreen()));
  }
}
