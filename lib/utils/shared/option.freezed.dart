// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OptionTearOff {
  const _$OptionTearOff();

  OptionNone<T> none<T>() {
    return OptionNone<T>();
  }

  OptionData<T> data<T>(T data) {
    return OptionData<T>(
      data,
    );
  }
}

/// @nodoc
const $Option = _$OptionTearOff();

/// @nodoc
mixin _$Option<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(T data) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(T data)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(T data)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OptionNone<T> value) none,
    required TResult Function(OptionData<T> value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OptionNone<T> value)? none,
    TResult Function(OptionData<T> value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OptionNone<T> value)? none,
    TResult Function(OptionData<T> value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionCopyWith<T, $Res> {
  factory $OptionCopyWith(Option<T> value, $Res Function(Option<T>) then) =
      _$OptionCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$OptionCopyWithImpl<T, $Res> implements $OptionCopyWith<T, $Res> {
  _$OptionCopyWithImpl(this._value, this._then);

  final Option<T> _value;
  // ignore: unused_field
  final $Res Function(Option<T>) _then;
}

/// @nodoc
abstract class $OptionNoneCopyWith<T, $Res> {
  factory $OptionNoneCopyWith(
          OptionNone<T> value, $Res Function(OptionNone<T>) then) =
      _$OptionNoneCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$OptionNoneCopyWithImpl<T, $Res> extends _$OptionCopyWithImpl<T, $Res>
    implements $OptionNoneCopyWith<T, $Res> {
  _$OptionNoneCopyWithImpl(
      OptionNone<T> _value, $Res Function(OptionNone<T>) _then)
      : super(_value, (v) => _then(v as OptionNone<T>));

  @override
  OptionNone<T> get _value => super._value as OptionNone<T>;
}

/// @nodoc

class _$OptionNone<T> extends OptionNone<T> {
  const _$OptionNone() : super._();

  @override
  String toString() {
    return 'Option<$T>.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OptionNone<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(T data) data,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(T data)? data,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(T data)? data,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OptionNone<T> value) none,
    required TResult Function(OptionData<T> value) data,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OptionNone<T> value)? none,
    TResult Function(OptionData<T> value)? data,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OptionNone<T> value)? none,
    TResult Function(OptionData<T> value)? data,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class OptionNone<T> extends Option<T> {
  const factory OptionNone() = _$OptionNone<T>;
  const OptionNone._() : super._();
}

/// @nodoc
abstract class $OptionDataCopyWith<T, $Res> {
  factory $OptionDataCopyWith(
          OptionData<T> value, $Res Function(OptionData<T>) then) =
      _$OptionDataCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$OptionDataCopyWithImpl<T, $Res> extends _$OptionCopyWithImpl<T, $Res>
    implements $OptionDataCopyWith<T, $Res> {
  _$OptionDataCopyWithImpl(
      OptionData<T> _value, $Res Function(OptionData<T>) _then)
      : super(_value, (v) => _then(v as OptionData<T>));

  @override
  OptionData<T> get _value => super._value as OptionData<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(OptionData<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$OptionData<T> extends OptionData<T> {
  const _$OptionData(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'Option<$T>.data(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OptionData<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $OptionDataCopyWith<T, OptionData<T>> get copyWith =>
      _$OptionDataCopyWithImpl<T, OptionData<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(T data) data,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(T data)? data,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(T data)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OptionNone<T> value) none,
    required TResult Function(OptionData<T> value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(OptionNone<T> value)? none,
    TResult Function(OptionData<T> value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OptionNone<T> value)? none,
    TResult Function(OptionData<T> value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class OptionData<T> extends Option<T> {
  const factory OptionData(T data) = _$OptionData<T>;
  const OptionData._() : super._();

  T get data;
  @JsonKey(ignore: true)
  $OptionDataCopyWith<T, OptionData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
