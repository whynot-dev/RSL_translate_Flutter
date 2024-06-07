// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LessonState {
  BlocAction? get action => throw _privateConstructorUsedError;
  LessonEntity get lesson => throw _privateConstructorUsedError;
  LessonType get selectedLessonType => throw _privateConstructorUsedError;
  CameraController? get cameraController => throw _privateConstructorUsedError;
  VideoPlayerController? get videoController =>
      throw _privateConstructorUsedError;
  bool get isStartingPractice => throw _privateConstructorUsedError;
  String? get prediction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LessonStateCopyWith<LessonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonStateCopyWith<$Res> {
  factory $LessonStateCopyWith(
          LessonState value, $Res Function(LessonState) then) =
      _$LessonStateCopyWithImpl<$Res, LessonState>;
  @useResult
  $Res call(
      {BlocAction? action,
      LessonEntity lesson,
      LessonType selectedLessonType,
      CameraController? cameraController,
      VideoPlayerController? videoController,
      bool isStartingPractice,
      String? prediction});
}

/// @nodoc
class _$LessonStateCopyWithImpl<$Res, $Val extends LessonState>
    implements $LessonStateCopyWith<$Res> {
  _$LessonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? lesson = null,
    Object? selectedLessonType = null,
    Object? cameraController = freezed,
    Object? videoController = freezed,
    Object? isStartingPractice = null,
    Object? prediction = freezed,
  }) {
    return _then(_value.copyWith(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      lesson: null == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as LessonEntity,
      selectedLessonType: null == selectedLessonType
          ? _value.selectedLessonType
          : selectedLessonType // ignore: cast_nullable_to_non_nullable
              as LessonType,
      cameraController: freezed == cameraController
          ? _value.cameraController
          : cameraController // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      videoController: freezed == videoController
          ? _value.videoController
          : videoController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController?,
      isStartingPractice: null == isStartingPractice
          ? _value.isStartingPractice
          : isStartingPractice // ignore: cast_nullable_to_non_nullable
              as bool,
      prediction: freezed == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonStateImplCopyWith<$Res>
    implements $LessonStateCopyWith<$Res> {
  factory _$$LessonStateImplCopyWith(
          _$LessonStateImpl value, $Res Function(_$LessonStateImpl) then) =
      __$$LessonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BlocAction? action,
      LessonEntity lesson,
      LessonType selectedLessonType,
      CameraController? cameraController,
      VideoPlayerController? videoController,
      bool isStartingPractice,
      String? prediction});
}

/// @nodoc
class __$$LessonStateImplCopyWithImpl<$Res>
    extends _$LessonStateCopyWithImpl<$Res, _$LessonStateImpl>
    implements _$$LessonStateImplCopyWith<$Res> {
  __$$LessonStateImplCopyWithImpl(
      _$LessonStateImpl _value, $Res Function(_$LessonStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? lesson = null,
    Object? selectedLessonType = null,
    Object? cameraController = freezed,
    Object? videoController = freezed,
    Object? isStartingPractice = null,
    Object? prediction = freezed,
  }) {
    return _then(_$LessonStateImpl(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      lesson: null == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as LessonEntity,
      selectedLessonType: null == selectedLessonType
          ? _value.selectedLessonType
          : selectedLessonType // ignore: cast_nullable_to_non_nullable
              as LessonType,
      cameraController: freezed == cameraController
          ? _value.cameraController
          : cameraController // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      videoController: freezed == videoController
          ? _value.videoController
          : videoController // ignore: cast_nullable_to_non_nullable
              as VideoPlayerController?,
      isStartingPractice: null == isStartingPractice
          ? _value.isStartingPractice
          : isStartingPractice // ignore: cast_nullable_to_non_nullable
              as bool,
      prediction: freezed == prediction
          ? _value.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LessonStateImpl with DiagnosticableTreeMixin implements _LessonState {
  _$LessonStateImpl(
      {this.action,
      required this.lesson,
      this.selectedLessonType = LessonType.theory,
      this.cameraController,
      this.videoController,
      this.isStartingPractice = false,
      this.prediction});

  @override
  final BlocAction? action;
  @override
  final LessonEntity lesson;
  @override
  @JsonKey()
  final LessonType selectedLessonType;
  @override
  final CameraController? cameraController;
  @override
  final VideoPlayerController? videoController;
  @override
  @JsonKey()
  final bool isStartingPractice;
  @override
  final String? prediction;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonState(action: $action, lesson: $lesson, selectedLessonType: $selectedLessonType, cameraController: $cameraController, videoController: $videoController, isStartingPractice: $isStartingPractice, prediction: $prediction)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonState'))
      ..add(DiagnosticsProperty('action', action))
      ..add(DiagnosticsProperty('lesson', lesson))
      ..add(DiagnosticsProperty('selectedLessonType', selectedLessonType))
      ..add(DiagnosticsProperty('cameraController', cameraController))
      ..add(DiagnosticsProperty('videoController', videoController))
      ..add(DiagnosticsProperty('isStartingPractice', isStartingPractice))
      ..add(DiagnosticsProperty('prediction', prediction));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonStateImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.lesson, lesson) || other.lesson == lesson) &&
            (identical(other.selectedLessonType, selectedLessonType) ||
                other.selectedLessonType == selectedLessonType) &&
            (identical(other.cameraController, cameraController) ||
                other.cameraController == cameraController) &&
            (identical(other.videoController, videoController) ||
                other.videoController == videoController) &&
            (identical(other.isStartingPractice, isStartingPractice) ||
                other.isStartingPractice == isStartingPractice) &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      action,
      lesson,
      selectedLessonType,
      cameraController,
      videoController,
      isStartingPractice,
      prediction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonStateImplCopyWith<_$LessonStateImpl> get copyWith =>
      __$$LessonStateImplCopyWithImpl<_$LessonStateImpl>(this, _$identity);
}

abstract class _LessonState implements LessonState {
  factory _LessonState(
      {final BlocAction? action,
      required final LessonEntity lesson,
      final LessonType selectedLessonType,
      final CameraController? cameraController,
      final VideoPlayerController? videoController,
      final bool isStartingPractice,
      final String? prediction}) = _$LessonStateImpl;

  @override
  BlocAction? get action;
  @override
  LessonEntity get lesson;
  @override
  LessonType get selectedLessonType;
  @override
  CameraController? get cameraController;
  @override
  VideoPlayerController? get videoController;
  @override
  bool get isStartingPractice;
  @override
  String? get prediction;
  @override
  @JsonKey(ignore: true)
  _$$LessonStateImplCopyWith<_$LessonStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LessonEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() backClicked,
    required TResult Function(LessonType lessonType) lessonTypeChanged,
    required TResult Function() switchCameraClicked,
    required TResult Function() startClicked,
    required TResult Function() stopClicked,
    required TResult Function(String gesture) gestureRecognized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? backClicked,
    TResult? Function(LessonType lessonType)? lessonTypeChanged,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? startClicked,
    TResult? Function()? stopClicked,
    TResult? Function(String gesture)? gestureRecognized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? backClicked,
    TResult Function(LessonType lessonType)? lessonTypeChanged,
    TResult Function()? switchCameraClicked,
    TResult Function()? startClicked,
    TResult Function()? stopClicked,
    TResult Function(String gesture)? gestureRecognized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(LessonTypeChanged value) lessonTypeChanged,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(StartClicked value) startClicked,
    required TResult Function(StopClicked value) stopClicked,
    required TResult Function(GestureRecognized value) gestureRecognized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(StartClicked value)? startClicked,
    TResult? Function(StopClicked value)? stopClicked,
    TResult? Function(GestureRecognized value)? gestureRecognized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(StartClicked value)? startClicked,
    TResult Function(StopClicked value)? stopClicked,
    TResult Function(GestureRecognized value)? gestureRecognized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonEventCopyWith<$Res> {
  factory $LessonEventCopyWith(
          LessonEvent value, $Res Function(LessonEvent) then) =
      _$LessonEventCopyWithImpl<$Res, LessonEvent>;
}

/// @nodoc
class _$LessonEventCopyWithImpl<$Res, $Val extends LessonEvent>
    implements $LessonEventCopyWith<$Res> {
  _$LessonEventCopyWithImpl(this._value, this._then);

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
    extends _$LessonEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl with DiagnosticableTreeMixin implements Init {
  const _$InitImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonEvent.init()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'LessonEvent.init'));
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
    required TResult Function() backClicked,
    required TResult Function(LessonType lessonType) lessonTypeChanged,
    required TResult Function() switchCameraClicked,
    required TResult Function() startClicked,
    required TResult Function() stopClicked,
    required TResult Function(String gesture) gestureRecognized,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? backClicked,
    TResult? Function(LessonType lessonType)? lessonTypeChanged,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? startClicked,
    TResult? Function()? stopClicked,
    TResult? Function(String gesture)? gestureRecognized,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? backClicked,
    TResult Function(LessonType lessonType)? lessonTypeChanged,
    TResult Function()? switchCameraClicked,
    TResult Function()? startClicked,
    TResult Function()? stopClicked,
    TResult Function(String gesture)? gestureRecognized,
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
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(LessonTypeChanged value) lessonTypeChanged,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(StartClicked value) startClicked,
    required TResult Function(StopClicked value) stopClicked,
    required TResult Function(GestureRecognized value) gestureRecognized,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(StartClicked value)? startClicked,
    TResult? Function(StopClicked value)? stopClicked,
    TResult? Function(GestureRecognized value)? gestureRecognized,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(StartClicked value)? startClicked,
    TResult Function(StopClicked value)? stopClicked,
    TResult Function(GestureRecognized value)? gestureRecognized,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements LessonEvent {
  const factory Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$BackClickedImplCopyWith<$Res> {
  factory _$$BackClickedImplCopyWith(
          _$BackClickedImpl value, $Res Function(_$BackClickedImpl) then) =
      __$$BackClickedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BackClickedImplCopyWithImpl<$Res>
    extends _$LessonEventCopyWithImpl<$Res, _$BackClickedImpl>
    implements _$$BackClickedImplCopyWith<$Res> {
  __$$BackClickedImplCopyWithImpl(
      _$BackClickedImpl _value, $Res Function(_$BackClickedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BackClickedImpl with DiagnosticableTreeMixin implements BackClicked {
  const _$BackClickedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonEvent.backClicked()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'LessonEvent.backClicked'));
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
    required TResult Function() backClicked,
    required TResult Function(LessonType lessonType) lessonTypeChanged,
    required TResult Function() switchCameraClicked,
    required TResult Function() startClicked,
    required TResult Function() stopClicked,
    required TResult Function(String gesture) gestureRecognized,
  }) {
    return backClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? backClicked,
    TResult? Function(LessonType lessonType)? lessonTypeChanged,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? startClicked,
    TResult? Function()? stopClicked,
    TResult? Function(String gesture)? gestureRecognized,
  }) {
    return backClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? backClicked,
    TResult Function(LessonType lessonType)? lessonTypeChanged,
    TResult Function()? switchCameraClicked,
    TResult Function()? startClicked,
    TResult Function()? stopClicked,
    TResult Function(String gesture)? gestureRecognized,
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
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(LessonTypeChanged value) lessonTypeChanged,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(StartClicked value) startClicked,
    required TResult Function(StopClicked value) stopClicked,
    required TResult Function(GestureRecognized value) gestureRecognized,
  }) {
    return backClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(StartClicked value)? startClicked,
    TResult? Function(StopClicked value)? stopClicked,
    TResult? Function(GestureRecognized value)? gestureRecognized,
  }) {
    return backClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(StartClicked value)? startClicked,
    TResult Function(StopClicked value)? stopClicked,
    TResult Function(GestureRecognized value)? gestureRecognized,
    required TResult orElse(),
  }) {
    if (backClicked != null) {
      return backClicked(this);
    }
    return orElse();
  }
}

abstract class BackClicked implements LessonEvent {
  const factory BackClicked() = _$BackClickedImpl;
}

/// @nodoc
abstract class _$$LessonTypeChangedImplCopyWith<$Res> {
  factory _$$LessonTypeChangedImplCopyWith(_$LessonTypeChangedImpl value,
          $Res Function(_$LessonTypeChangedImpl) then) =
      __$$LessonTypeChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LessonType lessonType});
}

