import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../utils/services/browser_service/browser_service.dart';
import '../../../utils/services/package_service.dart';
import '../../alert/models/alert_model.dart';
import 'novel_model.dart';

abstract class CrawlerState extends Equatable {}

class LoadingCrawlerState extends CrawlerState {
  @override
  List<Object?> get props => [];
}

class LoadedCrawlerState extends CrawlerState {
  final NovelModel novel;

  LoadedCrawlerState(this.novel);

  @override
  List<Object?> get props => [novel];
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

  CrawlerModel({
    required this.browser,
    required this.alert,
    required this.packager,
  });

  final AlertModel alert;
  final Packager packager;
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

    final novel = NovelModel(
      url: url,
      crawlerFactory: item,
      alert: alert,
      packager: packager,
    )..loadNovel();

    return LoadedCrawlerState(novel);
  }

  /// Source has no support or has support but not for browser platform
  bool isNotSupported(Support support) {
    return support is NoSupport ||
        (support is HasSupport &&
            !support.platforms.contains(SupportPlatform.browser));
  }
}
