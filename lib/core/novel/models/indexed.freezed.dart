// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'indexed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChapterListItemTearOff {
  const _$ChapterListItemTearOff();

  _VolumeListItem volume(Volume volume) {
    return _VolumeListItem(
      volume,
    );
  }

  _ChapterListItem chapter(ChapterState chapter) {
    return _ChapterListItem(
      chapter,
    );
  }
}

/// @nodoc
const $ChapterListItem = _$ChapterListItemTearOff();

/// @nodoc
mixin _$ChapterListItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Volume volume) volume,
    required TResult Function(ChapterState chapter) chapter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Volume volume)? volume,
    TResult Function(ChapterState chapter)? chapter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Volume volume)? volume,
    TResult Function(ChapterState chapter)? chapter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VolumeListItem value) volume,
    required TResult Function(_ChapterListItem value) chapter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_VolumeListItem value)? volume,
    TResult Function(_ChapterListItem value)? chapter,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VolumeListItem value)? volume,
    TResult Function(_ChapterListItem value)? chapter,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterListItemCopyWith<$Res> {
  factory $ChapterListItemCopyWith(
          ChapterListItem value, $Res Function(ChapterListItem) then) =
      _$ChapterListItemCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChapterListItemCopyWithImpl<$Res>
    implements $ChapterListItemCopyWith<$Res> {
  _$ChapterListItemCopyWithImpl(this._value, this._then);

  final ChapterListItem _value;
  // ignore: unused_field
  final $Res Function(ChapterListItem) _then;
}

/// @nodoc
abstract class _$VolumeListItemCopyWith<$Res> {
  factory _$VolumeListItemCopyWith(
          _VolumeListItem value, $Res Function(_VolumeListItem) then) =
      __$VolumeListItemCopyWithImpl<$Res>;
  $Res call({Volume volume});
}

/// @nodoc
class __$VolumeListItemCopyWithImpl<$Res>
    extends _$ChapterListItemCopyWithImpl<$Res>
    implements _$VolumeListItemCopyWith<$Res> {
  __$VolumeListItemCopyWithImpl(
      _VolumeListItem _value, $Res Function(_VolumeListItem) _then)
      : super(_value, (v) => _then(v as _VolumeListItem));

  @override
  _VolumeListItem get _value => super._value as _VolumeListItem;

  @override
  $Res call({
    Object? volume = freezed,
  }) {
    return _then(_VolumeListItem(
      volume == freezed
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as Volume,
    ));
  }
}

/// @nodoc

class _$_VolumeListItem implements _VolumeListItem {
  const _$_VolumeListItem(this.volume);

  @override
  final Volume volume;

  @override
  String toString() {
    return 'ChapterListItem.volume(volume: $volume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VolumeListItem &&
            const DeepCollectionEquality().equals(other.volume, volume));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(volume));

  @JsonKey(ignore: true)
  @override
  _$VolumeListItemCopyWith<_VolumeListItem> get copyWith =>
      __$VolumeListItemCopyWithImpl<_VolumeListItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Volume volume) volume,
    required TResult Function(ChapterState chapter) chapter,
  }) {
    return volume(this.volume);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Volume volume)? volume,
    TResult Function(ChapterState chapter)? chapter,
  }) {
    return volume?.call(this.volume);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Volume volume)? volume,
    TResult Function(ChapterState chapter)? chapter,
    required TResult orElse(),
  }) {
    if (volume != null) {
      return volume(this.volume);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VolumeListItem value) volume,
    required TResult Function(_ChapterListItem value) chapter,
  }) {
    return volume(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_VolumeListItem value)? volume,
    TResult Function(_ChapterListItem value)? chapter,
  }) {
    return volume?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VolumeListItem value)? volume,
    TResult Function(_ChapterListItem value)? chapter,
    required TResult orElse(),
  }) {
    if (volume != null) {
      return volume(this);
    }
    return orElse();
  }
}

abstract class _VolumeListItem implements ChapterListItem {
  const factory _VolumeListItem(Volume volume) = _$_VolumeListItem;

  Volume get volume;
  @JsonKey(ignore: true)
  _$VolumeListItemCopyWith<_VolumeListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ChapterListItemCopyWith<$Res> {
  factory _$ChapterListItemCopyWith(
          _ChapterListItem value, $Res Function(_ChapterListItem) then) =
      __$ChapterListItemCopyWithImpl<$Res>;
  $Res call({ChapterState chapter});
}

/// @nodoc
class __$ChapterListItemCopyWithImpl<$Res>
    extends _$ChapterListItemCopyWithImpl<$Res>
    implements _$ChapterListItemCopyWith<$Res> {
  __$ChapterListItemCopyWithImpl(
      _ChapterListItem _value, $Res Function(_ChapterListItem) _then)
      : super(_value, (v) => _then(v as _ChapterListItem));

  @override
  _ChapterListItem get _value => super._value as _ChapterListItem;

  @override
  $Res call({
    Object? chapter = freezed,
  }) {
    return _then(_ChapterListItem(
      chapter == freezed
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as ChapterState,
    ));
  }
}

/// @nodoc

class _$_ChapterListItem implements _ChapterListItem {
  const _$_ChapterListItem(this.chapter);

  @override
  final ChapterState chapter;

  @override
  String toString() {
    return 'ChapterListItem.chapter(chapter: $chapter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChapterListItem &&
            const DeepCollectionEquality().equals(other.chapter, chapter));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(chapter));

  @JsonKey(ignore: true)
  @override
  _$ChapterListItemCopyWith<_ChapterListItem> get copyWith =>
      __$ChapterListItemCopyWithImpl<_ChapterListItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Volume volume) volume,
    required TResult Function(ChapterState chapter) chapter,
  }) {
    return chapter(this.chapter);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Volume volume)? volume,
    TResult Function(ChapterState chapter)? chapter,
  }) {
    return chapter?.call(this.chapter);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Volume volume)? volume,
    TResult Function(ChapterState chapter)? chapter,
    required TResult orElse(),
  }) {
    if (chapter != null) {
      return chapter(this.chapter);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VolumeListItem value) volume,
    required TResult Function(_ChapterListItem value) chapter,
  }) {
    return chapter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_VolumeListItem value)? volume,
    TResult Function(_ChapterListItem value)? chapter,
  }) {
    return chapter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VolumeListItem value)? volume,
    TResult Function(_ChapterListItem value)? chapter,
    required TResult orElse(),
  }) {
    if (chapter != null) {
      return chapter(this);
    }
    return orElse();
  }
}

abstract class _ChapterListItem implements ChapterListItem {
  const factory _ChapterListItem(ChapterState chapter) = _$_ChapterListItem;

  ChapterState get chapter;
  @JsonKey(ignore: true)
  _$ChapterListItemCopyWith<_ChapterListItem> get copyWith =>
      throw _privateConstructorUsedError;
}
