import 'package:flutter/material.dart';

import '../../../constants/widget_constants.dart';

// TODO Show if rejected or discontinued
class SourceNoSupport extends StatelessWidget {
  const SourceNoSupport(this.url, {Key? key}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(url);

    return Center(
      child: SizedBox(
        width: 500,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(normalPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.error),
                    const SizedBox(width: contentPadding),
                    Text(
                      uri.host,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {}, // TODO
                      icon: const Icon(Icons.open_in_browser),
                      splashRadius: cSplashRadius,
                      tooltip: 'Open novel in browser',
                    ),
                  ],
                ),
                const Divider(height: normalPadding * 2),
                const Text(
                    'This source is not currently supported by chapturn. You may request support by creating an issue on github.'),
                const SizedBox(height: contentPadding),
                SelectableText(url),
                const SizedBox(height: contentPadding),
                TextButton(
                  onPressed: () {}, // TODO
                  child: const Text('Request'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
