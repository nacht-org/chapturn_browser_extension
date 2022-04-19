// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'download_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DownloadControllerStateTearOff {
  const _$DownloadControllerStateTearOff();

  DownloadControllerIdle idle() {
    return const DownloadControllerIdle();
  }

  ControllerInProgress inProgress() {
    return const ControllerInProgress();
  }
}

/// @nodoc
const $DownloadControllerState = _$DownloadControllerStateTearOff();

/// @nodoc
mixin _$DownloadControllerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadControllerIdle value) idle,
    required TResult Function(ControllerInProgress value) inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DownloadControllerIdle value)? idle,
    TResult Function(ControllerInProgress value)? inProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadControllerIdle value)? idle,
    TResult Function(ControllerInProgress value)? inProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadControllerStateCopyWith<$Res> {
  factory $DownloadControllerStateCopyWith(DownloadControllerState value,
          $Res Function(DownloadControllerState) then) =
      _$DownloadControllerStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DownloadControllerStateCopyWithImpl<$Res>
    implements $DownloadControllerStateCopyWith<$Res> {
  _$DownloadControllerStateCopyWithImpl(this._value, this._then);

  final DownloadControllerState _value;
  // ignore: unused_field
  final $Res Function(DownloadControllerState) _then;
}

/// @nodoc
abstract class $DownloadControllerIdleCopyWith<$Res> {
  factory $DownloadControllerIdleCopyWith(DownloadControllerIdle value,
          $Res Function(DownloadControllerIdle) then) =
      _$DownloadControllerIdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$DownloadControllerIdleCopyWithImpl<$Res>
    extends _$DownloadControllerStateCopyWithImpl<$Res>
    implements $DownloadControllerIdleCopyWith<$Res> {
  _$DownloadControllerIdleCopyWithImpl(DownloadControllerIdle _value,
      $Res Function(DownloadControllerIdle) _then)
      : super(_value, (v) => _then(v as DownloadControllerIdle));

  @override
  DownloadControllerIdle get _value => super._value as DownloadControllerIdle;
}

/// @nodoc

class _$DownloadControllerIdle implements DownloadControllerIdle {
  const _$DownloadControllerIdle();

  @override
  String toString() {
    return 'DownloadControllerState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DownloadControllerIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() inProgress,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadControllerIdle value) idle,
    required TResult Function(ControllerInProgress value) inProgress,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DownloadControllerIdle value)? idle,
    TResult Function(ControllerInProgress value)? inProgress,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadControllerIdle value)? idle,
    TResult Function(ControllerInProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class DownloadControllerIdle implements DownloadControllerState {
  const factory DownloadControllerIdle() = _$DownloadControllerIdle;
}

/// @nodoc
abstract class $ControllerInProgressCopyWith<$Res> {
  factory $ControllerInProgressCopyWith(ControllerInProgress value,
          $Res Function(ControllerInProgress) then) =
      _$ControllerInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$ControllerInProgressCopyWithImpl<$Res>
    extends _$DownloadControllerStateCopyWithImpl<$Res>
    implements $ControllerInProgressCopyWith<$Res> {
  _$ControllerInProgressCopyWithImpl(
      ControllerInProgress _value, $Res Function(ControllerInProgress) _then)
      : super(_value, (v) => _then(v as ControllerInProgress));

  @override
  ControllerInProgress get _value => super._value as ControllerInProgress;
}

/// @nodoc

class _$ControllerInProgress implements ControllerInProgress {
  const _$ControllerInProgress();

  @override
  String toString() {
    return 'DownloadControllerState.inProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ControllerInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() inProgress,
  }) {
    return inProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
  }) {
    return inProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? inProgress,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadControllerIdle value) idle,
    required TResult Function(ControllerInProgress value) inProgress,
  }) {
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DownloadControllerIdle value)? idle,
    TResult Function(ControllerInProgress value)? inProgress,
  }) {
    return inProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadControllerIdle value)? idle,
    TResult Function(ControllerInProgress value)? inProgress,
    required TResult orElse(),
  }) {
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class ControllerInProgress implements DownloadControllerState {
  const factory ControllerInProgress() = _$ControllerInProgress;
}

/// @nodoc
class _$ChapterDownloadStateTearOff {
  const _$ChapterDownloadStateTearOff();

  ChapterDownloadSkip skip() {
    return const ChapterDownloadSkip();
  }

  ChapterDownloadPending pending() {
    return const ChapterDownloadPending();
  }

  ChapterDownloading downloading() {
    return const ChapterDownloading();
  }

  ChapterDownloadComplete complete() {
    return const ChapterDownloadComplete();
  }

  ChapterDownloadError error(String reason) {
    return ChapterDownloadError(
      reason,
    );
  }
}

/// @nodoc
const $ChapterDownloadState = _$ChapterDownloadStateTearOff();

/// @nodoc
mixin _$ChapterDownloadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() skip,
    required TResult Function() pending,
    required TResult Function() downloading,
    required TResult Function() complete,
    required TResult Function(String reason) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? skip,
    TResult Function()? pending,
    TResult Function()? downloading,
    TResult Function()? complete,
    TResult Function(String reason)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? skip,
    TResult Function()? pending,
    TResult Function()? downloading,
    TResult Function()? complete,
    TResult Function(String reason)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChapterDownloadSkip value) skip,
    required TResult Function(ChapterDownloadPending value) pending,
    required TResult Function(ChapterDownloading value) downloading,
    required TResult Function(ChapterDownloadComplete value) complete,
    required TResult Function(ChapterDownloadError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChapterDownloadSkip value)? skip,
    TResult Function(ChapterDownloadPending value)? pending,
    TResult Function(ChapterDownloading value)? downloading,
    TResult Function(ChapterDownloadComplete value)? complete,
    TResult Function(ChapterDownloadError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChapterDownloadSkip value)? skip,
    TResult Function(ChapterDownloadPending value)? pending,
    TResult Function(ChapterDownloading value)? downloading,
    TResult Function(ChapterDownloadComplete value)? complete,
    TResult Function(ChapterDownloadError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterDownloadStateCopyWith<$Res> {
  factory $ChapterDownloadStateCopyWith(ChapterDownloadState value,
          $Res Function(ChapterDownloadState) then) =
      _$ChapterDownloadStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChapterDownloadStateCopyWithImpl<$Res>
    implements $ChapterDownloadStateCopyWith<$Res> {
  _$ChapterDownloadStateCopyWithImpl(this._value, this._then);

  final ChapterDownloadState _value;
  // ignore: unused_field
  final $Res Function(ChapterDownloadState) _then;
}

/// @nodoc
abstract class $ChapterDownloadSkipCopyWith<$Res> {
  factory $ChapterDownloadSkipCopyWith(
          ChapterDownloadSkip value, $Res Function(ChapterDownloadSkip) then) =
      _$ChapterDownloadSkipCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChapterDownloadSkipCopyWithImpl<$Res>
    extends _$ChapterDownloadStateCopyWithImpl<$Res>
    implements $ChapterDownloadSkipCopyWith<$Res> {
  _$ChapterDownloadSkipCopyWithImpl(
      ChapterDownloadSkip _value, $Res Function(ChapterDownloadSkip) _then)
      : super(_value, (v) => _then(v as ChapterDownloadSkip));

  @override
  ChapterDownloadSkip get _value => super._value as ChapterDownloadSkip;
}

/// @nodoc

class _$ChapterDownloadSkip implements ChapterDownloadSkip {
  const _$ChapterDownloadSkip();

  @override
  String toString() {
    return 'ChapterDownloadState.skip()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChapterDownloadSkip);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() skip,
    required TResult Function() pending,
    required TResult Function() downloading,
    required TResult Function() complete,
    required TResult Function(String reason) error,
  }) {
    return skip();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? skip,
    TResult Function()? pending,
    TResult Function()? downloading,
    TResult Function()? complete,
    TResult Function(String reason)? error,
  }) {
    return skip?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? skip,
    TResult Function()? pending,
    TResult Function()? downloading,
    TResult Function()? complete,
    TResult Function(String reason)? error,
    required TResult orElse(),
  }) {
    if (skip != null) {
      return skip();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChapterDownloadSkip value) skip,
    required TResult Function(ChapterDownloadPending value) pending,
    required TResult Function(ChapterDownloading value) downloading,
    required TResult Function(ChapterDownloadComplete value) complete,
    required TResult Function(ChapterDownloadError value) error,
  }) {
    return skip(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChapterDownloadSkip value)? skip,
    TResult Function(ChapterDownloadPending value)? pending,
    TResult Function(ChapterDownloading value)? downloading,
    TResult Function(ChapterDownloadComplete value)? complete,
    TResult Function(ChapterDownloadError value)? error,
  }) {
    return skip?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChapterDownloadSkip value)? skip,
    TResult Function(ChapterDownloadPending value)? pending,
    TResult Function(ChapterDownloading value)? downloading,
    TResult Function(ChapterDownloadComplete value)? complete,
    TResult Function(ChapterDownloadError value)? error,
    required TResult orElse(),
  }) {
    if (skip != null) {
      return skip(this);
    }
    return orElse();
  }
}

