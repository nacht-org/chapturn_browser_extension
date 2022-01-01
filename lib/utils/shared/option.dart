import 'package:freezed_annotation/freezed_annotation.dart';

part 'option.freezed.dart';

@freezed
class Option<T> with _$Option<T> {
  const Option._();
  const factory Option.none() = OptionNone;
  const factory Option.data(T data) = OptionData;

  T? get value => this is OptionData ? (this as OptionData).data : null;

  /// Parse option from a nullable data value
  static Option from<T>(T? data) =>
      data == null ? const Option.none() : Option.data(data);

  Option<R> whenData<R>(R Function(T data) callback) {
    return when(
      none: () => const Option.none(),
      data: (data) => Option.data(callback(data)),
    );
  }
}
