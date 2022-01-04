import 'package:chapturn_browser_extension/constants/widget_constants.dart';
import 'package:chapturn_browser_extension/core/novel/providers.dart';
import 'package:chapturn_browser_extension/core/popup/widgets/crawler_card.dart';
import 'package:chapturn_browser_extension/widgets/modal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PopupHome extends HookConsumerWidget {
  const PopupHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(crawlerController.notifier).load(fetch: false);
    }, []);

    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        titleTextStyle: theme.textTheme.headline6?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: theme.colorScheme.onSurface,
        ),
        elevation: 2,
        title: const Text('Chapturn'),
      ),
      body: const SafeArea(child: PopupList()),
    );
  }
}

class PopupList extends ConsumerWidget {
  const PopupList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: kRadius),
      children: const [
        CrawlerCard(),
      ],
    );
  }
}