/// @nodoc
class __$$LessonTypeChangedImplCopyWithImpl<$Res>
    extends _$LessonEventCopyWithImpl<$Res, _$LessonTypeChangedImpl>
    implements _$$LessonTypeChangedImplCopyWith<$Res> {
  __$$LessonTypeChangedImplCopyWithImpl(_$LessonTypeChangedImpl _value,
      $Res Function(_$LessonTypeChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lessonType = null,
  }) {
    return _then(_$LessonTypeChangedImpl(
      null == lessonType
          ? _value.lessonType
          : lessonType // ignore: cast_nullable_to_non_nullable
              as LessonType,
    ));
  }
}

/// @nodoc

class _$LessonTypeChangedImpl
    with DiagnosticableTreeMixin
    implements LessonTypeChanged {
  const _$LessonTypeChangedImpl(this.lessonType);

  @override
  final LessonType lessonType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonEvent.lessonTypeChanged(lessonType: $lessonType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonEvent.lessonTypeChanged'))
      ..add(DiagnosticsProperty('lessonType', lessonType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonTypeChangedImpl &&
            (identical(other.lessonType, lessonType) ||
                other.lessonType == lessonType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lessonType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonTypeChangedImplCopyWith<_$LessonTypeChangedImpl> get copyWith =>
      __$$LessonTypeChangedImplCopyWithImpl<_$LessonTypeChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() backClicked,
    required TResult Function(LessonType lessonType) lessonTypeChanged,
    required TResult Function() switchCameraClicked,
    required TResult Function() startClicked,
    required TResult Function() stopClicked,
    required TResult Function(String gesture) gestureRecognized,
  }) {
    return lessonTypeChanged(lessonType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? backClicked,
    TResult? Function(LessonType lessonType)? lessonTypeChanged,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? startClicked,
    TResult? Function()? stopClicked,
    TResult? Function(String gesture)? gestureRecognized,
  }) {
    return lessonTypeChanged?.call(lessonType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? backClicked,
    TResult Function(LessonType lessonType)? lessonTypeChanged,
    TResult Function()? switchCameraClicked,
    TResult Function()? startClicked,
    TResult Function()? stopClicked,
    TResult Function(String gesture)? gestureRecognized,
    required TResult orElse(),
  }) {
    if (lessonTypeChanged != null) {
      return lessonTypeChanged(lessonType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(LessonTypeChanged value) lessonTypeChanged,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(StartClicked value) startClicked,
    required TResult Function(StopClicked value) stopClicked,
    required TResult Function(GestureRecognized value) gestureRecognized,
  }) {
    return lessonTypeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(StartClicked value)? startClicked,
    TResult? Function(StopClicked value)? stopClicked,
    TResult? Function(GestureRecognized value)? gestureRecognized,
  }) {
    return lessonTypeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(StartClicked value)? startClicked,
    TResult Function(StopClicked value)? stopClicked,
    TResult Function(GestureRecognized value)? gestureRecognized,
    required TResult orElse(),
  }) {
    if (lessonTypeChanged != null) {
      return lessonTypeChanged(this);
    }
    return orElse();
  }
}

abstract class LessonTypeChanged implements LessonEvent {
  const factory LessonTypeChanged(final LessonType lessonType) =
      _$LessonTypeChangedImpl;

  LessonType get lessonType;
  @JsonKey(ignore: true)
  _$$LessonTypeChangedImplCopyWith<_$LessonTypeChangedImpl> get copyWith =>
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
    extends _$LessonEventCopyWithImpl<$Res, _$SwitchCameraClickedImpl>
    implements _$$SwitchCameraClickedImplCopyWith<$Res> {
  __$$SwitchCameraClickedImplCopyWithImpl(_$SwitchCameraClickedImpl _value,
      $Res Function(_$SwitchCameraClickedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SwitchCameraClickedImpl
    with DiagnosticableTreeMixin
    implements SwitchCameraClicked {
  const _$SwitchCameraClickedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonEvent.switchCameraClicked()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty('type', 'LessonEvent.switchCameraClicked'));
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
    required TResult Function() backClicked,
    required TResult Function(LessonType lessonType) lessonTypeChanged,
    required TResult Function() switchCameraClicked,
    required TResult Function() startClicked,
    required TResult Function() stopClicked,
    required TResult Function(String gesture) gestureRecognized,
  }) {
    return switchCameraClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? backClicked,
    TResult? Function(LessonType lessonType)? lessonTypeChanged,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? startClicked,
    TResult? Function()? stopClicked,
    TResult? Function(String gesture)? gestureRecognized,
  }) {
    return switchCameraClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? backClicked,
    TResult Function(LessonType lessonType)? lessonTypeChanged,
    TResult Function()? switchCameraClicked,
    TResult Function()? startClicked,
    TResult Function()? stopClicked,
    TResult Function(String gesture)? gestureRecognized,
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
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(LessonTypeChanged value) lessonTypeChanged,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(StartClicked value) startClicked,
    required TResult Function(StopClicked value) stopClicked,
    required TResult Function(GestureRecognized value) gestureRecognized,
  }) {
    return switchCameraClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(StartClicked value)? startClicked,
    TResult? Function(StopClicked value)? stopClicked,
    TResult? Function(GestureRecognized value)? gestureRecognized,
  }) {
    return switchCameraClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(StartClicked value)? startClicked,
    TResult Function(StopClicked value)? stopClicked,
    TResult Function(GestureRecognized value)? gestureRecognized,
    required TResult orElse(),
  }) {
    if (switchCameraClicked != null) {
      return switchCameraClicked(this);
    }
    return orElse();
  }
}

