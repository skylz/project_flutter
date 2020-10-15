import 'package:flutter/material.dart';
import 'package:providerlogin/helper/login_background.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: size,
            painter: LoginBackground(),
          ),
          Positioned(
            top: size.height / 4,
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Container(
                child: Text('Login With \nFirebase',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 40.0,
                        color: Colors.white),
                    textAlign: TextAlign.start),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [_inputForm(size), _authBotton(size)],
              ),
              Container(
                height: size.height * 0.1,
              ),
              Container(child: Text("Don't Have An Account? Create One")),
              Container(
                height: size.height * 0.05,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _authBotton(Size size) {
    return Positioned(
      left: size.width * 0.2,
      right: size.width * 0.2,
      bottom: 0,
      child: RaisedButton(
        child: Text(
          'Login',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16.0),
        ),
        color: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          // 밑의 TextFormField의 validator를 실행시킨다음에 ()안의 결과가 true가 나오면 press를 pring하는 것.
          if (_formKey.currentState.validate()) {
            print('button pressed!!');
            // email value 추출
            print(_emailController.text.toString());

            // password value 추출
            print(_passwordController.text.toString());
          }
        },
      ),
    );
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 12.0, bottom: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle), labelText: "Email"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Input Correct Email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key), labelText: "Password"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please Input Correct Password";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Container(
                    height: size.height * 0.02,
                  ),
                  Text("Forgat PassWord")
                ],
              ),
            )),
      ),
    );
  }
}
