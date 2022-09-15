import 'package:flutter/material.dart';
import 'package:health_app/others/common.dart';

class SegmentedWidget extends StatelessWidget {
  const SegmentedWidget({
    Key key,
    @required this.onChanged,
    this.index,
    this.color,
    this.textColor,
    this.children,
  }) : super(key: key);

  final ValueChanged<int> onChanged;
  final int index;
  final Color color;
  final Color textColor;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      //clipper: ShapeBorderClipper(shape: shape),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
                color: Colors.grey, width: 0.3
            ),
            color: Colors.white
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [..._buildChildren(context)],
          ),
        ),
      ),
    );
  }

  Iterable<Widget> _buildChildren(BuildContext context) sync* {
    final theme = Theme.of(context);
    final color = this.color ?? theme.accentColor;
    final textColor = this.textColor ??
        (this.color == null
            ? theme.accentTextTheme.button.color
            : (ThemeData.estimateBrightnessForColor(color) == Brightness.dark ? Colors.white : Colors.black));
    final style1 = theme.textTheme.button.copyWith(color: color);
    final style2 = theme.textTheme.button.copyWith(color: textColor);
    final data1 = theme.iconTheme.copyWith(color: color);
    final data2 = theme.iconTheme.copyWith(color: textColor);
    final duration = kThemeAnimationDuration;

    for (int i = 0; i < children.length; i++) {
      final selected = i == index;
      yield Expanded(
        child: GestureDetector(
          onTap: onChanged != null ? () => onChanged(i) : null,
          child: AnimatedContainer(
            duration: duration,
            decoration: BoxDecoration(
                color: selected ? color : Colors.white,
                borderRadius: BorderRadius.circular(50)
            ),
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            child: AnimatedTheme(
              data: theme.copyWith(
                iconTheme: selected ? data2 : data1,
              ),
              child: AnimatedDefaultTextStyle(
                duration: duration,
                style: selected ? style2 : style1,
                child: children[i],
              ),
            ),
          ),
        ),
      );
    }
  }
}