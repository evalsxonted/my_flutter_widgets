import 'package:flutter/material.dart';

class DescendingAscendingAnimatedIcon extends StatefulWidget {
  final double dimension;
  final VoidCallback function;
  final Color color;

  DescendingAscendingAnimatedIcon(
      {required this.dimension, required this.function, required this.color});

  @override
  State<DescendingAscendingAnimatedIcon> createState() =>
      _DescendingAscendingAnimatedIconState();
}

class _DescendingAscendingAnimatedIconState
    extends State<DescendingAscendingAnimatedIcon> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.function();
        setState(() {
          clicked = !clicked;
        });
      },
      child: Container(
          width: widget.dimension,
          height: widget.dimension,
          child: Stack(
            children: [
              TweenAnimationBuilder(
                tween: Tween<double>(
                    begin: clicked ? widget.dimension / 2 : 0,
                    end: clicked ? 0 : widget.dimension / 2),
                duration: Duration(seconds: 2),
                builder: (context, double value, child) {
                  print(value);
                  return CustomPaint(
                    size: Size(widget.dimension, widget.dimension),
                    painter:
                        AnimatedPainter(widget.dimension, widget.color, value),
                  );
                },
              ),
              CustomPaint(
                size: Size(widget.dimension, widget.dimension),
                painter: FixedPainter(
                    widget.dimension, widget.dimension / 4, widget.color),
              ),
            ],
          )),
    );
  }
}

class AnimatedPainter extends CustomPainter {
  final double dimension;
  final Color paintColor;
  final double value;

  AnimatedPainter(this.dimension, this.paintColor, this.value);

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = paintColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = dimension / 8;
    final curvePath = Path()
      ..moveTo(0, 0)
      ..lineTo(dimension / 2 + value, 0)
      ..moveTo(0, dimension)
      ..lineTo(dimension - value, dimension);
    canvas.drawPath(curvePath, paint1);
  }

  @override
  bool shouldRepaint(covariant FixedPainter oldDelegate) {
    return oldDelegate.value != value;
  }
}

class FixedPainter extends CustomPainter {
  final double dimension;
  final double value;
  final Color paintColor;

  FixedPainter(this.dimension, this.value, this.paintColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = paintColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = dimension / 8;

    final curvePath = Path()
      ..moveTo(0, dimension / 2)
      ..lineTo(dimension - value, dimension / 2);
    canvas.drawPath(curvePath, paint1);
  }

  @override
  bool shouldRepaint(covariant AnimatedPainter oldDelegate) {
    return oldDelegate.value != this.value;
  }
}
