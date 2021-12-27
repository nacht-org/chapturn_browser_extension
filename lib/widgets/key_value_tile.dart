import 'package:flutter/material.dart';

class KeyValueTile extends StatelessWidget {
  const KeyValueTile(this._key, this._value, {Key? key}) : super(key: key);

  final String _key;
  final String _value;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: _key + ': ',
            style: theme.textTheme.bodyText2?.copyWith(
              color: theme.listTileTheme.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: _value,
            style: theme.textTheme.bodyText2?.copyWith(
              color: theme.listTileTheme.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