abstract class ChapterDownloadSkip implements ChapterDownloadState {
  const factory ChapterDownloadSkip() = _$ChapterDownloadSkip;
}

/// @nodoc
abstract class $ChapterDownloadPendingCopyWith<$Res> {
  factory $ChapterDownloadPendingCopyWith(ChapterDownloadPending value,
          $Res Function(ChapterDownloadPending) then) =
      _$ChapterDownloadPendingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChapterDownloadPendingCopyWithImpl<$Res>
    extends _$ChapterDownloadStateCopyWithImpl<$Res>
    implements $ChapterDownloadPendingCopyWith<$Res> {
  _$ChapterDownloadPendingCopyWithImpl(ChapterDownloadPending _value,
      $Res Function(ChapterDownloadPending) _then)
      : super(_value, (v) => _then(v as ChapterDownloadPending));

  @override
  ChapterDownloadPending get _value => super._value as ChapterDownloadPending;
}

/// @nodoc

class _$ChapterDownloadPending implements ChapterDownloadPending {
  const _$ChapterDownloadPending();

  @override
  String toString() {
    return 'ChapterDownloadState.pending()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChapterDownloadPending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() skip,
    required TResult Function() pending,
    required TResult Function() downloading,
    required TResult Function() complete,
    required TResult Function(String reason) error,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? skip,
    TResult Function()? pending,
    TResult Function()? downloading,
    TResult Function()? complete,
    TResult Function(String reason)? error,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? skip,
    TResult Function()? pending,
    TResult Function()? downloading,
    TResult Function()? complete,
    TResult Function(String reason)? error,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChapterDownloadSkip value) skip,
    required TResult Function(ChapterDownloadPending value) pending,
    required TResult Function(ChapterDownloading value) downloading,
    required TResult Function(ChapterDownloadComplete value) complete,
    required TResult Function(ChapterDownloadError value) error,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChapterDownloadSkip value)? skip,
    TResult Function(ChapterDownloadPending value)? pending,
    TResult Function(ChapterDownloading value)? downloading,
    TResult Function(ChapterDownloadComplete value)? complete,
    TResult Function(ChapterDownloadError value)? error,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChapterDownloadSkip value)? skip,
    TResult Function(ChapterDownloadPending value)? pending,
    TResult Function(ChapterDownloading value)? downloading,
    TResult Function(ChapterDownloadComplete value)? complete,
    TResult Function(ChapterDownloadError value)? error,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class ChapterDownloadPending implements ChapterDownloadState {
  const factory ChapterDownloadPending() = _$ChapterDownloadPending;
}

