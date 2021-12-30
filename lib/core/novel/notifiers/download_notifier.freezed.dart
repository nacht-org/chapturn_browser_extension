// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'download_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DownloadStateTearOff {
  const _$DownloadStateTearOff();

  IdleDownloadState idle() {
    return const IdleDownloadState();
  }

  PendingDownloadState pending(int count) {
    return PendingDownloadState(
      count,
    );
  }

  ProgressDownloadState progress(int progress, int total) {
    return ProgressDownloadState(
      progress,
      total,
    );
  }

  CompleteDownloadState complete() {
    return const CompleteDownloadState();
  }
}

/// @nodoc
const $DownloadState = _$DownloadStateTearOff();

/// @nodoc
mixin _$DownloadState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int count) pending,
    required TResult Function(int progress, int total) progress,
    required TResult Function() complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int count)? pending,
    TResult Function(int progress, int total)? progress,
    TResult Function()? complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int count)? pending,
    TResult Function(int progress, int total)? progress,
    TResult Function()? complete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleDownloadState value) idle,
    required TResult Function(PendingDownloadState value) pending,
    required TResult Function(ProgressDownloadState value) progress,
    required TResult Function(CompleteDownloadState value) complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleDownloadState value)? idle,
    TResult Function(PendingDownloadState value)? pending,
    TResult Function(ProgressDownloadState value)? progress,
    TResult Function(CompleteDownloadState value)? complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleDownloadState value)? idle,
    TResult Function(PendingDownloadState value)? pending,
    TResult Function(ProgressDownloadState value)? progress,
    TResult Function(CompleteDownloadState value)? complete,
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
abstract class $IdleDownloadStateCopyWith<$Res> {
  factory $IdleDownloadStateCopyWith(
          IdleDownloadState value, $Res Function(IdleDownloadState) then) =
      _$IdleDownloadStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleDownloadStateCopyWithImpl<$Res>
    extends _$DownloadStateCopyWithImpl<$Res>
    implements $IdleDownloadStateCopyWith<$Res> {
  _$IdleDownloadStateCopyWithImpl(
      IdleDownloadState _value, $Res Function(IdleDownloadState) _then)
      : super(_value, (v) => _then(v as IdleDownloadState));

  @override
  IdleDownloadState get _value => super._value as IdleDownloadState;
}

/// @nodoc

class _$IdleDownloadState implements IdleDownloadState {
  const _$IdleDownloadState();

  @override
  String toString() {
    return 'DownloadState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is IdleDownloadState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int count) pending,
    required TResult Function(int progress, int total) progress,
    required TResult Function() complete,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int count)? pending,
    TResult Function(int progress, int total)? progress,
    TResult Function()? complete,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int count)? pending,
    TResult Function(int progress, int total)? progress,
    TResult Function()? complete,
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
    required TResult Function(IdleDownloadState value) idle,
    required TResult Function(PendingDownloadState value) pending,
    required TResult Function(ProgressDownloadState value) progress,
    required TResult Function(CompleteDownloadState value) complete,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleDownloadState value)? idle,
    TResult Function(PendingDownloadState value)? pending,
    TResult Function(ProgressDownloadState value)? progress,
    TResult Function(CompleteDownloadState value)? complete,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleDownloadState value)? idle,
    TResult Function(PendingDownloadState value)? pending,
    TResult Function(ProgressDownloadState value)? progress,
    TResult Function(CompleteDownloadState value)? complete,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class IdleDownloadState implements DownloadState {
  const factory IdleDownloadState() = _$IdleDownloadState;
}

/// @nodoc
abstract class $PendingDownloadStateCopyWith<$Res> {
  factory $PendingDownloadStateCopyWith(PendingDownloadState value,
          $Res Function(PendingDownloadState) then) =
      _$PendingDownloadStateCopyWithImpl<$Res>;
  $Res call({int count});
}

