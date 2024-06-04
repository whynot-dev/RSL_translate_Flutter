part of 'translator_bloc.dart';

@freezed
class TranslatorState extends BaseBlocState with _$TranslatorState {
  factory TranslatorState({
    BlocAction? action,
    CameraController? cameraController,
    Uint8List? imageBytes,
    String? currentGesture,
    @Default(false)bool needLoader,
    @Default([])List<String> gestures,

  }) = _TranslatorState;
}

class ShowLastPredictionsBottomSheet extends BlocAction{}

