import 'package:daily_scrum/core/common/theme/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

/// States that your button can assume via the controller
// ignore: public_member_api_docs
enum LoadingState { idle, loading, success, error }

/// Initalize class
class RoundedLoadingButton extends StatefulWidget {
  /// Button controller, now required
  final RoundedLoadingButtonController? controller;

  /// The callback that is called when
  /// the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The button's label
  final Widget child;

  /// The primary color of the button
  final Color? color;

  /// The vertical extent of the button.
  final double height;

  /// The horiztonal extent of the button.
  final double width;

  /// The size of the CircularProgressIndicator
  final double loaderSize;

  /// The stroke width of the CircularProgressIndicator
  final double loaderStrokeWidth;

  /// Whether to trigger the animation on the tap event
  final bool animateOnTap;

  /// The color of the static icons
  final Color valueColor;

  /// The curve of the shrink animation
  final Curve curve;

  /// The radius of the button border
  final double borderRadius;

  /// The duration of the button animation
  final Duration duration;

  /// The elevation of the raised button
  final double elevation;

  /// The color of the button when it is in the error state
  final Color? errorColor;

  /// The color of the button when it is in the success state
  final Color? successColor;

  /// The color of the button when it is disabled
  final Color? disabledColor;

  final bool disabled;

  Duration get _borderDuration {
    return Duration(milliseconds: (duration.inMilliseconds / 2).round());
  }

  /// initalize constructor
  const RoundedLoadingButton({
    Key? key,
    this.controller,
    required this.onPressed,
    required this.child,
    this.color = Colors.lightBlue,
    this.height = 50,
    this.width = 300,
    this.loaderSize = 24.0,
    this.loaderStrokeWidth = 2.0,
    this.animateOnTap = true,
    this.valueColor = Colors.white,
    this.borderRadius = 35,
    this.elevation = 2,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOutCirc,
    this.errorColor = Colors.red,
    this.successColor,
    this.disabledColor = ColorsTheme.buttonDisable,
    this.disabled = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => RoundedLoadingButtonState();
}

/// Class implementation
class RoundedLoadingButtonState extends State<RoundedLoadingButton>
    with TickerProviderStateMixin {
  late AnimationController _buttonController;
  late AnimationController _borderController;
  late AnimationController _checkButtonController;
  late Animation _squeezeAnimation;
  late Animation _bounceAnimation;
  late Animation _borderAnimation;

  final _state = BehaviorSubject<LoadingState>.seeded(LoadingState.idle);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var check = Container(
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: widget.successColor ?? theme.primaryColor,
        borderRadius:
            BorderRadius.all(Radius.circular(_bounceAnimation.value / 2)),
      ),
      width: _bounceAnimation.value,
      height: _bounceAnimation.value,
      child: _bounceAnimation.value > 20
          ? Icon(
              Icons.check,
              color: widget.valueColor,
            )
          : null,
    );

    var cross = Container(
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: widget.errorColor,
        borderRadius:
            BorderRadius.all(Radius.circular(_bounceAnimation.value / 2)),
      ),
      width: _bounceAnimation.value,
      height: _bounceAnimation.value,
      child: _bounceAnimation.value > 20
          ? Icon(
              Icons.close,
              color: widget.valueColor,
            )
          : null,
    );

    var loader = SizedBox(
      height: widget.loaderSize,
      width: widget.loaderSize,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(widget.valueColor),
        strokeWidth: widget.loaderStrokeWidth,
      ),
    );

    var childStream = StreamBuilder(
      stream: _state,
      builder: (context, snapshot) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: snapshot.data == LoadingState.loading ? loader : widget.child,
        );
      },
    );

    final btn = ButtonTheme(
      shape: RoundedRectangleBorder(borderRadius: _borderAnimation.value),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: widget.disabled ? widget.disabledColor : widget.color,
          onSurface: widget.disabled ? widget.disabledColor : widget.color,
          minimumSize: Size(_squeezeAnimation.value, widget.height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          primary: widget.disabled ? widget.disabledColor : widget.color,
          elevation: widget.elevation,
          padding: const EdgeInsets.all(0),
        ),
        onPressed: widget.disabled ? null : _btnPressed,
        child: childStream,
      ),
    );

    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      height: widget.height,
      child: Center(
        child: _state.value == LoadingState.error
            ? cross
            : _state.value == LoadingState.success
                ? check
                : btn,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _buttonController =
        AnimationController(duration: widget.duration, vsync: this);

    _checkButtonController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _borderController =
        AnimationController(duration: widget._borderDuration, vsync: this);

    _bounceAnimation = Tween<double>(begin: 0, end: widget.height).animate(
      CurvedAnimation(
        parent: _checkButtonController,
        curve: Curves.elasticOut,
      ),
    );
    _bounceAnimation.addListener(() {
      setState(() {
        ///TODO_update view
      });
    });

    _squeezeAnimation =
        Tween<double>(begin: widget.width, end: widget.height).animate(
      CurvedAnimation(parent: _buttonController, curve: widget.curve),
    );

    _squeezeAnimation.addListener(() {
      setState(() {
        ///TODO_update view
      });
    });

    _squeezeAnimation.addStatusListener((state) {
      if (state == AnimationStatus.completed && widget.animateOnTap) {
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      }
    });

    _borderAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(widget.borderRadius),
      end: BorderRadius.circular(widget.height),
    ).animate(_borderController);

    _borderAnimation.addListener(() {
      setState(() {
        ///TODO_update view
      });
    });

    widget.controller?._addListeners(_start, _stop, _success, _error, _reset);
  }

  @override
  void dispose() {
    _buttonController.dispose();
    _checkButtonController.dispose();
    _borderController.dispose();
    _state.close();
    super.dispose();
  }

  _btnPressed() async {
    if (widget.animateOnTap) {
      _start();
    } else {
      if (widget.onPressed != null) {
        widget.onPressed!();
      }
    }
  }

  _start() {
    _state.sink.add(LoadingState.loading);
    _borderController.forward();
    _buttonController.forward();
  }

  _stop() {
    _state.sink.add(LoadingState.idle);
    _buttonController.reverse();
    _borderController.reverse();
  }

  _success() {
    _state.sink.add(LoadingState.success);
    _checkButtonController.forward();
  }

  _error() {
    _state.sink.add(LoadingState.error);
    _checkButtonController.forward();
  }

  _reset() {
    _state.sink.add(LoadingState.idle);
    _buttonController.reverse();
    _borderController.reverse();
    _checkButtonController.reset();
  }
}

/// Options that can be chosen by the controller
/// each will perform a unique animation
class RoundedLoadingButtonController {
  late VoidCallback _startListener;
  late VoidCallback _stopListener;
  late VoidCallback _successListener;
  late VoidCallback _errorListener;
  late VoidCallback _resetListener;

  _addListeners(
    VoidCallback startListener,
    VoidCallback stopListener,
    VoidCallback successListener,
    VoidCallback errorListener,
    VoidCallback resetListener,
  ) {
    _startListener = startListener;
    _stopListener = stopListener;
    _successListener = successListener;
    _errorListener = errorListener;
    _resetListener = resetListener;
  }

  /// Notify listeners to start the loading animation
  void start() {
    _startListener();
  }

  /// Notify listeners to start the stop animation
  void stop() {
    _stopListener();
  }

  /// Notify listeners to start the sucess animation
  void success() {
    _successListener();
  }

  /// Notify listeners to start the error animation
  void error() {
    _errorListener();
  }

  /// Notify listeners to start the reset animation
  void reset() {
    _resetListener();
  }
}
