// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'crawler_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CrawlerStateTearOff {
  const _$CrawlerStateTearOff();

  LoadingCrawlerState loading() {
    return const LoadingCrawlerState();
  }

  FetchingCrawlerState fetching(String url, Meta meta) {
    return FetchingCrawlerState(
      url,
      meta,
    );
  }

  DataCrawlerState data(Meta meta, Novel novel) {
    return DataCrawlerState(
      meta,
      novel,
    );
  }

  UnsupportedCrawlerState unsupported(String url, [Meta? meta]) {
    return UnsupportedCrawlerState(
      url,
      meta,
    );
  }

  ErrorCrawlerState error(Exception err) {
    return ErrorCrawlerState(
      err,
    );
  }
}

/// @nodoc
const $CrawlerState = _$CrawlerStateTearOff();

/// @nodoc
mixin _$CrawlerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String url, Meta meta) fetching,
    required TResult Function(Meta meta, Novel novel) data,
    required TResult Function(String url, Meta? meta) unsupported,
    required TResult Function(Exception err) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String url, Meta meta)? fetching,
    TResult Function(Meta meta, Novel novel)? data,
    TResult Function(String url, Meta? meta)? unsupported,
    TResult Function(Exception err)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String url, Meta meta)? fetching,
    TResult Function(Meta meta, Novel novel)? data,
    TResult Function(String url, Meta? meta)? unsupported,
    TResult Function(Exception err)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCrawlerState value) loading,
    required TResult Function(FetchingCrawlerState value) fetching,
    required TResult Function(DataCrawlerState value) data,
    required TResult Function(UnsupportedCrawlerState value) unsupported,
    required TResult Function(ErrorCrawlerState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCrawlerState value)? loading,
    TResult Function(FetchingCrawlerState value)? fetching,
    TResult Function(DataCrawlerState value)? data,
    TResult Function(UnsupportedCrawlerState value)? unsupported,
    TResult Function(ErrorCrawlerState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCrawlerState value)? loading,
    TResult Function(FetchingCrawlerState value)? fetching,
    TResult Function(DataCrawlerState value)? data,
    TResult Function(UnsupportedCrawlerState value)? unsupported,
    TResult Function(ErrorCrawlerState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrawlerStateCopyWith<$Res> {
  factory $CrawlerStateCopyWith(
          CrawlerState value, $Res Function(CrawlerState) then) =
      _$CrawlerStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CrawlerStateCopyWithImpl<$Res> implements $CrawlerStateCopyWith<$Res> {
  _$CrawlerStateCopyWithImpl(this._value, this._then);

  final CrawlerState _value;
  // ignore: unused_field
  final $Res Function(CrawlerState) _then;
}

/// @nodoc
abstract class $LoadingCrawlerStateCopyWith<$Res> {
  factory $LoadingCrawlerStateCopyWith(
          LoadingCrawlerState value, $Res Function(LoadingCrawlerState) then) =
      _$LoadingCrawlerStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCrawlerStateCopyWithImpl<$Res>
    extends _$CrawlerStateCopyWithImpl<$Res>
    implements $LoadingCrawlerStateCopyWith<$Res> {
  _$LoadingCrawlerStateCopyWithImpl(
      LoadingCrawlerState _value, $Res Function(LoadingCrawlerState) _then)
      : super(_value, (v) => _then(v as LoadingCrawlerState));

  @override
  LoadingCrawlerState get _value => super._value as LoadingCrawlerState;
}

/// @nodoc

class _$LoadingCrawlerState implements LoadingCrawlerState {
  const _$LoadingCrawlerState();

  @override
  String toString() {
    return 'CrawlerState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingCrawlerState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String url, Meta meta) fetching,
    required TResult Function(Meta meta, Novel novel) data,
    required TResult Function(String url, Meta? meta) unsupported,
    required TResult Function(Exception err) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String url, Meta meta)? fetching,
    TResult Function(Meta meta, Novel novel)? data,
    TResult Function(String url, Meta? meta)? unsupported,
    TResult Function(Exception err)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String url, Meta meta)? fetching,
    TResult Function(Meta meta, Novel novel)? data,
    TResult Function(String url, Meta? meta)? unsupported,
    TResult Function(Exception err)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCrawlerState value) loading,
    required TResult Function(FetchingCrawlerState value) fetching,
    required TResult Function(DataCrawlerState value) data,
    required TResult Function(UnsupportedCrawlerState value) unsupported,
    required TResult Function(ErrorCrawlerState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCrawlerState value)? loading,
    TResult Function(FetchingCrawlerState value)? fetching,
    TResult Function(DataCrawlerState value)? data,
    TResult Function(UnsupportedCrawlerState value)? unsupported,
    TResult Function(ErrorCrawlerState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCrawlerState value)? loading,
    TResult Function(FetchingCrawlerState value)? fetching,
    TResult Function(DataCrawlerState value)? data,
    TResult Function(UnsupportedCrawlerState value)? unsupported,
    TResult Function(ErrorCrawlerState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingCrawlerState implements CrawlerState {
  const factory LoadingCrawlerState() = _$LoadingCrawlerState;
}

/// @nodoc
abstract class $FetchingCrawlerStateCopyWith<$Res> {
  factory $FetchingCrawlerStateCopyWith(FetchingCrawlerState value,
          $Res Function(FetchingCrawlerState) then) =
      _$FetchingCrawlerStateCopyWithImpl<$Res>;
  $Res call({String url, Meta meta});
}

/// @nodoc
class _$FetchingCrawlerStateCopyWithImpl<$Res>
    extends _$CrawlerStateCopyWithImpl<$Res>
    implements $FetchingCrawlerStateCopyWith<$Res> {
  _$FetchingCrawlerStateCopyWithImpl(
      FetchingCrawlerState _value, $Res Function(FetchingCrawlerState) _then)
      : super(_value, (v) => _then(v as FetchingCrawlerState));

  @override
  FetchingCrawlerState get _value => super._value as FetchingCrawlerState;

  @override
  $Res call({
    Object? url = freezed,
    Object? meta = freezed,
  }) {
    return _then(FetchingCrawlerState(
      url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ));
  }
}

/// @nodoc

class _$FetchingCrawlerState implements FetchingCrawlerState {
  const _$FetchingCrawlerState(this.url, this.meta);

  @override
  final String url;
  @override
  final Meta meta;

  @override
  String toString() {
    return 'CrawlerState.fetching(url: $url, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FetchingCrawlerState &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.meta, meta));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(meta));

  @JsonKey(ignore: true)
  @override
  $FetchingCrawlerStateCopyWith<FetchingCrawlerState> get copyWith =>
      _$FetchingCrawlerStateCopyWithImpl<FetchingCrawlerState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String url, Meta meta) fetching,
    required TResult Function(Meta meta, Novel novel) data,
    required TResult Function(String url, Meta? meta) unsupported,
    required TResult Function(Exception err) error,
  }) {
    return fetching(url, meta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String url, Meta meta)? fetching,
    TResult Function(Meta meta, Novel novel)? data,
    TResult Function(String url, Meta? meta)? unsupported,
    TResult Function(Exception err)? error,
  }) {
    return fetching?.call(url, meta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String url, Meta meta)? fetching,
    TResult Function(Meta meta, Novel novel)? data,
    TResult Function(String url, Meta? meta)? unsupported,
    TResult Function(Exception err)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(url, meta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCrawlerState value) loading,
    required TResult Function(FetchingCrawlerState value) fetching,
    required TResult Function(DataCrawlerState value) data,
    required TResult Function(UnsupportedCrawlerState value) unsupported,
    required TResult Function(ErrorCrawlerState value) error,
  }) {
    return fetching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCrawlerState value)? loading,
    TResult Function(FetchingCrawlerState value)? fetching,
    TResult Function(DataCrawlerState value)? data,
    TResult Function(UnsupportedCrawlerState value)? unsupported,
    TResult Function(ErrorCrawlerState value)? error,
  }) {
    return fetching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCrawlerState value)? loading,
    TResult Function(FetchingCrawlerState value)? fetching,
    TResult Function(DataCrawlerState value)? data,
    TResult Function(UnsupportedCrawlerState value)? unsupported,
    TResult Function(ErrorCrawlerState value)? error,
    required TResult orElse(),
  }) {
    if (fetching != null) {
      return fetching(this);
    }
    return orElse();
  }
}

