import 'dart:html';

import 'package:injectable/injectable.dart';

enum WebMode {
  popup,
  tab,
}

abstract class WebService {
  WebMode get runtimeMode;
  String get novelUrl;
}

@Environment(Environment.prod)
@Injectable(as: WebService)
class WebServiceProd implements WebService {
  @override
  String get novelUrl => throw UnimplementedError();

  @override
  WebMode get runtimeMode {
    final search = window.location.search;

    if (search == null || search.trim().isEmpty) {
      return WebMode.popup;
    } else {
      return WebMode.tab;
    }
  }
}

@Environment(Environment.dev)
@Injectable(as: WebService)
class WebServiceDev implements WebService {
  @override
  String get novelUrl =>
      'https://www.scribblehub.com/series/412447/shonen-hero-system/';

  @override
  WebMode get runtimeMode => WebMode.tab;
}
