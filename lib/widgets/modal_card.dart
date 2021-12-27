import 'package:chapturn_webext/constants/widget_constants.dart';
import 'package:flutter/material.dart';

class ModalCard extends StatelessWidget {
  const ModalCard({
    Key? key,
    required this.heading,
    required this.headingIcon,
    this.children,
    this.actions,
  }) : super(key: key);

  final Widget headingIcon;
  final String heading;
  final List<Widget>? children;
  final List<Widget>? actions;

  static Widget forceCentered(Widget child, {double? width}) {
    return Center(
      child: SizedBox(
        width: width ?? cPreferredCardWidth,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasMiddle = children != null;
    final hasBottom = actions != null;

    const divider = Divider(height: cNormalPadding * 2);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(cNormalPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  heading.toUpperCase(),
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                headingIcon,
              ],
            ),
            if (hasMiddle) ...[
              divider,
              ...children!,
            ],
            if (hasBottom) ...[
              divider,
              Row(
                children: actions!,
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class LoadingCard extends StatelessWidget {
  const LoadingCard({
    Key? key,
    this.heading = 'Loading...',
    this.headingIcon = loadingIcon,
    this.message,
  }) : super(key: key);

  final String heading;
  final Widget headingIcon;
  final String? message;

  @override
  Widget build(BuildContext context) {
    List<Widget>? children = message != null
        ? [
            Text(
              message!,
              style: Theme.of(context).textTheme.subtitle2,
            )
          ]
        : null;

    return ModalCard(
      heading: heading,
      headingIcon: headingIcon,
      children: children,
    );
  }

  static const Widget loadingIcon = SizedBox(
    width: 24,
    height: 24,
    child: CircularProgressIndicator(),
  );
}
