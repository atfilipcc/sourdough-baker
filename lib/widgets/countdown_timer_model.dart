import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter(
      {this.animation,
      this.fillColor,
      this.color,
      this.strokeWidth,
      this.backgroundColor})
      : super(repaint: animation);

  final Animation<double> animation;
  final Color fillColor, color, backgroundColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = fillColor
      ..strokeWidth = strokeWidth ?? 5.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);

    if (backgroundColor != null) {
      final backgroundPaint = Paint();
      backgroundPaint.color = backgroundColor;
      canvas.drawCircle(
          size.center(Offset.zero), size.width / 2.2, backgroundPaint);
    }
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        fillColor != old.fillColor;
  }
}

/// Create a Circular Countdown Timer
class CircularCountDownTimer extends StatefulWidget {
  /// Filling Color for Countdown Timer
  final Color fillColor;

  /// Default Color for Countdown Timer
  final Color color;

  /// Background Color for Countdown Widget
  final Color backgroundColor;

  /// Function which will execute when the Countdown Ends
  final Function onComplete;

  /// Countdown Duration in Seconds
  final int duration;

  /// Width of the Countdown Widget
  final double width;

  /// Height of the Countdown Widget
  final double height;

  /// Border Thickness of the Countdown Circle
  final double strokeWidth;

  /// Text Style for Countdown Text
  final TextStyle textStyle;

  /// true for reverse countdown (max to 0), false for forward countdown (0 to max)
  final bool isReverse;

  /// Optional [bool] to hide the [Text] in this widget.
  final bool isTimerTextShown;

  /// Controller to control (i.e Pause, Resume, Restart) the Countdown
  final CountDownController controller;

  final Function updateCallback;

  CircularCountDownTimer(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.duration,
      @required this.fillColor,
      @required this.color,
      this.updateCallback,
      this.backgroundColor,
      this.isReverse,
      this.onComplete,
      this.strokeWidth,
      this.textStyle,
      this.isTimerTextShown = true,
      this.controller})
      : assert(width != null),
        assert(height != null),
        assert(duration != null),
        assert(fillColor != null),
        assert(color != null),
        super(key: key);

  @override
  CircularCountDownTimerState createState() => CircularCountDownTimerState();
}

class CircularCountDownTimerState extends State<CircularCountDownTimer>
    with TickerProviderStateMixin {
  AnimationController _controller;

  String get time {
    if (widget.isReverse && _controller.isDismissed) {
      return '0:00';
    } else {
      Duration duration = _controller.duration * _controller.value;
      return _getTime(duration);
    }
  }

  void _setAnimation() {
    if (widget.isReverse) {
      _controller.reverse(from: 1.0);
    } else {
      _controller.forward();
    }
  }

  void _setController() {
    widget.controller?._state = this;
    widget.controller?._isReverse = widget.isReverse;
  }

  String _getTime(Duration duration) {
    // For HH:mm:ss format
    if (duration.inHours != 0) {
      return '${duration.inHours}:${duration.inMinutes % 60}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    }
    // For mm:ss format
    else {
      return '${duration.inMinutes % 60}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    }
  }

  void _onComplete() {
    if (widget.onComplete != null) widget.onComplete();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    );

    _controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.dismissed:
          _onComplete();
          break;
        case AnimationStatus.completed:

          /// [AnimationController]'s value is manually set to [1.0] that's why [AnimationStatus.completed] is invoked here this animation is [isReverse]
          /// Only call the [_onComplete] block when the animation is not reversed.
          if (!widget.isReverse) _onComplete();
          break;
        default:
        // Do nothing
      }
    });

    _setAnimation();
    _setController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.center,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: CustomPaint(
                                    painter: CustomTimerPainter(
                                        animation: _controller,
                                        fillColor: widget.fillColor,
                                        color: widget.color,
                                        strokeWidth: widget.strokeWidth,
                                        backgroundColor:
                                            widget.backgroundColor),
                                  ),
                                ),
                                widget.isTimerTextShown
                                    ? Align(
                                        alignment: FractionalOffset.center,
                                        child: Text(
                                          time,
                                          style: widget.textStyle ??
                                              TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                              ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }
}

class CountDownController {
  CircularCountDownTimerState _state;
  bool _isReverse;

  void pause() {
    _state._controller?.stop(canceled: false);
  }

  void resume() {
    if (_isReverse) {
      _state._controller
          ?.reverse(from: _state._controller.value = _state._controller.value);
    } else {
      _state._controller?.forward(from: _state._controller.value);
    }
  }

  void restart() {
    if (_isReverse) {
      _state._controller?.reverse(from: 1);
    } else {
      _state._controller?.forward(from: 0);
    }
  }
}
