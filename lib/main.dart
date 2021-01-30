import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Well Made'),
            ),
            body: Center(
              child: Image(
                image: NetworkImage(
                    "https://blogpfthumb-phinf.pstatic.net/MjAxNzA4MDJfMTUg/MDAxNTAxNjMwNDY0Njg3.8WjR-1XjuHBDa1NrcGsXc52Yl_iqmN_UvXqP6_qRMKAg.UV8T-DjbKgtnT6LvGhsRUludiK_PJxo0eVk5VQ3yBksg.JPEG.naverlaw/Untitled-3-01.jpg?type=w161"),
              ),
            )));
  }
}
