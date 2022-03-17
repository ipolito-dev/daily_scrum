import 'package:daily_scrum/core/common/theme/design_edges_theme.dart';
import 'package:flutter/material.dart';

class WevesEffectsStack extends StatelessWidget {
  final Widget? child;
  final Color? splashColor;
  final void Function() onTap;

  const WevesEffectsStack({
    Key? key,
    required this.child,
    required this.onTap,
    this.splashColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          bottom: 0.0,
          child: child ?? Container(),
        ),
        Positioned.fill(
          child: Material(
              color: Colors.transparent,
              borderRadius:
                  BorderRadius.circular(DesignEdgesTheme.bordersRadius),
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: splashColor ??
                    Theme.of(context).colorScheme.primary.withAlpha(55),
                borderRadius:
                    BorderRadius.circular(DesignEdgesTheme.bordersRadius),
                onTap: () => onTap.call(),
              )),
        )
      ],
    );
  }
}