/// @nodoc
abstract class $ChapterDownloadingCopyWith<$Res> {
  factory $ChapterDownloadingCopyWith(
          ChapterDownloading value, $Res Function(ChapterDownloading) then) =
      _$ChapterDownloadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChapterDownloadingCopyWithImpl<$Res>
    extends _$ChapterDownloadStateCopyWithImpl<$Res>
    implements $ChapterDownloadingCopyWith<$Res> {
  _$ChapterDownloadingCopyWithImpl(
      ChapterDownloading _value, $Res Function(ChapterDownloading) _then)
      : super(_value, (v) => _then(v as ChapterDownloading));

  @override
  ChapterDownloading get _value => super._value as ChapterDownloading;
}

/// @nodoc

class _$ChapterDownloading implements ChapterDownloading {
  const _$ChapterDownloading();

  @override
  String toString() {
    return 'ChapterDownloadState.downloading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChapterDownloading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() skip,
    required TResult Function() pending,
    required TResult Function() downloading,
    required TResult Function() complete,
    required TResult Function(String reason) error,
  }) {
    return downloading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? skip,
    TResult Function()? pending,
    TResult Function()? downloading,
    TResult Function()? complete,
    TResult Function(String reason)? error,
  }) {
    return downloading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? skip,
    TResult Function()? pending,
    TResult Function()? downloading,
    TResult Function()? complete,
    TResult Function(String reason)? error,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChapterDownloadSkip value) skip,
    required TResult Function(ChapterDownloadPending value) pending,
    required TResult Function(ChapterDownloading value) downloading,
    required TResult Function(ChapterDownloadComplete value) complete,
    required TResult Function(ChapterDownloadError value) error,
  }) {
    return downloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChapterDownloadSkip value)? skip,
    TResult Function(ChapterDownloadPending value)? pending,
    TResult Function(ChapterDownloading value)? downloading,
    TResult Function(ChapterDownloadComplete value)? complete,
    TResult Function(ChapterDownloadError value)? error,
  }) {
    return downloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChapterDownloadSkip value)? skip,
    TResult Function(ChapterDownloadPending value)? pending,
    TResult Function(ChapterDownloading value)? downloading,
    TResult Function(ChapterDownloadComplete value)? complete,
    TResult Function(ChapterDownloadError value)? error,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading(this);
    }
    return orElse();
  }
}

