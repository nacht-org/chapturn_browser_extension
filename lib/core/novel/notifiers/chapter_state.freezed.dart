// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chapter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChapterStateTearOff {
  const _$ChapterStateTearOff();

  _ChapterState call(Chapter chapter,
      {ChapterDownloadState downloadState = ChapterDownloadState.pending,
      bool isSelected = true}) {
    return _ChapterState(
      chapter,
      downloadState: downloadState,
      isSelected: isSelected,
    );
  }
}

/// @nodoc
const $ChapterState = _$ChapterStateTearOff();

/// @nodoc
mixin _$ChapterState {
  Chapter get chapter => throw _privateConstructorUsedError;
  ChapterDownloadState get downloadState => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChapterStateCopyWith<ChapterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterStateCopyWith<$Res> {
  factory $ChapterStateCopyWith(
          ChapterState value, $Res Function(ChapterState) then) =
      _$ChapterStateCopyWithImpl<$Res>;
  $Res call(
      {Chapter chapter, ChapterDownloadState downloadState, bool isSelected});
}

/// @nodoc
class _$ChapterStateCopyWithImpl<$Res> implements $ChapterStateCopyWith<$Res> {
  _$ChapterStateCopyWithImpl(this._value, this._then);

  final ChapterState _value;
  // ignore: unused_field
  final $Res Function(ChapterState) _then;

  @override
  $Res call({
    Object? chapter = freezed,
    Object? downloadState = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      chapter: chapter == freezed
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter,
      downloadState: downloadState == freezed
          ? _value.downloadState
          : downloadState // ignore: cast_nullable_to_non_nullable
              as ChapterDownloadState,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ChapterStateCopyWith<$Res>
    implements $ChapterStateCopyWith<$Res> {
  factory _$ChapterStateCopyWith(
          _ChapterState value, $Res Function(_ChapterState) then) =
      __$ChapterStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Chapter chapter, ChapterDownloadState downloadState, bool isSelected});
}

/// @nodoc
class __$ChapterStateCopyWithImpl<$Res> extends _$ChapterStateCopyWithImpl<$Res>
    implements _$ChapterStateCopyWith<$Res> {
  __$ChapterStateCopyWithImpl(
      _ChapterState _value, $Res Function(_ChapterState) _then)
      : super(_value, (v) => _then(v as _ChapterState));

  @override
  _ChapterState get _value => super._value as _ChapterState;

  @override
  $Res call({
    Object? chapter = freezed,
    Object? downloadState = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_ChapterState(
      chapter == freezed
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter,
      downloadState: downloadState == freezed
          ? _value.downloadState
          : downloadState // ignore: cast_nullable_to_non_nullable
              as ChapterDownloadState,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ChapterState extends _ChapterState with DiagnosticableTreeMixin {
  const _$_ChapterState(this.chapter,
      {this.downloadState = ChapterDownloadState.pending,
      this.isSelected = true})
      : super._();

  @override
  final Chapter chapter;
  @JsonKey()
  @override
  final ChapterDownloadState downloadState;
  @JsonKey()
  @override
  final bool isSelected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChapterState(chapter: $chapter, downloadState: $downloadState, isSelected: $isSelected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChapterState'))
      ..add(DiagnosticsProperty('chapter', chapter))
      ..add(DiagnosticsProperty('downloadState', downloadState))
      ..add(DiagnosticsProperty('isSelected', isSelected));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChapterState &&
            const DeepCollectionEquality().equals(other.chapter, chapter) &&
            const DeepCollectionEquality()
                .equals(other.downloadState, downloadState) &&
            const DeepCollectionEquality()
                .equals(other.isSelected, isSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chapter),
      const DeepCollectionEquality().hash(downloadState),
      const DeepCollectionEquality().hash(isSelected));

  @JsonKey(ignore: true)
  @override
  _$ChapterStateCopyWith<_ChapterState> get copyWith =>
      __$ChapterStateCopyWithImpl<_ChapterState>(this, _$identity);
}

abstract class _ChapterState extends ChapterState {
  const factory _ChapterState(Chapter chapter,
      {ChapterDownloadState downloadState, bool isSelected}) = _$_ChapterState;
  const _ChapterState._() : super._();

  @override
  Chapter get chapter;
  @override
  ChapterDownloadState get downloadState;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$ChapterStateCopyWith<_ChapterState> get copyWith =>
      throw _privateConstructorUsedError;
}
