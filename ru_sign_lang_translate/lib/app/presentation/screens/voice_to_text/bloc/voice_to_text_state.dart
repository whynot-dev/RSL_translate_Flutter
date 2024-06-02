part of 'voice_to_text_bloc.dart';

@freezed
class VoiceToTextState extends BaseBlocState with _$VoiceToTextState {
  factory VoiceToTextState({
    BlocAction? action,
  }) = _VoiceToTextState;
}
