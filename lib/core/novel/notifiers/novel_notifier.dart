import 'dart:typed_data';

import 'package:chapturn_browser_extension/core/alert/notifiers/alert_notifier.dart';
import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

import '../../../utils/helpers/io_helper/io_helper.dart';
import '../../../utils/helpers/text_helper.dart';
import '../../../utils/services/package_service.dart';

part 'novel_notifier.freezed.dart';

class PackagingState extends Equatable {
  final String message;
  final bool error;

  const PackagingState(this.message, this.error);
  const PackagingState.idle() : this('Idle', false);
  const PackagingState.waiting() : this('Waiting', false);
  const PackagingState.busy() : this('Busy', false);
  const PackagingState.thumbnail() : this('Fetching thumbnail', false);

  @override
  List<Object?> get props => [message, error];
}

class ContentIndex {
  final int volumeIndex;
  final int? chapterIndex;

  const ContentIndex(this.volumeIndex, [this.chapterIndex]);

  bool get isChapter => chapterIndex != null;
}

@freezed
abstract class NovelState with _$NovelState {
  const factory NovelState.fetching() = FetchingNovelState;
  const factory NovelState.loaded() = LoadedNovelState;
  const factory NovelState.error() = ErrorNovelState;
}

class NovelNotifier extends StateNotifier<NovelState> {
  PackagingState packagingState = const PackagingState.idle();

  final String url;
  final CrawlerFactory crawlerFactory;
  final AlertNotifier alert;
  final Packager packager;

  NovelNotifier({
    required this.url,
    required this.crawlerFactory,
    required this.alert,
    required this.packager,
  }) : super(const NovelState.fetching());

  /// Download all chapter content if not already done so
  // Future<void> waitDownload({bool showAlert = true}) async {
  //   isDownloading = true;
  //   var pending = pendingDownload();
  //   if (pending.isEmpty) {
  //     isDownloading = false;
  //     return;
  //   }

  //   value = 1;
  //   total = pending.length;

  //   for (var c in pending) {
  //     if (!c.shouldDownload) {
  //       continue;
  //     }

  //     await c.download(_crawlerInstance);

  //     value++;
  //   }

  //   isDownloading = false;

  //   if (showAlert) alert.showAlert('Download completed');
  // }

  // Future<void> packEpub() async {
  //   await _packEpub();
  //   packagingState = const PackagingState.idle();
  // }

  // Future<void> _packEpub() async {
  //   packagingState = const PackagingState.waiting();

  //   if (isDownloading) {
  //     alert.showAlert('Another task already running');
  //     return;
  //   }

  //   if (novel == null) {
  //     alert.showAlert('Failed to package: novel is null');
  //     return;
  //   }

  //   await waitDownload(showAlert: false);

  //   // download thumbnail
  //   Uint8List? thumbnailBytes;
  //   if (novel!.thumbnailUrl != null) {
  //     packagingState = const PackagingState.thumbnail();

  //     final response = await http.get(Uri.parse(novel!.thumbnailUrl!));
  //     thumbnailBytes = response.bodyBytes;
  //   }

  //   packagingState = const PackagingState.busy();

  //   List<int>? bytes;
  //   try {
  //     bytes = await packager.package(novel!, thumbnailBytes: thumbnailBytes);
  //   } catch (e) {
  //     if (e is XmlParserException) {
  //       alert.showAlert('Error parsing downloaded content: $e');
  //     } else {
  //       alert.showAlert('Failed to package');
  //     }
  //     return;
  //   }

  //   if (bytes == null) {
  //     alert.showAlert('Failed to package: epub is null');
  //     return;
  //   }

  //   alert.showAlert('Packaged to epub');
  //   downloadFile(slugifyMinimal(novel!.title) + '.epub', bytes);
  // }
}
