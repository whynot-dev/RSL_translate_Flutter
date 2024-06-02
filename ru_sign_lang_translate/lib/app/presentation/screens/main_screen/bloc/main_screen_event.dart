part of 'main_screen_bloc.dart';

@freezed
class MainScreenEvent with _$MainScreenEvent {
  const factory MainScreenEvent.init() = Init;
  const factory MainScreenEvent.translateClicked() = TranslateClicked;
}