import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/services/browser_service/browser_service.dart';

part 'crawler_notifier.freezed.dart';

@freezed
class CrawlerState with _$CrawlerState {
  const factory CrawlerState.loading() = LoadingCrawlerState;

  const factory CrawlerState.fetching(
    String url,
    Meta meta,
  ) = FetchingCrawlerState;

  const factory CrawlerState.data(
    Meta meta,
    NovelCrawler crawler,
    Novel novel,
  ) = DataCrawlerState;

  const factory CrawlerState.unsupported(
    String url, [
    Meta? meta,
  ]) = UnsupportedCrawlerState;

  const factory CrawlerState.error(Exception err) = ErrorCrawlerState;
}

class CrawlerNotifier extends StateNotifier<CrawlerState> {
  CrawlerNotifier({
    required this.browser,
  }) : super(const CrawlerState.loading()) {
    load();
  }

  final BrowserService browser;

  Future<void> load() async {
    String url = await browser.href;
    var item = crawlerByUrl(url);
    if (item == null) {
      state = CrawlerState.unsupported(url);
      return;
    }

    final meta = item.meta();
    if (isNotSupported(meta.support)) {
      state = CrawlerState.unsupported(url, meta);
      return;
    }

    state = CrawlerState.fetching(url, meta);

    final crawler = item.create();
    final novel = await crawler.parseNovel(url);

    state = CrawlerState.data(meta, crawler, novel);
  }

  Future<void> loadNovel() async {}

  // TODO: implement
  Future<void> reload() async {}

  /// Source has no support or has support but not for browser platform
  bool isNotSupported(Support support) {
    return support is NoSupport ||
        (support is HasSupport &&
            !support.platforms.contains(SupportPlatform.browser));
  }
}