abstract class SwitchCameraClicked implements LessonEvent {
  const factory SwitchCameraClicked() = _$SwitchCameraClickedImpl;
}

/// @nodoc
abstract class _$$StartClickedImplCopyWith<$Res> {
  factory _$$StartClickedImplCopyWith(
          _$StartClickedImpl value, $Res Function(_$StartClickedImpl) then) =
      __$$StartClickedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartClickedImplCopyWithImpl<$Res>
    extends _$LessonEventCopyWithImpl<$Res, _$StartClickedImpl>
    implements _$$StartClickedImplCopyWith<$Res> {
  __$$StartClickedImplCopyWithImpl(
      _$StartClickedImpl _value, $Res Function(_$StartClickedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartClickedImpl with DiagnosticableTreeMixin implements StartClicked {
  const _$StartClickedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonEvent.startClicked()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'LessonEvent.startClicked'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartClickedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() backClicked,
    required TResult Function(LessonType lessonType) lessonTypeChanged,
    required TResult Function() switchCameraClicked,
    required TResult Function() startClicked,
    required TResult Function() stopClicked,
    required TResult Function(String gesture) gestureRecognized,
  }) {
    return startClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? backClicked,
    TResult? Function(LessonType lessonType)? lessonTypeChanged,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? startClicked,
    TResult? Function()? stopClicked,
    TResult? Function(String gesture)? gestureRecognized,
  }) {
    return startClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? backClicked,
    TResult Function(LessonType lessonType)? lessonTypeChanged,
    TResult Function()? switchCameraClicked,
    TResult Function()? startClicked,
    TResult Function()? stopClicked,
    TResult Function(String gesture)? gestureRecognized,
    required TResult orElse(),
  }) {
    if (startClicked != null) {
      return startClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(LessonTypeChanged value) lessonTypeChanged,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(StartClicked value) startClicked,
    required TResult Function(StopClicked value) stopClicked,
    required TResult Function(GestureRecognized value) gestureRecognized,
  }) {
    return startClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(StartClicked value)? startClicked,
    TResult? Function(StopClicked value)? stopClicked,
    TResult? Function(GestureRecognized value)? gestureRecognized,
  }) {
    return startClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(StartClicked value)? startClicked,
    TResult Function(StopClicked value)? stopClicked,
    TResult Function(GestureRecognized value)? gestureRecognized,
    required TResult orElse(),
  }) {
    if (startClicked != null) {
      return startClicked(this);
    }
    return orElse();
  }
}

