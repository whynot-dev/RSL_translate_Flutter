part of 'voice_to_text_bloc.dart';

@freezed
class VoiceToTextEvent with _$VoiceToTextEvent {
  const factory VoiceToTextEvent.init() = Init;
  const factory VoiceToTextEvent.backClicked() = BackClicked;
}