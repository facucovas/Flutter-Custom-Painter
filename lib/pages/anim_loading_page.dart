import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:math';

class AnimLoadingPage extends StatefulWidget {
  @override
  _AnimLoadingPageState createState() => _AnimLoadingPageState();
}

const pi = 3.1415926;
const radio = 20.0;

class _AnimLoadingPageState extends State<AnimLoadingPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = Tween<double>(
      begin: 0,
      end: pi + 2,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    animation.addListener(() {
      setState(() {});
    });

    animationController
        .forward()
        .whenComplete(() => animationController.repeat());
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Loading'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: LoadingPainter(offset: animation.value),
        ),
      ),
    );
  }
}

class LoadingPainter extends CustomPainter {
  final offset;
  LoadingPainter({
    @required this.offset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    double left = offset > pi ? pi : offset;
    Offset leftOffset =
        Offset(size.width / 3, size.height / 2 - 40 * sin(left));
    canvas.drawCircle(leftOffset, radio, paint);

    double center = (offset - 1 > pi) ? pi : offset - 1;
    if (center < 0) {
      center = 0;
    }
    Offset centerOffset =
        Offset(size.width / 2, size.height / 2 - 40 * sin(center));
    canvas.drawCircle(centerOffset, radio, paint);

    double right = offset - 2 < 0 ? 0 : offset - 2;
    Offset rightOffset =
        Offset(size.width * 2 / 3, size.height / 2 - 40 * sin(right));
    canvas.drawCircle(rightOffset, radio, paint);
  }

  @override
  bool shouldRepaint(LoadingPainter oldDelegate) => true;
}
