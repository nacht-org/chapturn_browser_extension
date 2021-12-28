import 'package:chapturn_sources/chapturn_sources.dart';
import 'package:chapturn_webext/constants/package_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/modal_card.dart';

class SourceUnsupportedCard extends StatelessWidget {
  const SourceUnsupportedCard(this.url, this.meta, {Key? key})
      : super(key: key);

  final String url;
  final Meta? meta;

  @override
  Widget build(BuildContext context) {
    final uri = Uri.parse(url);

    var message =
        'This source is not currently supported by chapturn. You may request support by creating an issue on github.';

    final support = meta?.support;
    if (support is HasSupport) {
      message =
          'This source is not currently supported in the browser extension.';
    } else if (support is NoSupport) {
      message = support.reason;
    }

    return ModalCard.forceCentered(
      child: ModalCard(
        headingIcon: const Icon(Icons.error),
        heading: uri.host,
        children: [
          Text(message),
        ],
        actions: [
          TextButton.icon(
            onPressed: () => launch(newIssue),
            icon: const Icon(FontAwesomeIcons.github),
            label: const Text('Issue'),
          )
        ],
      ),
    );
  }
}
