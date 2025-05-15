import 'package:dive_in_app/core/constants/colors.dart';
import 'package:dive_in_app/presentation/widgets/dummy_button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

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

extension ContextExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  void showSuccessSnackBar({required String message, VoidCallback? onDismiss}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 17),
            SizedBox(
              width: double.infinity,
              child: DummyButton(
                onPressed: () {
                  ScaffoldMessenger.of(
                    this,
                  ).hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
                },
                borderColor: ColorsConst.kWhite,
                text: 'DISMISS',
                backgroundColor: ColorsConst.kGreen,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsConst.kWhite,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: ColorsConst.kGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: ColorsConst.kGreen, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  void showErrorSnackBar({required String message, VoidCallback? onDismiss}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.error, color: Colors.white),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 17),
            SizedBox(
              width: double.infinity,
              child: DummyButton(
                onPressed: () {
                  ScaffoldMessenger.of(
                    this,
                  ).hideCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
                },
                text: 'DISMISS',
                borderColor: ColorsConst.kWhite,
                backgroundColor: ColorsConst.kRed,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsConst.kWhite,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: ColorsConst.kRed,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: ColorsConst.kRed, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
