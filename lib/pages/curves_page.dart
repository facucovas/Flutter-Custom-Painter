import 'package:flutter/material.dart';

class CurvesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CURVES'),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: .4,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: CustomPaint(
                painter: MyPainterRight(),
              ),
            ),
          ),
          Opacity(
            opacity: .5,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: CustomPaint(
                painter: MyPainterLeft(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainterRight extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _rightCurve(canvas, size);
  }

  @override
  bool shouldRepaint(MyPainterRight oldDelegate) => true;

  void _rightCurve(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Color(0xff80f5ff)
      ..style = PaintingStyle.fill //Stroke draw a line.
      ..strokeWidth = 10.5;

    final path = new Path();

    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.1,
      size.width * 0.6,
      size.height * 0.2,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.27,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }
}

class MyPainterLeft extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _curve(canvas, size);
  }

  @override
  bool shouldRepaint(MyPainterLeft oldDelegate) => true;

  void _curve(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Color(0xfff42069)
      ..style = PaintingStyle.fill //Stroke draw a line.
      ..strokeWidth = 10.5;

    final path = new Path();

    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.3,
      size.width * 0.6,
      size.height * 0.2,
    );
    path.quadraticBezierTo(
      size.width * 0.85,
      size.height * 0.1,
      size.width,
      size.height * 0.15,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }
}
