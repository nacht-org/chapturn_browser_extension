import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../utils/services/browser_service/browser_service.dart';

abstract class CrawlerState extends Equatable {}

class LoadingCrawlerState extends CrawlerState {
  @override
  List<Object?> get props => [];
}

class LoadedCrawlerState extends CrawlerState {
  final String url;
  final CrawlerFactory crawlerFactory;

  LoadedCrawlerState(this.url, this.crawlerFactory);

  @override
  List<Object?> get props => [url, crawlerFactory];
}

class NotSupportedCrawlerState extends CrawlerState {
  final String url;
  final Meta? meta;

  NotSupportedCrawlerState(this.url, [this.meta]);

  @override
  List<Object?> get props => [url, props];
}

class CrawlerModel extends ChangeNotifier {
  CrawlerState state = LoadingCrawlerState();

  CrawlerModel({required this.browser});

  final BrowserService browser;

  Future<void> load() async {
    state = await _load();
    notifyListeners();
  }

  Future<CrawlerState> _load() async {
    String url = await browser.href;
    var item = crawlerByUrl(url);
    if (item == null) {
      return NotSupportedCrawlerState(url);
    }

    final meta = item.meta();
    if (isNotSupported(meta.support)) {
      return NotSupportedCrawlerState(url, meta);
    }

    return LoadedCrawlerState(url, item);
  }

  bool isNotSupported(Support support) {
    return support is NoSupport ||
        (support is HasSupport &&
            !support.platforms.contains(SupportPlatform.browser));
  }
}