abstract class FetchingCrawlerState implements CrawlerState {
  const factory FetchingCrawlerState(String url, Meta meta) =
      _$FetchingCrawlerState;

  String get url;
  Meta get meta;
  @JsonKey(ignore: true)
  $FetchingCrawlerStateCopyWith<FetchingCrawlerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCrawlerStateCopyWith<$Res> {
  factory $DataCrawlerStateCopyWith(
          DataCrawlerState value, $Res Function(DataCrawlerState) then) =
      _$DataCrawlerStateCopyWithImpl<$Res>;
  $Res call({Meta meta, Novel novel});
}

/// @nodoc
class _$DataCrawlerStateCopyWithImpl<$Res>
    extends _$CrawlerStateCopyWithImpl<$Res>
    implements $DataCrawlerStateCopyWith<$Res> {
  _$DataCrawlerStateCopyWithImpl(
      DataCrawlerState _value, $Res Function(DataCrawlerState) _then)
      : super(_value, (v) => _then(v as DataCrawlerState));

  @override
  DataCrawlerState get _value => super._value as DataCrawlerState;

  @override
  $Res call({
    Object? meta = freezed,
    Object? novel = freezed,
  }) {
    return _then(DataCrawlerState(
      meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
      novel == freezed
          ? _value.novel
          : novel // ignore: cast_nullable_to_non_nullable
              as Novel,
    ));
  }
}

/// @nodoc

class _$DataCrawlerState implements DataCrawlerState {
  const _$DataCrawlerState(this.meta, this.novel);

