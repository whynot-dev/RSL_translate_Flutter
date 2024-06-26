// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TranslatorState {
  BlocAction? get action => throw _privateConstructorUsedError;
  CameraController? get cameraController => throw _privateConstructorUsedError;
  Uint8List? get imageBytes => throw _privateConstructorUsedError;
  String? get currentGesture => throw _privateConstructorUsedError;
  bool get needLoader => throw _privateConstructorUsedError;
  List<String> get gestures => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TranslatorStateCopyWith<TranslatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslatorStateCopyWith<$Res> {
  factory $TranslatorStateCopyWith(
          TranslatorState value, $Res Function(TranslatorState) then) =
      _$TranslatorStateCopyWithImpl<$Res, TranslatorState>;
  @useResult
  $Res call(
      {BlocAction? action,
      CameraController? cameraController,
      Uint8List? imageBytes,
      String? currentGesture,
      bool needLoader,
      List<String> gestures});
}

/// @nodoc
class _$TranslatorStateCopyWithImpl<$Res, $Val extends TranslatorState>
    implements $TranslatorStateCopyWith<$Res> {
  _$TranslatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? cameraController = freezed,
    Object? imageBytes = freezed,
    Object? currentGesture = freezed,
    Object? needLoader = null,
    Object? gestures = null,
  }) {
    return _then(_value.copyWith(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      cameraController: freezed == cameraController
          ? _value.cameraController
          : cameraController // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      currentGesture: freezed == currentGesture
          ? _value.currentGesture
          : currentGesture // ignore: cast_nullable_to_non_nullable
              as String?,
      needLoader: null == needLoader
          ? _value.needLoader
          : needLoader // ignore: cast_nullable_to_non_nullable
              as bool,
      gestures: null == gestures
          ? _value.gestures
          : gestures // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TranslatorStateImplCopyWith<$Res>
    implements $TranslatorStateCopyWith<$Res> {
  factory _$$TranslatorStateImplCopyWith(_$TranslatorStateImpl value,
          $Res Function(_$TranslatorStateImpl) then) =
      __$$TranslatorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocAction? action,
      CameraController? cameraController,
      Uint8List? imageBytes,
      String? currentGesture,
      bool needLoader,
      List<String> gestures});
}

/// @nodoc
class __$$TranslatorStateImplCopyWithImpl<$Res>
    extends _$TranslatorStateCopyWithImpl<$Res, _$TranslatorStateImpl>
    implements _$$TranslatorStateImplCopyWith<$Res> {
  __$$TranslatorStateImplCopyWithImpl(
      _$TranslatorStateImpl _value, $Res Function(_$TranslatorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? cameraController = freezed,
    Object? imageBytes = freezed,
    Object? currentGesture = freezed,
    Object? needLoader = null,
    Object? gestures = null,
  }) {
    return _then(_$TranslatorStateImpl(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      cameraController: freezed == cameraController
          ? _value.cameraController
          : cameraController // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      currentGesture: freezed == currentGesture
          ? _value.currentGesture
          : currentGesture // ignore: cast_nullable_to_non_nullable
              as String?,
      needLoader: null == needLoader
          ? _value.needLoader
          : needLoader // ignore: cast_nullable_to_non_nullable
              as bool,
      gestures: null == gestures
          ? _value._gestures
          : gestures // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$TranslatorStateImpl implements _TranslatorState {
  _$TranslatorStateImpl(
      {this.action,
      this.cameraController,
      this.imageBytes,
      this.currentGesture,
      this.needLoader = false,
      final List<String> gestures = const []})
      : _gestures = gestures;

  @override
  final BlocAction? action;
  @override
  final CameraController? cameraController;
  @override
  final Uint8List? imageBytes;
  @override
  final String? currentGesture;
  @override
  @JsonKey()
  final bool needLoader;
  final List<String> _gestures;
  @override
  @JsonKey()
  List<String> get gestures {
    if (_gestures is EqualUnmodifiableListView) return _gestures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gestures);
  }

  @override
  String toString() {
    return 'TranslatorState(action: $action, cameraController: $cameraController, imageBytes: $imageBytes, currentGesture: $currentGesture, needLoader: $needLoader, gestures: $gestures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranslatorStateImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.cameraController, cameraController) ||
                other.cameraController == cameraController) &&
            const DeepCollectionEquality()
                .equals(other.imageBytes, imageBytes) &&
            (identical(other.currentGesture, currentGesture) ||
                other.currentGesture == currentGesture) &&
            (identical(other.needLoader, needLoader) ||
                other.needLoader == needLoader) &&
            const DeepCollectionEquality().equals(other._gestures, _gestures));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      action,
      cameraController,
      const DeepCollectionEquality().hash(imageBytes),
      currentGesture,
      needLoader,
      const DeepCollectionEquality().hash(_gestures));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TranslatorStateImplCopyWith<_$TranslatorStateImpl> get copyWith =>
      __$$TranslatorStateImplCopyWithImpl<_$TranslatorStateImpl>(
          this, _$identity);
}

abstract class _TranslatorState implements TranslatorState {
  factory _TranslatorState(
      {final BlocAction? action,
      final CameraController? cameraController,
      final Uint8List? imageBytes,
      final String? currentGesture,
      final bool needLoader,
      final List<String> gestures}) = _$TranslatorStateImpl;

  @override
  BlocAction? get action;
  @override
  CameraController? get cameraController;
  @override
  Uint8List? get imageBytes;
  @override
  String? get currentGesture;
  @override
  bool get needLoader;
  @override
  List<String> get gestures;
  @override
  @JsonKey(ignore: true)
  _$$TranslatorStateImplCopyWith<_$TranslatorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TranslatorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String gesture) gestureRecognized,
    required TResult Function() switchCameraClicked,
    required TResult Function() backClicked,
    required TResult Function() showLastPredictionsClicked,
    required TResult Function() startProcessing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String gesture)? gestureRecognized,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? backClicked,
    TResult? Function()? showLastPredictionsClicked,
    TResult? Function()? startProcessing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String gesture)? gestureRecognized,
    TResult Function()? switchCameraClicked,
    TResult Function()? backClicked,
    TResult Function()? showLastPredictionsClicked,
    TResult Function()? startProcessing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(GestureRecognized value) gestureRecognized,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(ShowLastPredictionsClicked value)
        showLastPredictionsClicked,
    required TResult Function(StartProcessing value) startProcessing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(GestureRecognized value)? gestureRecognized,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(ShowLastPredictionsClicked value)?
        showLastPredictionsClicked,
    TResult? Function(StartProcessing value)? startProcessing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(GestureRecognized value)? gestureRecognized,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(ShowLastPredictionsClicked value)?
        showLastPredictionsClicked,
    TResult Function(StartProcessing value)? startProcessing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranslatorEventCopyWith<$Res> {
  factory $TranslatorEventCopyWith(
          TranslatorEvent value, $Res Function(TranslatorEvent) then) =
      _$TranslatorEventCopyWithImpl<$Res, TranslatorEvent>;
}

