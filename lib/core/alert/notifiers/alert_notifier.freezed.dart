// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'alert_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AlertStateTearOff {
  const _$AlertStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _SnackBarAlert snackbar(String message, [bool error = false]) {
    return _SnackBarAlert(
      message,
      error,
    );
  }
}

/// @nodoc
const $AlertState = _$AlertStateTearOff();

/// @nodoc
mixin _$AlertState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message, bool error) snackbar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message, bool error)? snackbar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message, bool error)? snackbar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SnackBarAlert value) snackbar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SnackBarAlert value)? snackbar,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SnackBarAlert value)? snackbar,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertStateCopyWith<$Res> {
  factory $AlertStateCopyWith(
          AlertState value, $Res Function(AlertState) then) =
      _$AlertStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AlertStateCopyWithImpl<$Res> implements $AlertStateCopyWith<$Res> {
  _$AlertStateCopyWithImpl(this._value, this._then);

  final AlertState _value;
  // ignore: unused_field
  final $Res Function(AlertState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$AlertStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlertState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AlertState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message, bool error) snackbar,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message, bool error)? snackbar,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message, bool error)? snackbar,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SnackBarAlert value) snackbar,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SnackBarAlert value)? snackbar,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SnackBarAlert value)? snackbar,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AlertState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$SnackBarAlertCopyWith<$Res> {
  factory _$SnackBarAlertCopyWith(
          _SnackBarAlert value, $Res Function(_SnackBarAlert) then) =
      __$SnackBarAlertCopyWithImpl<$Res>;
  $Res call({String message, bool error});
}

/// @nodoc
class __$SnackBarAlertCopyWithImpl<$Res> extends _$AlertStateCopyWithImpl<$Res>
    implements _$SnackBarAlertCopyWith<$Res> {
  __$SnackBarAlertCopyWithImpl(
      _SnackBarAlert _value, $Res Function(_SnackBarAlert) _then)
      : super(_value, (v) => _then(v as _SnackBarAlert));

  @override
  _SnackBarAlert get _value => super._value as _SnackBarAlert;

  @override
  $Res call({
    Object? message = freezed,
    Object? error = freezed,
  }) {
    return _then(_SnackBarAlert(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SnackBarAlert with DiagnosticableTreeMixin implements _SnackBarAlert {
  const _$_SnackBarAlert(this.message, [this.error = false]);

  @override
  final String message;
  @JsonKey()
  @override
  final bool error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AlertState.snackbar(message: $message, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AlertState.snackbar'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SnackBarAlert &&
            const DeepCollectionEquality().equals(other.message, message) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(message),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$SnackBarAlertCopyWith<_SnackBarAlert> get copyWith =>
      __$SnackBarAlertCopyWithImpl<_SnackBarAlert>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String message, bool error) snackbar,
  }) {
    return snackbar(message, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message, bool error)? snackbar,
  }) {
    return snackbar?.call(message, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String message, bool error)? snackbar,
    required TResult orElse(),
  }) {
    if (snackbar != null) {
      return snackbar(message, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SnackBarAlert value) snackbar,
  }) {
    return snackbar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SnackBarAlert value)? snackbar,
  }) {
    return snackbar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SnackBarAlert value)? snackbar,
    required TResult orElse(),
  }) {
    if (snackbar != null) {
      return snackbar(this);
    }
    return orElse();
  }
}

abstract class _SnackBarAlert implements AlertState {
  const factory _SnackBarAlert(String message, [bool error]) = _$_SnackBarAlert;

  String get message;
  bool get error;
  @JsonKey(ignore: true)
  _$SnackBarAlertCopyWith<_SnackBarAlert> get copyWith =>
      throw _privateConstructorUsedError;
}
