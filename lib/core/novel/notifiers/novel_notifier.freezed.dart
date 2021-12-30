// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'novel_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NovelStateTearOff {
  const _$NovelStateTearOff();

  FetchingNovelState fetching() {
    return const FetchingNovelState();
  }

  LoadedNovelState loaded() {
    return const LoadedNovelState();
  }

  ErrorNovelState error() {
    return const ErrorNovelState();
  }
}

/// @nodoc
const $NovelState = _$NovelStateTearOff();

/// @nodoc
mixin _$NovelState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetching,
    required TResult Function() loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetching,
    TResult Function()? loaded,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetching,
    TResult Function()? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchingNovelState value) fetching,
    required TResult Function(LoadedNovelState value) loaded,
    required TResult Function(ErrorNovelState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchingNovelState value)? fetching,
    TResult Function(LoadedNovelState value)? loaded,
    TResult Function(ErrorNovelState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchingNovelState value)? fetching,
    TResult Function(LoadedNovelState value)? loaded,
    TResult Function(ErrorNovelState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NovelStateCopyWith<$Res> {
  factory $NovelStateCopyWith(
          NovelState value, $Res Function(NovelState) then) =
      _$NovelStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NovelStateCopyWithImpl<$Res> implements $NovelStateCopyWith<$Res> {
  _$NovelStateCopyWithImpl(this._value, this._then);

  final NovelState _value;
  // ignore: unused_field
  final $Res Function(NovelState) _then;
}

/// @nodoc
abstract class $FetchingNovelStateCopyWith<$Res> {
  factory $FetchingNovelStateCopyWith(
          FetchingNovelState value, $Res Function(FetchingNovelState) then) =
      _$FetchingNovelStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$FetchingNovelStateCopyWithImpl<$Res>
    extends _$NovelStateCopyWithImpl<$Res>
    implements $FetchingNovelStateCopyWith<$Res> {
  _$FetchingNovelStateCopyWithImpl(
      FetchingNovelState _value, $Res Function(FetchingNovelState) _then)
      : super(_value, (v) => _then(v as FetchingNovelState));

  @override
  FetchingNovelState get _value => super._value as FetchingNovelState;
}

/// @nodoc

class _$FetchingNovelState implements FetchingNovelState {
  const _$FetchingNovelState();

  @override
  String toString() {
    return 'NovelState.fetching()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is FetchingNovelState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetching,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return fetching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetching,
    TResult Function()? loaded,
    TResult Function()? error,
  }) {
    return fetching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetching,
    TResult Function()? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchingNovelState value) fetching,
    required TResult Function(LoadedNovelState value) loaded,
    required TResult Function(ErrorNovelState value) error,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchingNovelState value)? fetching,
    TResult Function(LoadedNovelState value)? loaded,
    TResult Function(ErrorNovelState value)? error,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchingNovelState value)? fetching,
    TResult Function(LoadedNovelState value)? loaded,
    TResult Function(ErrorNovelState value)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class FetchingNovelState implements NovelState {
  const factory FetchingNovelState() = _$FetchingNovelState;
}

/// @nodoc
abstract class $LoadedNovelStateCopyWith<$Res> {
  factory $LoadedNovelStateCopyWith(
          LoadedNovelState value, $Res Function(LoadedNovelState) then) =
      _$LoadedNovelStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadedNovelStateCopyWithImpl<$Res>
    extends _$NovelStateCopyWithImpl<$Res>
    implements $LoadedNovelStateCopyWith<$Res> {
  _$LoadedNovelStateCopyWithImpl(
      LoadedNovelState _value, $Res Function(LoadedNovelState) _then)
      : super(_value, (v) => _then(v as LoadedNovelState));

  @override
  LoadedNovelState get _value => super._value as LoadedNovelState;
}

/// @nodoc

class _$LoadedNovelState implements LoadedNovelState {
  const _$LoadedNovelState();

  @override
  String toString() {
    return 'NovelState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadedNovelState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetching,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetching,
    TResult Function()? loaded,
    TResult Function()? error,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetching,
    TResult Function()? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchingNovelState value) fetching,
    required TResult Function(LoadedNovelState value) loaded,
    required TResult Function(ErrorNovelState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchingNovelState value)? fetching,
    TResult Function(LoadedNovelState value)? loaded,
    TResult Function(ErrorNovelState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchingNovelState value)? fetching,
    TResult Function(LoadedNovelState value)? loaded,
    TResult Function(ErrorNovelState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedNovelState implements NovelState {
  const factory LoadedNovelState() = _$LoadedNovelState;
}

/// @nodoc
abstract class $ErrorNovelStateCopyWith<$Res> {
  factory $ErrorNovelStateCopyWith(
          ErrorNovelState value, $Res Function(ErrorNovelState) then) =
      _$ErrorNovelStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ErrorNovelStateCopyWithImpl<$Res> extends _$NovelStateCopyWithImpl<$Res>
    implements $ErrorNovelStateCopyWith<$Res> {
  _$ErrorNovelStateCopyWithImpl(
      ErrorNovelState _value, $Res Function(ErrorNovelState) _then)
      : super(_value, (v) => _then(v as ErrorNovelState));

  @override
  ErrorNovelState get _value => super._value as ErrorNovelState;
}

/// @nodoc

class _$ErrorNovelState implements ErrorNovelState {
  const _$ErrorNovelState();

  @override
  String toString() {
    return 'NovelState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ErrorNovelState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetching,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetching,
    TResult Function()? loaded,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetching,
    TResult Function()? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchingNovelState value) fetching,
    required TResult Function(LoadedNovelState value) loaded,
    required TResult Function(ErrorNovelState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FetchingNovelState value)? fetching,
    TResult Function(LoadedNovelState value)? loaded,
    TResult Function(ErrorNovelState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchingNovelState value)? fetching,
    TResult Function(LoadedNovelState value)? loaded,
    TResult Function(ErrorNovelState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorNovelState implements NovelState {
  const factory ErrorNovelState() = _$ErrorNovelState;
}