abstract class ChapterDownloading implements ChapterDownloadState {
  const factory ChapterDownloading() = _$ChapterDownloading;
}

/// @nodoc
abstract class $ChapterDownloadCompleteCopyWith<$Res> {
  factory $ChapterDownloadCompleteCopyWith(ChapterDownloadComplete value,
          $Res Function(ChapterDownloadComplete) then) =
      _$ChapterDownloadCompleteCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChapterDownloadCompleteCopyWithImpl<$Res>
    extends _$ChapterDownloadStateCopyWithImpl<$Res>
    implements $ChapterDownloadCompleteCopyWith<$Res> {
  _$ChapterDownloadCompleteCopyWithImpl(ChapterDownloadComplete _value,
      $Res Function(ChapterDownloadComplete) _then)
      : super(_value, (v) => _then(v as ChapterDownloadComplete));

  @override
  ChapterDownloadComplete get _value => super._value as ChapterDownloadComplete;
}

/// @nodoc

class _$ChapterDownloadComplete implements ChapterDownloadComplete {
  const _$ChapterDownloadComplete();

  @override
  String toString() {
    return 'ChapterDownloadState.complete()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChapterDownloadComplete);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() skip,
    required TResult Function() pending,
    required TResult Function() downloading,
    required TResult Function() complete,
    required TResult Function(String reason) error,
  }) {
    return complete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? skip,
    TResult Function()? pending,
    TResult Function()? downloading,
    TResult Function()? complete,
    TResult Function(String reason)? error,
  }) {
    return complete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? skip,
    TResult Function()? pending,
    TResult Function()? downloading,
    TResult Function()? complete,
    TResult Function(String reason)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChapterDownloadSkip value) skip,
    required TResult Function(ChapterDownloadPending value) pending,
    required TResult Function(ChapterDownloading value) downloading,
    required TResult Function(ChapterDownloadComplete value) complete,
    required TResult Function(ChapterDownloadError value) error,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChapterDownloadSkip value)? skip,
    TResult Function(ChapterDownloadPending value)? pending,
    TResult Function(ChapterDownloading value)? downloading,
    TResult Function(ChapterDownloadComplete value)? complete,
    TResult Function(ChapterDownloadError value)? error,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChapterDownloadSkip value)? skip,
    TResult Function(ChapterDownloadPending value)? pending,
    TResult Function(ChapterDownloading value)? downloading,
    TResult Function(ChapterDownloadComplete value)? complete,
    TResult Function(ChapterDownloadError value)? error,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class ChapterDownloadComplete implements ChapterDownloadState {
  const factory ChapterDownloadComplete() = _$ChapterDownloadComplete;
}