/// @nodoc
class _$TranslatorEventCopyWithImpl<$Res, $Val extends TranslatorEvent>
    implements $TranslatorEventCopyWith<$Res> {
  _$TranslatorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$TranslatorEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'TranslatorEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String gesture) gestureRecognized,
    required TResult Function() switchCameraClicked,
    required TResult Function() backClicked,
    required TResult Function() showLastPredictionsClicked,
    required TResult Function() startProcessing,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String gesture)? gestureRecognized,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? backClicked,
    TResult? Function()? showLastPredictionsClicked,
    TResult? Function()? startProcessing,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String gesture)? gestureRecognized,
    TResult Function()? switchCameraClicked,
    TResult Function()? backClicked,
    TResult Function()? showLastPredictionsClicked,
    TResult Function()? startProcessing,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(GestureRecognized value) gestureRecognized,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(ShowLastPredictionsClicked value)
        showLastPredictionsClicked,
    required TResult Function(StartProcessing value) startProcessing,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(GestureRecognized value)? gestureRecognized,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(ShowLastPredictionsClicked value)?
        showLastPredictionsClicked,
    TResult? Function(StartProcessing value)? startProcessing,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(GestureRecognized value)? gestureRecognized,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(ShowLastPredictionsClicked value)?
        showLastPredictionsClicked,
    TResult Function(StartProcessing value)? startProcessing,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements TranslatorEvent {
  const factory Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$GestureRecognizedImplCopyWith<$Res> {
  factory _$$GestureRecognizedImplCopyWith(_$GestureRecognizedImpl value,
          $Res Function(_$GestureRecognizedImpl) then) =
      __$$GestureRecognizedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String gesture});
}

