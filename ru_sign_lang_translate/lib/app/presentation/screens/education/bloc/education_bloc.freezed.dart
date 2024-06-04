// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EducationState {
  BlocAction? get action => throw _privateConstructorUsedError;
  List<LessonEntity> get lessons => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EducationStateCopyWith<EducationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationStateCopyWith<$Res> {
  factory $EducationStateCopyWith(
          EducationState value, $Res Function(EducationState) then) =
      _$EducationStateCopyWithImpl<$Res, EducationState>;
  @useResult
  $Res call({BlocAction? action, List<LessonEntity> lessons});
}

/// @nodoc
class _$EducationStateCopyWithImpl<$Res, $Val extends EducationState>
    implements $EducationStateCopyWith<$Res> {
  _$EducationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? lessons = null,
  }) {
    return _then(_value.copyWith(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      lessons: null == lessons
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<LessonEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EducationStateImplCopyWith<$Res>
    implements $EducationStateCopyWith<$Res> {
  factory _$$EducationStateImplCopyWith(_$EducationStateImpl value,
          $Res Function(_$EducationStateImpl) then) =
      __$$EducationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BlocAction? action, List<LessonEntity> lessons});
}

/// @nodoc
class __$$EducationStateImplCopyWithImpl<$Res>
    extends _$EducationStateCopyWithImpl<$Res, _$EducationStateImpl>
    implements _$$EducationStateImplCopyWith<$Res> {
  __$$EducationStateImplCopyWithImpl(
      _$EducationStateImpl _value, $Res Function(_$EducationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? lessons = null,
  }) {
    return _then(_$EducationStateImpl(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      lessons: null == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<LessonEntity>,
    ));
  }
}

/// @nodoc

class _$EducationStateImpl implements _EducationState {
  _$EducationStateImpl(
      {this.action, final List<LessonEntity> lessons = const []})
      : _lessons = lessons;

  @override
  final BlocAction? action;
  final List<LessonEntity> _lessons;
  @override
  @JsonKey()
  List<LessonEntity> get lessons {
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessons);
  }

  @override
  String toString() {
    return 'EducationState(action: $action, lessons: $lessons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EducationStateImpl &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, action, const DeepCollectionEquality().hash(_lessons));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EducationStateImplCopyWith<_$EducationStateImpl> get copyWith =>
      __$$EducationStateImplCopyWithImpl<_$EducationStateImpl>(
          this, _$identity);
}

abstract class _EducationState implements EducationState {
  factory _EducationState(
      {final BlocAction? action,
      final List<LessonEntity> lessons}) = _$EducationStateImpl;

  @override
  BlocAction? get action;
  @override
  List<LessonEntity> get lessons;
  @override
  @JsonKey(ignore: true)
  _$$EducationStateImplCopyWith<_$EducationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EducationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() backClicked,
    required TResult Function(LessonEntity lesson) lessonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? backClicked,
    TResult? Function(LessonEntity lesson)? lessonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? backClicked,
    TResult Function(LessonEntity lesson)? lessonClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(LessonClicked value) lessonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(LessonClicked value)? lessonClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(LessonClicked value)? lessonClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationEventCopyWith<$Res> {
  factory $EducationEventCopyWith(
          EducationEvent value, $Res Function(EducationEvent) then) =
      _$EducationEventCopyWithImpl<$Res, EducationEvent>;
}

/// @nodoc
class _$EducationEventCopyWithImpl<$Res, $Val extends EducationEvent>
    implements $EducationEventCopyWith<$Res> {
  _$EducationEventCopyWithImpl(this._value, this._then);

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
    extends _$EducationEventCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'EducationEvent.init()';
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
    required TResult Function(LessonEntity lesson) lessonClicked,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? backClicked,
    TResult? Function(LessonEntity lesson)? lessonClicked,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? backClicked,
    TResult Function(LessonEntity lesson)? lessonClicked,
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
    required TResult Function(LessonClicked value) lessonClicked,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(LessonClicked value)? lessonClicked,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(LessonClicked value)? lessonClicked,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements EducationEvent {
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
    extends _$EducationEventCopyWithImpl<$Res, _$BackClickedImpl>
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
    return 'EducationEvent.backClicked()';
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
    required TResult Function(LessonEntity lesson) lessonClicked,
  }) {
    return backClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? backClicked,
    TResult? Function(LessonEntity lesson)? lessonClicked,
  }) {
    return backClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? backClicked,
    TResult Function(LessonEntity lesson)? lessonClicked,
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
    required TResult Function(LessonClicked value) lessonClicked,
  }) {
    return backClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(LessonClicked value)? lessonClicked,
  }) {
    return backClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(LessonClicked value)? lessonClicked,
    required TResult orElse(),
  }) {
    if (backClicked != null) {
      return backClicked(this);
    }
    return orElse();
  }
}

abstract class BackClicked implements EducationEvent {
  const factory BackClicked() = _$BackClickedImpl;
}

/// @nodoc
abstract class _$$LessonClickedImplCopyWith<$Res> {
  factory _$$LessonClickedImplCopyWith(
          _$LessonClickedImpl value, $Res Function(_$LessonClickedImpl) then) =
      __$$LessonClickedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LessonEntity lesson});
}

/// @nodoc
class __$$LessonClickedImplCopyWithImpl<$Res>
    extends _$EducationEventCopyWithImpl<$Res, _$LessonClickedImpl>
    implements _$$LessonClickedImplCopyWith<$Res> {
  __$$LessonClickedImplCopyWithImpl(
      _$LessonClickedImpl _value, $Res Function(_$LessonClickedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lesson = null,
  }) {
    return _then(_$LessonClickedImpl(
      null == lesson
          ? _value.lesson
          : lesson // ignore: cast_nullable_to_non_nullable
              as LessonEntity,
    ));
  }
}

/// @nodoc

class _$LessonClickedImpl implements LessonClicked {
  const _$LessonClickedImpl(this.lesson);

  @override
  final LessonEntity lesson;

  @override
  String toString() {
    return 'EducationEvent.lessonClicked(lesson: $lesson)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonClickedImpl &&
            (identical(other.lesson, lesson) || other.lesson == lesson));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lesson);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonClickedImplCopyWith<_$LessonClickedImpl> get copyWith =>
      __$$LessonClickedImplCopyWithImpl<_$LessonClickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() backClicked,
    required TResult Function(LessonEntity lesson) lessonClicked,
  }) {
    return lessonClicked(lesson);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? backClicked,
    TResult? Function(LessonEntity lesson)? lessonClicked,
  }) {
    return lessonClicked?.call(lesson);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? backClicked,
    TResult Function(LessonEntity lesson)? lessonClicked,
    required TResult orElse(),
  }) {
    if (lessonClicked != null) {
      return lessonClicked(lesson);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(LessonClicked value) lessonClicked,
  }) {
    return lessonClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(BackClicked value)? backClicked,
    TResult? Function(LessonClicked value)? lessonClicked,
  }) {
    return lessonClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(LessonClicked value)? lessonClicked,
    required TResult orElse(),
  }) {
    if (lessonClicked != null) {
      return lessonClicked(this);
    }
    return orElse();
  }
}

abstract class LessonClicked implements EducationEvent {
  const factory LessonClicked(final LessonEntity lesson) = _$LessonClickedImpl;

  LessonEntity get lesson;
  @JsonKey(ignore: true)
  _$$LessonClickedImplCopyWith<_$LessonClickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