  @override
  final Meta meta;
  @override
  final Novel novel;

  @override
  String toString() {
    return 'CrawlerState.data(meta: $meta, novel: $novel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataCrawlerState &&
            const DeepCollectionEquality().equals(other.meta, meta) &&
            const DeepCollectionEquality().equals(other.novel, novel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(meta),
      const DeepCollectionEquality().hash(novel));

  @JsonKey(ignore: true)
  @override
  $DataCrawlerStateCopyWith<DataCrawlerState> get copyWith =>
      _$DataCrawlerStateCopyWithImpl<DataCrawlerState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String url, Meta meta) fetching,
    required TResult Function(Meta meta, Novel novel) data,
    required TResult Function(String url, Meta? meta) unsupported,
    required TResult Function(Exception err) error,
  }) {
    return data(meta, novel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String url, Meta meta)? fetching,
    TResult Function(Meta meta, Novel novel)? data,
    TResult Function(String url, Meta? meta)? unsupported,
    TResult Function(Exception err)? error,
  }) {
    return data?.call(meta, novel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String url, Meta meta)? fetching,
    TResult Function(Meta meta, Novel novel)? data,
    TResult Function(String url, Meta? meta)? unsupported,
    TResult Function(Exception err)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(meta, novel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCrawlerState value) loading,
    required TResult Function(FetchingCrawlerState value) fetching,
    required TResult Function(DataCrawlerState value) data,
    required TResult Function(UnsupportedCrawlerState value) unsupported,
    required TResult Function(ErrorCrawlerState value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCrawlerState value)? loading,
    TResult Function(FetchingCrawlerState value)? fetching,
    TResult Function(DataCrawlerState value)? data,
    TResult Function(UnsupportedCrawlerState value)? unsupported,
    TResult Function(ErrorCrawlerState value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCrawlerState value)? loading,
    TResult Function(FetchingCrawlerState value)? fetching,
    TResult Function(DataCrawlerState value)? data,
    TResult Function(UnsupportedCrawlerState value)? unsupported,
    TResult Function(ErrorCrawlerState value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class DataCrawlerState implements CrawlerState {
  const factory DataCrawlerState(Meta meta, Novel novel) = _$DataCrawlerState;

  Meta get meta;
  Novel get novel;
  @JsonKey(ignore: true)
  $DataCrawlerStateCopyWith<DataCrawlerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnsupportedCrawlerStateCopyWith<$Res> {
  factory $UnsupportedCrawlerStateCopyWith(UnsupportedCrawlerState value,
          $Res Function(UnsupportedCrawlerState) then) =
      _$UnsupportedCrawlerStateCopyWithImpl<$Res>;
  $Res call({String url, Meta? meta});
}

/// @nodoc
class _$UnsupportedCrawlerStateCopyWithImpl<$Res>
    extends _$CrawlerStateCopyWithImpl<$Res>
    implements $UnsupportedCrawlerStateCopyWith<$Res> {
  _$UnsupportedCrawlerStateCopyWithImpl(UnsupportedCrawlerState _value,
      $Res Function(UnsupportedCrawlerState) _then)
      : super(_value, (v) => _then(v as UnsupportedCrawlerState));

  @override
  UnsupportedCrawlerState get _value => super._value as UnsupportedCrawlerState;

  @override
  $Res call({
    Object? url = freezed,
    Object? meta = freezed,
  }) {
    return _then(UnsupportedCrawlerState(
      url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      meta == freezed
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ));
  }
}

/// @nodoc

class _$UnsupportedCrawlerState implements UnsupportedCrawlerState {
  const _$UnsupportedCrawlerState(this.url, [this.meta]);

  @override
  final String url;
  @override
  final Meta? meta;

  @override
  String toString() {
    return 'CrawlerState.unsupported(url: $url, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnsupportedCrawlerState &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.meta, meta));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(meta));

  @JsonKey(ignore: true)
  @override
  $UnsupportedCrawlerStateCopyWith<UnsupportedCrawlerState> get copyWith =>
      _$UnsupportedCrawlerStateCopyWithImpl<UnsupportedCrawlerState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String url, Meta meta) fetching,
    required TResult Function(Meta meta, Novel novel) data,
    required TResult Function(String url, Meta? meta) unsupported,
    required TResult Function(Exception err) error,
  }) {
    return unsupported(url, meta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String url, Meta meta)? fetching,
    TResult Function(Meta meta, Novel novel)? data,
    TResult Function(String url, Meta? meta)? unsupported,
    TResult Function(Exception err)? error,
  }) {
    return unsupported?.call(url, meta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String url, Meta meta)? fetching,
    TResult Function(Meta meta, Novel novel)? data,
    TResult Function(String url, Meta? meta)? unsupported,
    TResult Function(Exception err)? error,
    required TResult orElse(),
  }) {
    if (unsupported != null) {
      return unsupported(url, meta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCrawlerState value) loading,
    required TResult Function(FetchingCrawlerState value) fetching,
    required TResult Function(DataCrawlerState value) data,
    required TResult Function(UnsupportedCrawlerState value) unsupported,
    required TResult Function(ErrorCrawlerState value) error,
  }) {
    return unsupported(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCrawlerState value)? loading,
    TResult Function(FetchingCrawlerState value)? fetching,
    TResult Function(DataCrawlerState value)? data,
    TResult Function(UnsupportedCrawlerState value)? unsupported,
    TResult Function(ErrorCrawlerState value)? error,
  }) {
    return unsupported?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCrawlerState value)? loading,
    TResult Function(FetchingCrawlerState value)? fetching,
    TResult Function(DataCrawlerState value)? data,
    TResult Function(UnsupportedCrawlerState value)? unsupported,
    TResult Function(ErrorCrawlerState value)? error,
    required TResult orElse(),
  }) {
    if (unsupported != null) {
      return unsupported(this);
    }
    return orElse();
  }
}

