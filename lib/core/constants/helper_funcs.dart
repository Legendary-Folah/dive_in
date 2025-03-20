import 'package:flutter/widgets.dart';

class HelperFuncs {
  String toUpperCase(String str) {
    return str.toUpperCase();
  }

  String toLowerCase(String str) {
    return str.toLowerCase();
  }

  Widget withPadding({
    double right = 0,
    double left = 0,
    double top = 0,
    double bottom = 0,
    double padding = 0,
    double vertical = 0,
    double horizontal = 0,
  }) {
    EdgeInsets decidePadding() {
      if (vertical > 0) {
        return EdgeInsets.symmetric(vertical: vertical);
      }

      if (horizontal > 0) {
        return EdgeInsets.symmetric(horizontal: horizontal);
      }

      if (padding > 0) {
        return EdgeInsets.all(padding);
      }

      if (right > 0 || left > 0 || top > 0 || bottom > 0) {
        return EdgeInsets.only(
          right: right,
          left: left,
          top: top,
          bottom: bottom,
        );
      }
      return EdgeInsets.symmetric(
        horizontal: right + left,
        vertical: top + bottom,
      );
    }

    return Padding(padding: decidePadding());
  }
}
