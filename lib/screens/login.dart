import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/data/join_or_login.dart';
import 'package:startup_namer/helper/login_background.dart';
import 'package:startup_namer/screens/forget_pwd.dart';
import 'package:startup_namer/screens/main_page.dart';


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
        painter: LoginBackground(isJoin: Provider.of<JoinOrLogin>(context).isJoin),
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
          Consumer<JoinOrLogin>(
            /*
            이걸 아래처럼 표현 가능
            builder: (BuildContext context, JoinOrLogin value, Widget child)=> GestureDetector(
                onTap: (){
                  JoinOrLogin joinOrLogin = Provider.of<JoinOrLogin>(context, listen: false);
                  joinOrLogin.toggle();
                },
             */
            builder: (context, joinOrLogin, child)=> GestureDetector(
                onTap: (){
                  joinOrLogin.toggle();
                },
                child: Text(joinOrLogin.isJoin?"Already Have an Account? Sign in":"Don't Have an Account:? Create One",
                style: TextStyle(color: joinOrLogin.isJoin?Colors.red:Colors.blue))),
          ),
          Container(
            height: size.height * 0.5,
          )
        ],
      )
    ]));
  }

  void _register(BuildContext context) async {
     final UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passworkdController.text);
     final User user = result.user;

     if(user == null){
        final snacBar = SnackBar(content: Text('Please try again later.'),);
        Scaffold.of(context).showSnackBar(snacBar);
     }

     // 뭐 이런것도 되는데 다른 방법으로 한데
     // Navigator.push(context, MaterialPageRoute(builder: (Context)=>MainPage(email:user.email)))
  }

  void _login(BuildContext context) async {
     final UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passworkdController.text);
     final User user = result.user;

     if(user == null){
        final snacBar = SnackBar(content: Text('Please try again later.'),);
        Scaffold.of(context).showSnackBar(snacBar);
     }

     // 뭐 이런것도 되는데 다른 방법으로 한데
     // Navigator.push(context, MaterialPageRoute(builder: (Context)=>MainPage(email:user.email)))
  }

  Widget get _logoImage => Container(
    height: 250,
    child: Padding(
      padding: const EdgeInsets.only(top: 30),
      child: CircleAvatar(
        maxRadius: 350,
        // backgroundImage: AssetImage("assets/login.gif"),
        backgroundImage: NetworkImage("https://picsum.photos/300", scale: 120),
      ),
    ),
  );


  Widget _authButton(Size size) => Positioned(
        left: size.width * 0.15,
        right: size.width * 0.15,
        bottom: 0,
        child: SizedBox(
          height: 50,
          child: Consumer<JoinOrLogin>(
            builder: (context, joinOrLogin, child) => RaisedButton(
                child: Text(
                  joinOrLogin.isJoin?"Join":"Login",
                  style: TextStyle(fontSize: 20, color: Colors.white),),
                color: joinOrLogin.isJoin?Colors.red:Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  if(_formKey.currentState.validate()){
                    joinOrLogin.isJoin?_register(context):_login(context);
                  }
                }),
          ),
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
                  Consumer<JoinOrLogin>(
                    builder: (context, value, child) => Opacity(
                        opacity: value.isJoin?0:1,
                        child: GestureDetector(
                            onTap: value.isJoin?null:(){goToForgetPw(context);}  ,
                            child: Text("Forget Password"))),
                  ), 
                ],
              )),
        ),
      ),
    );
  }


  goToForgetPw(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPw()));
  }

}