abstract class StartClicked implements LessonEvent {
  const factory StartClicked() = _$StartClickedImpl;
}

/// @nodoc
abstract class _$$StopClickedImplCopyWith<$Res> {
  factory _$$StopClickedImplCopyWith(
          _$StopClickedImpl value, $Res Function(_$StopClickedImpl) then) =
      __$$StopClickedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopClickedImplCopyWithImpl<$Res>
    extends _$LessonEventCopyWithImpl<$Res, _$StopClickedImpl>
    implements _$$StopClickedImplCopyWith<$Res> {
  __$$StopClickedImplCopyWithImpl(
      _$StopClickedImpl _value, $Res Function(_$StopClickedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StopClickedImpl with DiagnosticableTreeMixin implements StopClicked {
  const _$StopClickedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonEvent.stopClicked()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'LessonEvent.stopClicked'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StopClickedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() backClicked,
    required TResult Function(LessonType lessonType) lessonTypeChanged,
    required TResult Function() switchCameraClicked,
    required TResult Function() startClicked,
    required TResult Function() stopClicked,
    required TResult Function(String gesture) gestureRecognized,
  }) {
    return stopClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? backClicked,
    TResult? Function(LessonType lessonType)? lessonTypeChanged,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? startClicked,
    TResult? Function()? stopClicked,
    TResult? Function(String gesture)? gestureRecognized,
  }) {
    return stopClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? backClicked,
    TResult Function(LessonType lessonType)? lessonTypeChanged,
    TResult Function()? switchCameraClicked,
    TResult Function()? startClicked,
    TResult Function()? stopClicked,
    TResult Function(String gesture)? gestureRecognized,
    required TResult orElse(),
  }) {
    if (stopClicked != null) {
      return stopClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(LessonTypeChanged value) lessonTypeChanged,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(StartClicked value) startClicked,
    required TResult Function(StopClicked value) stopClicked,
    required TResult Function(GestureRecognized value) gestureRecognized,
  }) {
    return stopClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(StartClicked value)? startClicked,
    TResult? Function(StopClicked value)? stopClicked,
    TResult? Function(GestureRecognized value)? gestureRecognized,
  }) {
    return stopClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(StartClicked value)? startClicked,
    TResult Function(StopClicked value)? stopClicked,
    TResult Function(GestureRecognized value)? gestureRecognized,
    required TResult orElse(),
  }) {
    if (stopClicked != null) {
      return stopClicked(this);
    }
    return orElse();
  }
}