abstract class UnsupportedCrawlerState implements CrawlerState {
  const factory UnsupportedCrawlerState(String url, [Meta? meta]) =
      _$UnsupportedCrawlerState;

  String get url;
  Meta? get meta;
  @JsonKey(ignore: true)
  $UnsupportedCrawlerStateCopyWith<UnsupportedCrawlerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCrawlerStateCopyWith<$Res> {
  factory $ErrorCrawlerStateCopyWith(
          ErrorCrawlerState value, $Res Function(ErrorCrawlerState) then) =
      _$ErrorCrawlerStateCopyWithImpl<$Res>;
  $Res call({Exception err});
}

/// @nodoc
class _$ErrorCrawlerStateCopyWithImpl<$Res>
    extends _$CrawlerStateCopyWithImpl<$Res>
    implements $ErrorCrawlerStateCopyWith<$Res> {
  _$ErrorCrawlerStateCopyWithImpl(
      ErrorCrawlerState _value, $Res Function(ErrorCrawlerState) _then)
      : super(_value, (v) => _then(v as ErrorCrawlerState));

  @override
  ErrorCrawlerState get _value => super._value as ErrorCrawlerState;

  @override
  $Res call({
    Object? err = freezed,
  }) {
    return _then(ErrorCrawlerState(
      err == freezed
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$ErrorCrawlerState implements ErrorCrawlerState {
  const _$ErrorCrawlerState(this.err);

  @override
  final Exception err;

  @override
  String toString() {
    return 'CrawlerState.error(err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorCrawlerState &&
            const DeepCollectionEquality().equals(other.err, err));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(err));

  @JsonKey(ignore: true)
  @override
  $ErrorCrawlerStateCopyWith<ErrorCrawlerState> get copyWith =>
      _$ErrorCrawlerStateCopyWithImpl<ErrorCrawlerState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String url, Meta meta) fetching,
    required TResult Function(Meta meta, Novel novel) data,
    required TResult Function(String url, Meta? meta) unsupported,
    required TResult Function(Exception err) error,
  }) {
    return error(err);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String url, Meta meta)? fetching,
    TResult Function(Meta meta, Novel novel)? data,
    TResult Function(String url, Meta? meta)? unsupported,
    TResult Function(Exception err)? error,
  }) {
    return error?.call(err);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String url, Meta meta)? fetching,
    TResult Function(Meta meta, Novel novel)? data,
    TResult Function(String url, Meta? meta)? unsupported,
    TResult Function(Exception err)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(err);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingCrawlerState value) loading,
    required TResult Function(FetchingCrawlerState value) fetching,
    required TResult Function(DataCrawlerState value) data,
    required TResult Function(UnsupportedCrawlerState value) unsupported,
    required TResult Function(ErrorCrawlerState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingCrawlerState value)? loading,
    TResult Function(FetchingCrawlerState value)? fetching,
    TResult Function(DataCrawlerState value)? data,
    TResult Function(UnsupportedCrawlerState value)? unsupported,
    TResult Function(ErrorCrawlerState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingCrawlerState value)? loading,
    TResult Function(FetchingCrawlerState value)? fetching,
    TResult Function(DataCrawlerState value)? data,
    TResult Function(UnsupportedCrawlerState value)? unsupported,
    TResult Function(ErrorCrawlerState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ErrorCrawlerState implements CrawlerState {
  const factory ErrorCrawlerState(Exception err) = _$ErrorCrawlerState;

  Exception get err;
  @JsonKey(ignore: true)
  $ErrorCrawlerStateCopyWith<ErrorCrawlerState> get copyWith =>
      throw _privateConstructorUsedError;
}
