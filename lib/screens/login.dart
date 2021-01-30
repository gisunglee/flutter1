import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:startup_namer/helper/login_background.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passworkdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(alignment: Alignment.center, children: <Widget>[
      CustomPaint( //
        size: size,
        painter: LoginBackground(),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _logoImage,
          Stack(
            children: <Widget>[
              _inputForm(size),
              _authButton(size),
              // Container(width:100, height:50, color: Colors.black,),
            ],
          ),
          Container(
            height: size.height * 0.1,
          ),
          Text("Don't Have an Account:? Create One"),
          Container(
            height: size.height * 0.5,
          )
        ],
      )
    ]));
  }

  Widget get _logoImage => Container(
    height: 200,
    child: CircleAvatar(
      backgroundImage: NetworkImage("https://picsum.photos/200", scale: 100),
    ),
  );


  Widget _authButton(Size size) => Positioned(
        left: size.width * 0.15,
        right: size.width * 0.15,
        bottom: 0,
        child: SizedBox(
          height: 50,
          child: RaisedButton(
              child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.white),),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: () {
                if(_formKey.currentState.validate()){
                  print(_emailController.value.toString());
                  print(_passworkdController.value.toString());
                }
              }),
        ),
      );


  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding:
          const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 32),
          child: Form(
            key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle), labelText: "Email"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please input correct Email.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true, //비밀번호 ** 으로 처리
                    controller: _passworkdController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key), labelText: "Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please input correct Email.";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 8,
                  ),
                  Text("Forget Password"),
                ],
              )),
        ),
      ),
    );
  }

}