/// @nodoc
class __$$GestureRecognizedImplCopyWithImpl<$Res>
    extends _$TranslatorEventCopyWithImpl<$Res, _$GestureRecognizedImpl>
    implements _$$GestureRecognizedImplCopyWith<$Res> {
  __$$GestureRecognizedImplCopyWithImpl(_$GestureRecognizedImpl _value,
      $Res Function(_$GestureRecognizedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gesture = null,
  }) {
    return _then(_$GestureRecognizedImpl(
      null == gesture
          ? _value.gesture
          : gesture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GestureRecognizedImpl implements GestureRecognized {
  const _$GestureRecognizedImpl(this.gesture);

  @override
  final String gesture;

  @override
  String toString() {
    return 'TranslatorEvent.gestureRecognized(gesture: $gesture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GestureRecognizedImpl &&
            (identical(other.gesture, gesture) || other.gesture == gesture));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gesture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GestureRecognizedImplCopyWith<_$GestureRecognizedImpl> get copyWith =>
      __$$GestureRecognizedImplCopyWithImpl<_$GestureRecognizedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String gesture) gestureRecognized,
    required TResult Function() switchCameraClicked,
    required TResult Function() backClicked,
    required TResult Function() showLastPredictionsClicked,
    required TResult Function() startProcessing,
  }) {
    return gestureRecognized(gesture);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String gesture)? gestureRecognized,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? backClicked,
    TResult? Function()? showLastPredictionsClicked,
    TResult? Function()? startProcessing,
  }) {
    return gestureRecognized?.call(gesture);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String gesture)? gestureRecognized,
    TResult Function()? switchCameraClicked,
    TResult Function()? backClicked,
    TResult Function()? showLastPredictionsClicked,
    TResult Function()? startProcessing,
    required TResult orElse(),
  }) {
    if (gestureRecognized != null) {
      return gestureRecognized(gesture);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(GestureRecognized value) gestureRecognized,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(ShowLastPredictionsClicked value)
        showLastPredictionsClicked,
    required TResult Function(StartProcessing value) startProcessing,
  }) {
    return gestureRecognized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(GestureRecognized value)? gestureRecognized,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(ShowLastPredictionsClicked value)?
        showLastPredictionsClicked,
    TResult? Function(StartProcessing value)? startProcessing,
  }) {
    return gestureRecognized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(GestureRecognized value)? gestureRecognized,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(ShowLastPredictionsClicked value)?
        showLastPredictionsClicked,
    TResult Function(StartProcessing value)? startProcessing,
    required TResult orElse(),
  }) {
    if (gestureRecognized != null) {
      return gestureRecognized(this);
    }
    return orElse();
  }
}

abstract class GestureRecognized implements TranslatorEvent {
  const factory GestureRecognized(final String gesture) =
      _$GestureRecognizedImpl;

  String get gesture;
  @JsonKey(ignore: true)
  _$$GestureRecognizedImplCopyWith<_$GestureRecognizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SwitchCameraClickedImplCopyWith<$Res> {
  factory _$$SwitchCameraClickedImplCopyWith(_$SwitchCameraClickedImpl value,
          $Res Function(_$SwitchCameraClickedImpl) then) =
      __$$SwitchCameraClickedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchCameraClickedImplCopyWithImpl<$Res>
    extends _$TranslatorEventCopyWithImpl<$Res, _$SwitchCameraClickedImpl>
    implements _$$SwitchCameraClickedImplCopyWith<$Res> {
  __$$SwitchCameraClickedImplCopyWithImpl(_$SwitchCameraClickedImpl _value,
      $Res Function(_$SwitchCameraClickedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwitchCameraClickedImpl implements SwitchCameraClicked {
  const _$SwitchCameraClickedImpl();

  @override
  String toString() {
    return 'TranslatorEvent.switchCameraClicked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchCameraClickedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String gesture) gestureRecognized,
    required TResult Function() switchCameraClicked,
    required TResult Function() backClicked,
    required TResult Function() showLastPredictionsClicked,
    required TResult Function() startProcessing,
  }) {
    return switchCameraClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String gesture)? gestureRecognized,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? backClicked,
    TResult? Function()? showLastPredictionsClicked,
    TResult? Function()? startProcessing,
  }) {
    return switchCameraClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String gesture)? gestureRecognized,
    TResult Function()? switchCameraClicked,
    TResult Function()? backClicked,
    TResult Function()? showLastPredictionsClicked,
    TResult Function()? startProcessing,
    required TResult orElse(),
  }) {
    if (switchCameraClicked != null) {
      return switchCameraClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(GestureRecognized value) gestureRecognized,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(ShowLastPredictionsClicked value)
        showLastPredictionsClicked,
    required TResult Function(StartProcessing value) startProcessing,
  }) {
    return switchCameraClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(GestureRecognized value)? gestureRecognized,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(ShowLastPredictionsClicked value)?
        showLastPredictionsClicked,
    TResult? Function(StartProcessing value)? startProcessing,
  }) {
    return switchCameraClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(GestureRecognized value)? gestureRecognized,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(ShowLastPredictionsClicked value)?
        showLastPredictionsClicked,
    TResult Function(StartProcessing value)? startProcessing,
    required TResult orElse(),
  }) {
    if (switchCameraClicked != null) {
      return switchCameraClicked(this);
    }
    return orElse();
  }
}

