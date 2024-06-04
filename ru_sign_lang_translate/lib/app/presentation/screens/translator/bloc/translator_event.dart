part of 'translator_bloc.dart';

@freezed
class TranslatorEvent with _$TranslatorEvent {
  const factory TranslatorEvent.init() = Init;
  const factory TranslatorEvent.gestureRecognized(String gesture) = GestureRecognized;
  const factory TranslatorEvent.switchCameraClicked() = SwitchCameraClicked;
  const factory TranslatorEvent.backClicked() = BackClicked;
  const factory TranslatorEvent.showLastPredictionsClicked() = ShowLastPredictionsClicked;
  const factory TranslatorEvent.startProcessing() = StartProcessing;
}