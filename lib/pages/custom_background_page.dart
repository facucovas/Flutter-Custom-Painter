import 'package:flutter/material.dart';

class CustomBackgroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Background'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: BackgroundPainter(),
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    Paint paint = new Paint()
      ..color = Colors.pink
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    Path mainBackground = new Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));

    canvas.drawPath(mainBackground, paint);

    Path ovalPath = new Path();

    ovalPath.moveTo(0, height * 0.2);

    ovalPath.quadraticBezierTo(
      height * 0.2,
      width * 0.5,
      width * 0.5,
      height * 0.5,
    );

    ovalPath.quadraticBezierTo(
      width * 0.8,
      height,
      0,
      height,
    );

    paint.color = Colors.pink.shade400;
    canvas.drawPath(ovalPath, paint);

    Offset offsetCircle = Offset(size.width * 0.65, size.height * 0.2);
    paint.color = Colors.pink.shade400;
    canvas.drawCircle(offsetCircle, 50, paint);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => true;
}