abstract class StopClicked implements LessonEvent {
  const factory StopClicked() = _$StopClickedImpl;
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
    extends _$LessonEventCopyWithImpl<$Res, _$GestureRecognizedImpl>
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

class _$GestureRecognizedImpl
    with DiagnosticableTreeMixin
    implements GestureRecognized {
  const _$GestureRecognizedImpl(this.gesture);

  @override
  final String gesture;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonEvent.gestureRecognized(gesture: $gesture)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonEvent.gestureRecognized'))
      ..add(DiagnosticsProperty('gesture', gesture));
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
    required TResult Function() backClicked,
    required TResult Function(LessonType lessonType) lessonTypeChanged,
    required TResult Function() switchCameraClicked,
    required TResult Function() startClicked,
    required TResult Function() stopClicked,
    required TResult Function(String gesture) gestureRecognized,
  }) {
    return gestureRecognized(gesture);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? backClicked,
    TResult? Function(LessonType lessonType)? lessonTypeChanged,
    TResult? Function()? switchCameraClicked,
    TResult? Function()? startClicked,
    TResult? Function()? stopClicked,
    TResult? Function(String gesture)? gestureRecognized,
  }) {
    return gestureRecognized?.call(gesture);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? backClicked,
    TResult Function(LessonType lessonType)? lessonTypeChanged,
    TResult Function()? switchCameraClicked,
    TResult Function()? startClicked,
    TResult Function()? stopClicked,
    TResult Function(String gesture)? gestureRecognized,
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
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(LessonTypeChanged value) lessonTypeChanged,
    required TResult Function(SwitchCameraClicked value) switchCameraClicked,
    required TResult Function(StartClicked value) startClicked,
    required TResult Function(StopClicked value) stopClicked,
    required TResult Function(GestureRecognized value) gestureRecognized,
  }) {
    return gestureRecognized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult? Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult? Function(StartClicked value)? startClicked,
    TResult? Function(StopClicked value)? stopClicked,
    TResult? Function(GestureRecognized value)? gestureRecognized,
  }) {
    return gestureRecognized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(LessonTypeChanged value)? lessonTypeChanged,
    TResult Function(SwitchCameraClicked value)? switchCameraClicked,
    TResult Function(StartClicked value)? startClicked,
    TResult Function(StopClicked value)? stopClicked,
    TResult Function(GestureRecognized value)? gestureRecognized,
    required TResult orElse(),
  }) {
    if (gestureRecognized != null) {
      return gestureRecognized(this);
    }
    return orElse();
  }
}

abstract class GestureRecognized implements LessonEvent {
  const factory GestureRecognized(final String gesture) =
      _$GestureRecognizedImpl;

  String get gesture;
  @JsonKey(ignore: true)
  _$$GestureRecognizedImplCopyWith<_$GestureRecognizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