/// @nodoc
abstract class $ChapterDownloadErrorCopyWith<$Res> {
  factory $ChapterDownloadErrorCopyWith(ChapterDownloadError value,
          $Res Function(ChapterDownloadError) then) =
      _$ChapterDownloadErrorCopyWithImpl<$Res>;
  $Res call({String reason});
}

/// @nodoc
class _$ChapterDownloadErrorCopyWithImpl<$Res>
    extends _$ChapterDownloadStateCopyWithImpl<$Res>
    implements $ChapterDownloadErrorCopyWith<$Res> {
  _$ChapterDownloadErrorCopyWithImpl(
      ChapterDownloadError _value, $Res Function(ChapterDownloadError) _then)
      : super(_value, (v) => _then(v as ChapterDownloadError));

  @override
  ChapterDownloadError get _value => super._value as ChapterDownloadError;

  @override
  $Res call({
    Object? reason = freezed,
  }) {
    return _then(ChapterDownloadError(
      reason == freezed
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChapterDownloadError implements ChapterDownloadError {
  const _$ChapterDownloadError(this.reason);

  @override
  final String reason;

  @override
  String toString() {
    return 'ChapterDownloadState.error(reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChapterDownloadError &&
            const DeepCollectionEquality().equals(other.reason, reason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(reason));

  @JsonKey(ignore: true)
  @override
  $ChapterDownloadErrorCopyWith<ChapterDownloadError> get copyWith =>
      _$ChapterDownloadErrorCopyWithImpl<ChapterDownloadError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() skip,
    required TResult Function() pending,
    required TResult Function() downloading,
    required TResult Function() complete,
    required TResult Function(String reason) error,
  }) {
    return error(reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? skip,
    TResult Function()? pending,
    TResult Function()? downloading,
    TResult Function()? complete,
    TResult Function(String reason)? error,
  }) {
    return error?.call(reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? skip,
    TResult Function()? pending,
    TResult Function()? downloading,
    TResult Function()? complete,
    TResult Function(String reason)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChapterDownloadSkip value) skip,
    required TResult Function(ChapterDownloadPending value) pending,
    required TResult Function(ChapterDownloading value) downloading,
    required TResult Function(ChapterDownloadComplete value) complete,
    required TResult Function(ChapterDownloadError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChapterDownloadSkip value)? skip,
    TResult Function(ChapterDownloadPending value)? pending,
    TResult Function(ChapterDownloading value)? downloading,
    TResult Function(ChapterDownloadComplete value)? complete,
    TResult Function(ChapterDownloadError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChapterDownloadSkip value)? skip,
    TResult Function(ChapterDownloadPending value)? pending,
    TResult Function(ChapterDownloading value)? downloading,
    TResult Function(ChapterDownloadComplete value)? complete,
    TResult Function(ChapterDownloadError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ChapterDownloadError implements ChapterDownloadState {
  const factory ChapterDownloadError(String reason) = _$ChapterDownloadError;

  String get reason;
  @JsonKey(ignore: true)
  $ChapterDownloadErrorCopyWith<ChapterDownloadError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$DownloadStateTearOff {
  const _$DownloadStateTearOff();

  DownloadEmpty empty() {
    return const DownloadEmpty();
  }

  DownloadPending pending(Iterable<ChapterState> pending) {
    return DownloadPending(
      pending,
    );
  }

  Downloading downloading(int value) {
    return Downloading(
      value,
    );
  }

  DownloadComplete complete() {
    return const DownloadComplete();
  }
}

/// @nodoc
const $DownloadState = _$DownloadStateTearOff();

/// @nodoc
mixin _$DownloadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(Iterable<ChapterState> pending) pending,
    required TResult Function(int value) downloading,
    required TResult Function() complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Iterable<ChapterState> pending)? pending,
    TResult Function(int value)? downloading,
    TResult Function()? complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Iterable<ChapterState> pending)? pending,
    TResult Function(int value)? downloading,
    TResult Function()? complete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadEmpty value) empty,
    required TResult Function(DownloadPending value) pending,
    required TResult Function(Downloading value) downloading,
    required TResult Function(DownloadComplete value) complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DownloadEmpty value)? empty,
    TResult Function(DownloadPending value)? pending,
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadComplete value)? complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadEmpty value)? empty,
    TResult Function(DownloadPending value)? pending,
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadComplete value)? complete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadStateCopyWith<$Res> {
  factory $DownloadStateCopyWith(
          DownloadState value, $Res Function(DownloadState) then) =
      _$DownloadStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DownloadStateCopyWithImpl<$Res>
    implements $DownloadStateCopyWith<$Res> {
  _$DownloadStateCopyWithImpl(this._value, this._then);

  final DownloadState _value;
  // ignore: unused_field
  final $Res Function(DownloadState) _then;
}

/// @nodoc
abstract class $DownloadEmptyCopyWith<$Res> {
  factory $DownloadEmptyCopyWith(
          DownloadEmpty value, $Res Function(DownloadEmpty) then) =
      _$DownloadEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$DownloadEmptyCopyWithImpl<$Res>
    extends _$DownloadStateCopyWithImpl<$Res>
    implements $DownloadEmptyCopyWith<$Res> {
  _$DownloadEmptyCopyWithImpl(
      DownloadEmpty _value, $Res Function(DownloadEmpty) _then)
      : super(_value, (v) => _then(v as DownloadEmpty));

  @override
  DownloadEmpty get _value => super._value as DownloadEmpty;
}

/// @nodoc

class _$DownloadEmpty implements DownloadEmpty {
  const _$DownloadEmpty();

  @override
  String toString() {
    return 'DownloadState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DownloadEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(Iterable<ChapterState> pending) pending,
    required TResult Function(int value) downloading,
    required TResult Function() complete,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Iterable<ChapterState> pending)? pending,
    TResult Function(int value)? downloading,
    TResult Function()? complete,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Iterable<ChapterState> pending)? pending,
    TResult Function(int value)? downloading,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadEmpty value) empty,
    required TResult Function(DownloadPending value) pending,
    required TResult Function(Downloading value) downloading,
    required TResult Function(DownloadComplete value) complete,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DownloadEmpty value)? empty,
    TResult Function(DownloadPending value)? pending,
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadComplete value)? complete,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadEmpty value)? empty,
    TResult Function(DownloadPending value)? pending,
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadComplete value)? complete,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class DownloadEmpty implements DownloadState {
  const factory DownloadEmpty() = _$DownloadEmpty;
}

