import 'package:flutter/material.dart';
import 'dart:math' as math;

///
/// Class to Animate the Loading Border as a Placeholder
///
class AnimatedLoadingBorder extends StatefulWidget {
  /// The [child] contained by the AnimatedLoadingBorder
  final Widget child;

  /// Callback that gives the [AnimationController] of the [AnimatedLoadingBorder].
  final ValueChanged<AnimationController>? controller;

  /// Defines the animation duration
  /// Default value [Duration(seconds: 4)]
  final Duration duration;

  /// Defines the corner radius of the border
  /// Default value [0.0]
  final double cornerRadius;

  /// Defines the width of the border
  /// Default value [1]
  final double borderWidth;

  /// Defines the color of the border
  /// Default value [Colors.black]
  final Color borderColor;

  /// Defines the color for the trailing part of the border
  /// Default value [Colors.black]
  final Color trailingBorderColor;

  /// Used to add child widget padding
  /// Default value [EdgeInsets.zero]
  final EdgeInsets padding;

  /// Used to set starting position of SweepGradient
  /// Default value [true]
  final bool startWithRandomPosition;

  /// Used to set starting color of SweepGradient
  /// Default value [true]
  final bool isTrailingTransparent;

  const AnimatedLoadingBorder({
    required this.child,
    this.controller,
    this.duration = const Duration(seconds: 4),
    this.cornerRadius = 0.0,
    this.borderWidth = 1,
    this.borderColor = Colors.black,
    this.trailingBorderColor = Colors.black,
    this.padding = EdgeInsets.zero,
    this.startWithRandomPosition = true,
    this.isTrailingTransparent = true,
    super.key,
  });

  @override
  _AnimatedLoadingBorderState createState() => _AnimatedLoadingBorderState();
}

class _AnimatedLoadingBorderState extends State<AnimatedLoadingBorder>
    with SingleTickerProviderStateMixin {
  /// AnimationController to control animation of widget
  late AnimationController _controller;

  /// Used to control the border color of the widget
  Color borderColor = Colors.transparent;

  @override
  void didUpdateWidget(AnimatedLoadingBorder oldWidget) {
    if (oldWidget != oldWidget) {
      /// Starts the widget animation
      _controller.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();

    /// Setting the border color for the widget
    borderColor = widget.borderColor;

    /// Setting the animation controller of the widget
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addStatusListener((status) {
        /// Used to hide the animation and passing the child widget to this animated widget
        if (status == AnimationStatus.reverse) {
          setState(() {
            /// To hide the animated border
            borderColor = Colors.transparent;
          });
        }
      });

    /// Repeating the widget animation
    _controller.repeat();

    /// Passing the animation controller of the widget
    widget.controller?.call(_controller);
  }

  @override
  void dispose() {
    /// Releasing the animation controller of the widget
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Painting the animated border widget
    return CustomPaint(
      painter: BorderPainter(
        animation: _controller,
        cornerRadius: widget.cornerRadius,
        borderWidth: widget.borderWidth,
        borderColor: borderColor,
        trailingBorderColor: widget.trailingBorderColor,
        isTrailingTransparent: widget.isTrailingTransparent,
        startingPosition:
            widget.startWithRandomPosition ? getRandomNumber() : 0,
      ),
      child: Padding(
        padding: widget.padding,
        child: widget.child,
      ),
    );
  }

  /// Generate the starting position that used in SweepGradient
  int getRandomNumber() {
    var random = math.Random();
    return (random.nextInt(20) + 6);
  }
}

///
/// Class to Paint the Animated Loading Border
///
class BorderPainter extends CustomPainter {
  /// Animation of the AnimationController
  final Animation animation;

  /// Corner radius of the border
  final double cornerRadius;

  /// Width of the border
  final double borderWidth;

  /// Color of the border
  final Color borderColor;

  /// Color for the trailing part of the border
  final Color trailingBorderColor;

  /// Used to set starting color of SweepGradient
  final bool isTrailingTransparent;

  /// Starting position used in SweepGradient
  final int startingPosition;

  BorderPainter({
    required this.animation,
    required this.cornerRadius,
    required this.borderWidth,
    required this.borderColor,
    required this.trailingBorderColor,
    required this.isTrailingTransparent,
    required this.startingPosition,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    /// Painting the border
    final rect = Offset.zero & size;
    final paint = Paint()..color = Colors.transparent;
    final progress = animation.value;

    if (progress > 0.0) {
      paint.color = trailingBorderColor;
      paint.shader = SweepGradient(
        colors: [
          isTrailingTransparent
              ? Colors.transparent
              : borderColor.withOpacity(0.1),
          borderColor,
          Colors.transparent,
        ],
        stops: const [
          0.0,
          1.0,
          1.0,
        ],
        startAngle: math.pi / 8,
        endAngle: math.pi / 2,
        transform: GradientRotation(
          (math.pi * 2 * progress) + startingPosition,
        ),
      ).createShader(rect);
    }

    var rRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(cornerRadius),
    );

    final path = Path()..addRRect(rRect);

    canvas.drawRRect(
      rRect,
      paint
        ..strokeWidth = borderWidth
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => true;
}
