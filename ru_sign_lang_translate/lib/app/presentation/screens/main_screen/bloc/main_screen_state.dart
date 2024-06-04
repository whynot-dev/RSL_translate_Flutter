part of 'main_screen_bloc.dart';

@freezed
class MainScreenState extends BaseBlocState with _$MainScreenState {
  factory MainScreenState({
    BlocAction? action,
  }) = _MainScreenState;
}

class NavigateToTranslator extends BlocAction{}

class NavigateToEducation extends BlocAction{}
