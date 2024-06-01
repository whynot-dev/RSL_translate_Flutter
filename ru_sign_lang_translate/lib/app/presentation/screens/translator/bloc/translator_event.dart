part of 'translator_bloc.dart';

@freezed
class TranslatorEvent with _$TranslatorEvent {
  const factory TranslatorEvent.init() = Init;
  const factory TranslatorEvent.gestureRecognized(String gesture) = GestureRecognized;
}