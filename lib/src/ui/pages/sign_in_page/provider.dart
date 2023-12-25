import 'package:flutter/material.dart';
import 'package:free_gpt/src/src.dart';

class SigninProvider extends ChangeNotifier {
  int colorsIndex = 0;
  ColorItem? _colors;
  Duration duration = const Duration(milliseconds: 300);

  void updateColors(BuildContext context) {
    List<ColorItem> materialColors = [
      ColorItem(
        background: context.colorScheme.surface,
        text: context.colorScheme.onSurface,
      ),
      ColorItem(
        background: context.colorScheme.errorContainer,
        text: context.colorScheme.onErrorContainer,
      ),
      ColorItem(
        background: context.colorScheme.surfaceVariant,
        text: context.colorScheme.onSurfaceVariant,
      ),
     
      ColorItem(
        background: context.colorScheme.tertiaryContainer,
        text: context.colorScheme.onTertiaryContainer,
      ),
     
    ];
    colorsIndex++;
    _colors = materialColors[colorsIndex % materialColors.length];
    notifyListeners();
  }

  ColorItem colors(BuildContext context) {
    return _colors ??
        ColorItem(
          background: context.colorScheme.surface,
          text: context.colorScheme.onSurface,
        );
  }

  void setDuration(int milliseconds) {
    duration = Duration(milliseconds: milliseconds);
    notifyListeners();
  }
}