abstract class SwitchCameraClicked implements TranslatorEvent {
  const factory SwitchCameraClicked() = _$SwitchCameraClickedImpl;
}

/// @nodoc
abstract class _$$BackClickedImplCopyWith<$Res> {
  factory _$$BackClickedImplCopyWith(
          _$BackClickedImpl value, $Res Function(_$BackClickedImpl) then) =
      __$$BackClickedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BackClickedImplCopyWithImpl<$Res>
    extends _$TranslatorEventCopyWithImpl<$Res, _$BackClickedImpl>
    implements _$$BackClickedImplCopyWith<$Res> {
  __$$BackClickedImplCopyWithImpl(
      _$BackClickedImpl _value, $Res Function(_$BackClickedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BackClickedImpl implements BackClicked {
  const _$BackClickedImpl();

  @override
  String toString() {
    return 'TranslatorEvent.backClicked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BackClickedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String gesture) gestureRecognized,
    required TResult Function() switchCameraClicked,
    required TResult Function() backClicked,
    required TResult Function() showLastPredictionsClicked,
    required TResult Function() startProcessing,
  }) {
    return backClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String gesture)? gestureRecognized,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? backClicked,
    TResult? Function()? showLastPredictionsClicked,
    TResult? Function()? startProcessing,
  }) {
    return backClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String gesture)? gestureRecognized,
    TResult Function()? switchCameraClicked,
    TResult Function()? backClicked,
    TResult Function()? showLastPredictionsClicked,
    TResult Function()? startProcessing,
    required TResult orElse(),
  }) {
    if (backClicked != null) {
      return backClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(GestureRecognized value) gestureRecognized,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(ShowLastPredictionsClicked value)
        showLastPredictionsClicked,
    required TResult Function(StartProcessing value) startProcessing,
  }) {
    return backClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(GestureRecognized value)? gestureRecognized,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(ShowLastPredictionsClicked value)?
        showLastPredictionsClicked,
    TResult? Function(StartProcessing value)? startProcessing,
  }) {
    return backClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(GestureRecognized value)? gestureRecognized,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(ShowLastPredictionsClicked value)?
        showLastPredictionsClicked,
    TResult Function(StartProcessing value)? startProcessing,
    required TResult orElse(),
  }) {
    if (backClicked != null) {
      return backClicked(this);
    }
    return orElse();
  }
}

abstract class BackClicked implements TranslatorEvent {
  const factory BackClicked() = _$BackClickedImpl;
}

