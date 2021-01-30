import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue; // .. 쩜쩜 뜻은 Paint()를 생성하고 그 안에 color 에 값 넣어줘
    canvas.drawCircle(Offset(0, 0), size.height*0.5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 계속 뒷 배경을 새로 그리니 마니
    return false;
  }

}
