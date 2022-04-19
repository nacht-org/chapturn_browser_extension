import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/services/browser_service/browser_service.dart';

part 'crawler_controller.freezed.dart';

@freezed
class CrawlerState with _$CrawlerState {
  const factory CrawlerState.loading() = LoadingCrawlerState;

  const factory CrawlerState.fetching(
    String url,
    Meta meta,
  ) = FetchingCrawlerState;

  const factory CrawlerState.data(
    Meta meta,
    Crawler crawler,
    Novel novel,
  ) = DataCrawlerState;

  const factory CrawlerState.supported(
    String url,
    Meta meta,
  ) = SupportedCrawlerState;

  const factory CrawlerState.unsupported(
    String url, [
    Meta? meta,
  ]) = UnsupportedCrawlerState;

  const factory CrawlerState.error(Exception err) = ErrorCrawlerState;
}

class CrawlerController extends StateNotifier<CrawlerState> {
  CrawlerController({
    required this.browser,
  }) : super(const CrawlerState.loading());

  final BrowserService browser;

  Future<void> load({bool fetch = true}) async {
    String url = await browser.href;
    var item = crawlerFactoryFor(url);
    if (item == null) {
      state = CrawlerState.unsupported(url);
      return;
    }

    final meta = item.meta();
    if (isNotSupported(meta.support)) {
      state = CrawlerState.unsupported(url, meta);
      return;
    }

    if (fetch) {
      state = CrawlerState.fetching(url, meta);

      final crawler = item.create();
      final novel = await (crawler as NovelParse).parseNovel(url);

      state = CrawlerState.data(meta, crawler, novel);
    } else {
      state = CrawlerState.supported(url, meta);
    }
  }

  Future<void> reload() async {
    if (state is! DataCrawlerState) {
      return;
    }

    state = CrawlerState.fetching(
      (state as DataCrawlerState).novel.url,
      (state as DataCrawlerState).meta,
    );

    await load();
  }

  /// Source has no support or has support but not for browser platform
  bool isNotSupported(Support support) {
    return support is NoSupport ||
        (support is HasSupport &&
            !support.platforms.contains(SupportPlatform.browser));
  }
}