/// @nodoc
abstract class _$$ShowLastPredictionsClickedImplCopyWith<$Res> {
  factory _$$ShowLastPredictionsClickedImplCopyWith(
          _$ShowLastPredictionsClickedImpl value,
          $Res Function(_$ShowLastPredictionsClickedImpl) then) =
      __$$ShowLastPredictionsClickedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowLastPredictionsClickedImplCopyWithImpl<$Res>
    extends _$TranslatorEventCopyWithImpl<$Res,
        _$ShowLastPredictionsClickedImpl>
    implements _$$ShowLastPredictionsClickedImplCopyWith<$Res> {
  __$$ShowLastPredictionsClickedImplCopyWithImpl(
      _$ShowLastPredictionsClickedImpl _value,
      $Res Function(_$ShowLastPredictionsClickedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShowLastPredictionsClickedImpl implements ShowLastPredictionsClicked {
  const _$ShowLastPredictionsClickedImpl();

  @override
  String toString() {
    return 'TranslatorEvent.showLastPredictionsClicked()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowLastPredictionsClickedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String gesture) gestureRecognized,
    required TResult Function() switchCameraClicked,
    required TResult Function() backClicked,
    required TResult Function() showLastPredictionsClicked,
    required TResult Function() startProcessing,
  }) {
    return showLastPredictionsClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String gesture)? gestureRecognized,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? backClicked,
    TResult? Function()? showLastPredictionsClicked,
    TResult? Function()? startProcessing,
  }) {
    return showLastPredictionsClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String gesture)? gestureRecognized,
    TResult Function()? switchCameraClicked,
    TResult Function()? backClicked,
    TResult Function()? showLastPredictionsClicked,
    TResult Function()? startProcessing,
    required TResult orElse(),
  }) {
    if (showLastPredictionsClicked != null) {
      return showLastPredictionsClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(GestureRecognized value) gestureRecognized,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(ShowLastPredictionsClicked value)
        showLastPredictionsClicked,
    required TResult Function(StartProcessing value) startProcessing,
  }) {
    return showLastPredictionsClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(GestureRecognized value)? gestureRecognized,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(ShowLastPredictionsClicked value)?
        showLastPredictionsClicked,
    TResult? Function(StartProcessing value)? startProcessing,
  }) {
    return showLastPredictionsClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(GestureRecognized value)? gestureRecognized,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(ShowLastPredictionsClicked value)?
        showLastPredictionsClicked,
    TResult Function(StartProcessing value)? startProcessing,
    required TResult orElse(),
  }) {
    if (showLastPredictionsClicked != null) {
      return showLastPredictionsClicked(this);
    }
    return orElse();
  }
}

abstract class ShowLastPredictionsClicked implements TranslatorEvent {
  const factory ShowLastPredictionsClicked() = _$ShowLastPredictionsClickedImpl;
}

/// @nodoc
abstract class _$$StartProcessingImplCopyWith<$Res> {
  factory _$$StartProcessingImplCopyWith(_$StartProcessingImpl value,
          $Res Function(_$StartProcessingImpl) then) =
      __$$StartProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartProcessingImplCopyWithImpl<$Res>
    extends _$TranslatorEventCopyWithImpl<$Res, _$StartProcessingImpl>
    implements _$$StartProcessingImplCopyWith<$Res> {
  __$$StartProcessingImplCopyWithImpl(
      _$StartProcessingImpl _value, $Res Function(_$StartProcessingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartProcessingImpl implements StartProcessing {
  const _$StartProcessingImpl();

  @override
  String toString() {
    return 'TranslatorEvent.startProcessing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartProcessingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String gesture) gestureRecognized,
    required TResult Function() switchCameraClicked,
    required TResult Function() backClicked,
    required TResult Function() showLastPredictionsClicked,
    required TResult Function() startProcessing,
  }) {
    return startProcessing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String gesture)? gestureRecognized,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? backClicked,
    TResult? Function()? showLastPredictionsClicked,
    TResult? Function()? startProcessing,
  }) {
    return startProcessing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String gesture)? gestureRecognized,
    TResult Function()? switchCameraClicked,
    TResult Function()? backClicked,
    TResult Function()? showLastPredictionsClicked,
    TResult Function()? startProcessing,
    required TResult orElse(),
  }) {
    if (startProcessing != null) {
      return startProcessing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(GestureRecognized value) gestureRecognized,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(ShowLastPredictionsClicked value)
        showLastPredictionsClicked,
    required TResult Function(StartProcessing value) startProcessing,
  }) {
    return startProcessing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(GestureRecognized value)? gestureRecognized,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(ShowLastPredictionsClicked value)?
        showLastPredictionsClicked,
    TResult? Function(StartProcessing value)? startProcessing,
  }) {
    return startProcessing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(GestureRecognized value)? gestureRecognized,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(ShowLastPredictionsClicked value)?
        showLastPredictionsClicked,
    TResult Function(StartProcessing value)? startProcessing,
    required TResult orElse(),
  }) {
    if (startProcessing != null) {
      return startProcessing(this);
    }
    return orElse();
  }
}

abstract class StartProcessing implements TranslatorEvent {
  const factory StartProcessing() = _$StartProcessingImpl;
}