/// @nodoc
abstract class $DownloadPendingCopyWith<$Res> {
  factory $DownloadPendingCopyWith(
          DownloadPending value, $Res Function(DownloadPending) then) =
      _$DownloadPendingCopyWithImpl<$Res>;
  $Res call({Iterable<ChapterState> pending});
}

/// @nodoc
class _$DownloadPendingCopyWithImpl<$Res>
    extends _$DownloadStateCopyWithImpl<$Res>
    implements $DownloadPendingCopyWith<$Res> {
  _$DownloadPendingCopyWithImpl(
      DownloadPending _value, $Res Function(DownloadPending) _then)
      : super(_value, (v) => _then(v as DownloadPending));

  @override
  DownloadPending get _value => super._value as DownloadPending;

  @override
  $Res call({
    Object? pending = freezed,
  }) {
    return _then(DownloadPending(
      pending == freezed
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as Iterable<ChapterState>,
    ));
  }
}

/// @nodoc

class _$DownloadPending implements DownloadPending {
  const _$DownloadPending(this.pending);

  @override
  final Iterable<ChapterState> pending;

  @override
  String toString() {
    return 'DownloadState.pending(pending: $pending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DownloadPending &&
            const DeepCollectionEquality().equals(other.pending, pending));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(pending));

  @JsonKey(ignore: true)
  @override
  $DownloadPendingCopyWith<DownloadPending> get copyWith =>
      _$DownloadPendingCopyWithImpl<DownloadPending>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(Iterable<ChapterState> pending) pending,
    required TResult Function(int value) downloading,
    required TResult Function() complete,
  }) {
    return pending(this.pending);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Iterable<ChapterState> pending)? pending,
    TResult Function(int value)? downloading,
    TResult Function()? complete,
  }) {
    return pending?.call(this.pending);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Iterable<ChapterState> pending)? pending,
    TResult Function(int value)? downloading,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this.pending);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadEmpty value) empty,
    required TResult Function(DownloadPending value) pending,
    required TResult Function(Downloading value) downloading,
    required TResult Function(DownloadComplete value) complete,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DownloadEmpty value)? empty,
    TResult Function(DownloadPending value)? pending,
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadComplete value)? complete,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadEmpty value)? empty,
    TResult Function(DownloadPending value)? pending,
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadComplete value)? complete,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class DownloadPending implements DownloadState {
  const factory DownloadPending(Iterable<ChapterState> pending) =
      _$DownloadPending;

  Iterable<ChapterState> get pending;
  @JsonKey(ignore: true)
  $DownloadPendingCopyWith<DownloadPending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadingCopyWith<$Res> {
  factory $DownloadingCopyWith(
          Downloading value, $Res Function(Downloading) then) =
      _$DownloadingCopyWithImpl<$Res>;
  $Res call({int value});
}

/// @nodoc
class _$DownloadingCopyWithImpl<$Res> extends _$DownloadStateCopyWithImpl<$Res>
    implements $DownloadingCopyWith<$Res> {
  _$DownloadingCopyWithImpl(
      Downloading _value, $Res Function(Downloading) _then)
      : super(_value, (v) => _then(v as Downloading));

  @override
  Downloading get _value => super._value as Downloading;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(Downloading(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Downloading implements Downloading {
  const _$Downloading(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'DownloadState.downloading(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Downloading &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  $DownloadingCopyWith<Downloading> get copyWith =>
      _$DownloadingCopyWithImpl<Downloading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(Iterable<ChapterState> pending) pending,
    required TResult Function(int value) downloading,
    required TResult Function() complete,
  }) {
    return downloading(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Iterable<ChapterState> pending)? pending,
    TResult Function(int value)? downloading,
    TResult Function()? complete,
  }) {
    return downloading?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Iterable<ChapterState> pending)? pending,
    TResult Function(int value)? downloading,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadEmpty value) empty,
    required TResult Function(DownloadPending value) pending,
    required TResult Function(Downloading value) downloading,
    required TResult Function(DownloadComplete value) complete,
  }) {
    return downloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DownloadEmpty value)? empty,
    TResult Function(DownloadPending value)? pending,
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadComplete value)? complete,
  }) {
    return downloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadEmpty value)? empty,
    TResult Function(DownloadPending value)? pending,
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadComplete value)? complete,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading(this);
    }
    return orElse();
  }
}