/// @nodoc
class _$PendingDownloadStateCopyWithImpl<$Res>
    extends _$DownloadStateCopyWithImpl<$Res>
    implements $PendingDownloadStateCopyWith<$Res> {
  _$PendingDownloadStateCopyWithImpl(
      PendingDownloadState _value, $Res Function(PendingDownloadState) _then)
      : super(_value, (v) => _then(v as PendingDownloadState));

  @override
  PendingDownloadState get _value => super._value as PendingDownloadState;

  @override
  $Res call({
    Object? count = freezed,
  }) {
    return _then(PendingDownloadState(
      count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PendingDownloadState implements PendingDownloadState {
  const _$PendingDownloadState(this.count);

  @override
  final int count;

  @override
  String toString() {
    return 'DownloadState.pending(count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PendingDownloadState &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  $PendingDownloadStateCopyWith<PendingDownloadState> get copyWith =>
      _$PendingDownloadStateCopyWithImpl<PendingDownloadState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int count) pending,
    required TResult Function(int progress, int total) progress,
    required TResult Function() complete,
  }) {
    return pending(count);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int count)? pending,
    TResult Function(int progress, int total)? progress,
    TResult Function()? complete,
  }) {
    return pending?.call(count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int count)? pending,
    TResult Function(int progress, int total)? progress,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleDownloadState value) idle,
    required TResult Function(PendingDownloadState value) pending,
    required TResult Function(ProgressDownloadState value) progress,
    required TResult Function(CompleteDownloadState value) complete,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleDownloadState value)? idle,
    TResult Function(PendingDownloadState value)? pending,
    TResult Function(ProgressDownloadState value)? progress,
    TResult Function(CompleteDownloadState value)? complete,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleDownloadState value)? idle,
    TResult Function(PendingDownloadState value)? pending,
    TResult Function(ProgressDownloadState value)? progress,
    TResult Function(CompleteDownloadState value)? complete,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class PendingDownloadState implements DownloadState {
  const factory PendingDownloadState(int count) = _$PendingDownloadState;

  int get count;
  @JsonKey(ignore: true)
  $PendingDownloadStateCopyWith<PendingDownloadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressDownloadStateCopyWith<$Res> {
  factory $ProgressDownloadStateCopyWith(ProgressDownloadState value,
          $Res Function(ProgressDownloadState) then) =
      _$ProgressDownloadStateCopyWithImpl<$Res>;
  $Res call({int progress, int total});
}

/// @nodoc
class _$ProgressDownloadStateCopyWithImpl<$Res>
    extends _$DownloadStateCopyWithImpl<$Res>
    implements $ProgressDownloadStateCopyWith<$Res> {
  _$ProgressDownloadStateCopyWithImpl(
      ProgressDownloadState _value, $Res Function(ProgressDownloadState) _then)
      : super(_value, (v) => _then(v as ProgressDownloadState));

  @override
  ProgressDownloadState get _value => super._value as ProgressDownloadState;

  @override
  $Res call({
    Object? progress = freezed,
    Object? total = freezed,
  }) {
    return _then(ProgressDownloadState(
      progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ProgressDownloadState implements ProgressDownloadState {
  const _$ProgressDownloadState(this.progress, this.total);

  @override
  final int progress;
  @override
  final int total;

  @override
  String toString() {
    return 'DownloadState.progress(progress: $progress, total: $total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProgressDownloadState &&
            const DeepCollectionEquality().equals(other.progress, progress) &&
            const DeepCollectionEquality().equals(other.total, total));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(progress),
      const DeepCollectionEquality().hash(total));

  @JsonKey(ignore: true)
  @override
  $ProgressDownloadStateCopyWith<ProgressDownloadState> get copyWith =>
      _$ProgressDownloadStateCopyWithImpl<ProgressDownloadState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int count) pending,
    required TResult Function(int progress, int total) progress,
    required TResult Function() complete,
  }) {
    return progress(this.progress, total);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int count)? pending,
    TResult Function(int progress, int total)? progress,
    TResult Function()? complete,
  }) {
    return progress?.call(this.progress, total);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int count)? pending,
    TResult Function(int progress, int total)? progress,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this.progress, total);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IdleDownloadState value) idle,
    required TResult Function(PendingDownloadState value) pending,
    required TResult Function(ProgressDownloadState value) progress,
    required TResult Function(CompleteDownloadState value) complete,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleDownloadState value)? idle,
    TResult Function(PendingDownloadState value)? pending,
    TResult Function(ProgressDownloadState value)? progress,
    TResult Function(CompleteDownloadState value)? complete,
  }) {
    return progress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleDownloadState value)? idle,
    TResult Function(PendingDownloadState value)? pending,
    TResult Function(ProgressDownloadState value)? progress,
    TResult Function(CompleteDownloadState value)? complete,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class ProgressDownloadState implements DownloadState {
  const factory ProgressDownloadState(int progress, int total) =
      _$ProgressDownloadState;

  int get progress;
  int get total;
  @JsonKey(ignore: true)
  $ProgressDownloadStateCopyWith<ProgressDownloadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteDownloadStateCopyWith<$Res> {
  factory $CompleteDownloadStateCopyWith(CompleteDownloadState value,
          $Res Function(CompleteDownloadState) then) =
      _$CompleteDownloadStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CompleteDownloadStateCopyWithImpl<$Res>
    extends _$DownloadStateCopyWithImpl<$Res>
    implements $CompleteDownloadStateCopyWith<$Res> {
  _$CompleteDownloadStateCopyWithImpl(
      CompleteDownloadState _value, $Res Function(CompleteDownloadState) _then)
      : super(_value, (v) => _then(v as CompleteDownloadState));

  @override
  CompleteDownloadState get _value => super._value as CompleteDownloadState;
}

/// @nodoc

class _$CompleteDownloadState implements CompleteDownloadState {
  const _$CompleteDownloadState();

  @override
  String toString() {
    return 'DownloadState.complete()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CompleteDownloadState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(int count) pending,
    required TResult Function(int progress, int total) progress,
    required TResult Function() complete,
  }) {
    return complete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int count)? pending,
    TResult Function(int progress, int total)? progress,
    TResult Function()? complete,
  }) {
    return complete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(int count)? pending,
    TResult Function(int progress, int total)? progress,
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
    required TResult Function(IdleDownloadState value) idle,
    required TResult Function(PendingDownloadState value) pending,
    required TResult Function(ProgressDownloadState value) progress,
    required TResult Function(CompleteDownloadState value) complete,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(IdleDownloadState value)? idle,
    TResult Function(PendingDownloadState value)? pending,
    TResult Function(ProgressDownloadState value)? progress,
    TResult Function(CompleteDownloadState value)? complete,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IdleDownloadState value)? idle,
    TResult Function(PendingDownloadState value)? pending,
    TResult Function(ProgressDownloadState value)? progress,
    TResult Function(CompleteDownloadState value)? complete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }
}

abstract class CompleteDownloadState implements DownloadState {
  const factory CompleteDownloadState() = _$CompleteDownloadState;
}
