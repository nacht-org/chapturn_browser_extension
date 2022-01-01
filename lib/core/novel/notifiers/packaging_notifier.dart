import 'dart:typed_data';

import 'package:chapturn_browser_extension/core/novel/providers.dart';
import 'package:chapturn_browser_extension/utils/helpers/io_helper/io_helper.dart';
import 'package:chapturn_browser_extension/utils/helpers/text_helper.dart';
import 'package:chapturn_browser_extension/utils/services/package_service.dart';
import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import 'download_notifier.dart';

part 'packaging_notifier.freezed.dart';

@freezed
class PackagingState with _$PackagingState {
  const factory PackagingState.idle() = IdlePackaingState;
  const factory PackagingState.waiting() = WaitingPackagingState;
  const factory PackagingState.preparing() = PreparingPackagingState;
  const factory PackagingState.busy() = BusyPackagingState;
}

class PackagingNotifer extends StateNotifier<PackagingState> {
  PackagingNotifer(this.read, this.novel, this.packager, this.hasPending)
      : super(const PackagingState.idle());

  final Reader read;
  final bool hasPending;
  final Novel novel;
  final Packager packager;

  Future<void> package() async {
    if (hasPending) {
      state = const PackagingState.waiting();
      // await read(downloadNotifierProvider.notifier).start();
    }

    Uint8List? thumbnail = await _thumbnail();

    if (!mounted) return;
    state = const PackagingState.waiting();
    final bytes = await _package(novel, thumbnail);

    if (bytes != null) {
      downloadFile(slugifyMinimal(novel.title) + '.epub', bytes);
    } else {
      print('Failed to package: epub is null');
    }

    if (!mounted) return;
    state = const PackagingState.idle();
  }

  Future<Uint8List?> _thumbnail() async {
    Uint8List? bytes;
    if (novel.thumbnailUrl != null) {
      if (!mounted) return null;
      state = const PackagingState.preparing();

      final response = await http.get(Uri.parse(novel.thumbnailUrl!));
      bytes = response.bodyBytes;
    }

    return bytes;
  }

  Future<List<int>?> _package(Novel novel, List<int>? thumbnail) async {
    List<int>? bytes;
    try {
      bytes = await packager.package(novel, thumbnailBytes: thumbnail);
    } catch (e) {
      print(e);
    }

    return bytes;
  }
}
