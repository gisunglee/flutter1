import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter{

  // 생성자
  LoginBackground({@required this.isJoin});

  final bool isJoin;


  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = isJoin?Colors.red : Colors.blue; // .. 쩜쩜 뜻은 Paint()를 생성하고 그 안에 color 에 값 넣어줘
    canvas.drawCircle(Offset(200, 70), size.height*0.5, paint); // 배경에 파랗고 동그란 원을 그림
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // 계속 뒷 배경을 새로 그리니 마니
    return false;
  }

}
