import 'package:flutter/material.dart';

class TatetiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TA TE TI'),
      ),
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          color: Colors.white,
          child: CustomPaint(
            painter: MyPainter(),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint()
      ..color = Color(0xff21232A)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = new Path();

    path.moveTo(size.width * 0.3333, 0);
    path.lineTo(size.width * 0.3333, size.height);

    path.moveTo(size.width * 0.6666, 0);
    path.lineTo(size.width * 0.6666, size.height);

    path.moveTo(0, size.height * 0.3333);
    path.lineTo(size.width, size.height * 0.3333);

    path.moveTo(0, size.height * 0.6666);
    path.lineTo(size.width, size.height * 0.6666);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) =>
      true; //redibuja el custompainter.

}