abstract class Downloading implements DownloadState {
  const factory Downloading(int value) = _$Downloading;

  int get value;
  @JsonKey(ignore: true)
  $DownloadingCopyWith<Downloading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadCompleteCopyWith<$Res> {
  factory $DownloadCompleteCopyWith(
          DownloadComplete value, $Res Function(DownloadComplete) then) =
      _$DownloadCompleteCopyWithImpl<$Res>;
}

/// @nodoc
class _$DownloadCompleteCopyWithImpl<$Res>
    extends _$DownloadStateCopyWithImpl<$Res>
    implements $DownloadCompleteCopyWith<$Res> {
  _$DownloadCompleteCopyWithImpl(
      DownloadComplete _value, $Res Function(DownloadComplete) _then)
      : super(_value, (v) => _then(v as DownloadComplete));

  @override
  DownloadComplete get _value => super._value as DownloadComplete;
}

/// @nodoc

class _$DownloadComplete implements DownloadComplete {
  const _$DownloadComplete();

  @override
  String toString() {
    return 'DownloadState.complete()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DownloadComplete);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(Iterable<ChapterState> pending) pending,
    required TResult Function(int value) downloading,
    required TResult Function() complete,
  }) {
    return complete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Iterable<ChapterState> pending)? pending,
    TResult Function(int value)? downloading,
    TResult Function()? complete,
  }) {
    return complete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(Iterable<ChapterState> pending)? pending,
    TResult Function(int value)? downloading,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadEmpty value) empty,
    required TResult Function(DownloadPending value) pending,
    required TResult Function(Downloading value) downloading,
    required TResult Function(DownloadComplete value) complete,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DownloadEmpty value)? empty,
    TResult Function(DownloadPending value)? pending,
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadComplete value)? complete,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadEmpty value)? empty,
    TResult Function(DownloadPending value)? pending,
    TResult Function(Downloading value)? downloading,
    TResult Function(DownloadComplete value)? complete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class DownloadComplete implements DownloadState {
  const factory DownloadComplete() = _$DownloadComplete;
}
