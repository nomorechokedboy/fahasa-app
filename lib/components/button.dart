import 'package:flutter/material.dart';

@immutable
class FaButton extends OutlinedButton {
  final bool outlined;
  final double width;
  final double height;
  final bool secondary;
  final String label;

  FaButton({
    Key? key,
    required VoidCallback? onPressed,
    this.outlined = false,
    this.width = 150,
    this.height = 40,
    this.secondary = false,
    required this.label,
  }) : super(key: key, onPressed: onPressed, child: Text(label));

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    Color _primaryColor = secondary ? Colors.red : colorScheme.primary;
    Color _backgroundColor = _primaryColor;

    if (outlined) {
      _backgroundColor = Colors.transparent;
    } else {
      _primaryColor = Colors.white;
    }

    return OutlinedButton.styleFrom(
      primary: _primaryColor,
      backgroundColor: _backgroundColor,
      shadowColor: theme.shadowColor,
      elevation: 0,
      textStyle: theme.textTheme.button,
      padding: ButtonStyleButton.scaledPadding(
        const EdgeInsets.symmetric(horizontal: 16),
        const EdgeInsets.symmetric(horizontal: 8),
        const EdgeInsets.symmetric(horizontal: 4),
        MediaQuery.maybeOf(context)?.textScaleFactor ?? 1,
      ),
      minimumSize: Size(width, height),
      maximumSize: Size.infinite,
      side: BorderSide(
        color: _primaryColor,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      enabledMouseCursor: SystemMouseCursors.click,
      disabledMouseCursor: SystemMouseCursors.forbidden,
      visualDensity: theme.visualDensity,
      tapTargetSize: theme.materialTapTargetSize,
      animationDuration: kThemeChangeDuration,
      enableFeedback: true,
      alignment: Alignment.center,
      splashFactory: InkRipple.splashFactory,
    );
  }
}
