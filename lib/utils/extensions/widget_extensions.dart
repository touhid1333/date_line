import 'package:flutter/widgets.dart';

extension WidgetExtensions on Widget {
  Widget padding({double? left, double? right, double? top, double? bottom, double? all}) =>
      Padding(
        padding: EdgeInsets.fromLTRB(
          all ?? left ?? 0,
          all ?? top ?? 0,
          all ?? right ?? 0,
          all ?? bottom ?? 0,
        ),
        child: this,
      );
}
