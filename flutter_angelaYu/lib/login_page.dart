import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Login Page'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0)),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      minRadius: 70,
                      child: Image(
                        image: AssetImage('image/chicken2.png'),
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Form(
                      child: Theme(
                          data: ThemeData(
                              primaryColor: Colors.redAccent,
                              inputDecorationTheme: InputDecorationTheme(
                                  labelStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 15.0))),
                          child: Container(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              children: [
                                TextField(
                                  controller: controller,
                                  decoration:
                                  InputDecoration(labelText: 'Email Address'),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextField(
                                  controller: controller2,
                                  decoration: InputDecoration(
                                      labelText: 'Password'),
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                ),
                                SizedBox(
                                  height: 100.0,
                                ),
                                ButtonTheme(
                                  child: RaisedButton(
                                      color: Colors.white,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              18.0),
                                          side: BorderSide(
                                              color: Colors.redAccent)),
                                      child: Container(
                                        width: 100.0,
                                        child: Row(
                                          children: [
                                            Icon(Icons.arrow_forward,
                                              color: Colors.redAccent,),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Text('Login',
                                              style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 16.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      onPressed: () {
                                        if (controller.text == 'dice' &&
                                            controller2.text == '1234') {
                                          Navigator.pushReplacementNamed(context, '/a');
                                        } else if (controller.text != 'dice' &&
                                            controller2.text == '1234') {
                                          showSnackBar2(context);

                                        } else if (controller.text == 'dice' &&
                                            controller2.text != '1234') {
                                          showSnackBar3(context);

                                        } else {
                                          showSnackBar(context);
                                        }
                                      }),
                                )
                              ],
                            ),
                          )))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context){
  Scaffold.of(context).showSnackBar(
      SnackBar(content:
        Text('로그인 정보를 다시 확인하세요',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      )
  );
}

void showSnackBar2(BuildContext context){
  Scaffold.of(context).showSnackBar(
      SnackBar(content:
      Text('아이디가 일치하지 않습니다.',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      )
  );
}

void showSnackBar3(BuildContext context){
  Scaffold.of(context).showSnackBar(
      SnackBar(content:
      Text('비밀번호가 일치하지 않습니다.',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      )
  );
}
