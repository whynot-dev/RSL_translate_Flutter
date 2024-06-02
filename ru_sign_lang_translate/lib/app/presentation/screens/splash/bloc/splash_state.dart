part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  factory SplashState({
    BlocAction? action,
  }) = _SplashState;
}

class NavigateToMainScreen extends BlocAction{}