import 'package:flash_chat/components/button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  // Navigator pushedNamed를 id 라는 변수로 생성해둠.
  static const String id = 'welcomeScreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// Thanks to 'with', _WelcomeScreenState act like TickerProvider.
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      // 'vsync' find tickerProvider, and this time, WelcomeScreenState is a tickerProvider because of 'with'
      // 이미 WelcomeScreenState에 tickerProvider가 있기 때문에, 이를 참조하기 위해선 단순히 'this'라는 키워드를 사용하면 된다.
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
    );

    animation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);

    // ########### 애니메이션1

//    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
//
//    controller.forward();
//
//    // animation이 끝났는지 알려주는 코드
//    // 아래의 if else 문을 사용하면 애니메이션을 반복할 수 있음.
//    // 그러나 아래의 코드를 실행시키면 이는 무한으로 애니메이션이 실행됨.
//    // 따라서 dispose를 이용하여 멈춰주는 것이 필요함.
//    animation.addStatusListener((status) {
//      if (status == AnimationStatus.completed) {
//        // forward를 통해 animation이 끝났을 때, 거꾸로 실행시켜라
//        controller.reverse(from : 1.0);
//      }else if (status == AnimationStatus.dismissed) {
//        // reverse에 의해 처음으로 돌아왔을 때 다시 진행시켜라.
//        controller.forward();
//      }
//    });

    // ###########

    // 거꾸로 해주는 것.
//    controller.reverse(from: 1.0);

    // controller가 진행되게끔 하는 코드.
    // Duration의 seconds가 1이므로 lowerBound부터 upperBound까지 총 1초에 걸쳐서 증가시킨다.
    controller.forward();

    controller.addListener(() {
      // controller.value가 바뀔 때마다 state가 변경되어야 하므로 내부에 setState를 선언해주는 것.
      setState(() {});
    });
  }

  // dispose 명령어를 이용하면 해당 화면의 state가 유지될때만 애니메이션이 실행됨.
  // 다른 화면으로 옮겨가면 state가 변경되기 때문에 자동으로 애니메이션이 멈춤
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                // without tag, hero can't know how to animate to other hero widget.
                // 따라서 tag는 hero만의 context라고 생각하면 편하다.
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  onTap: () {},
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            NormalButton(
                elevationValue: 5.0,
                colour: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                name: Text('Log In')),
            NormalButton(
                elevationValue: 5.0,
                colour: Colors.blueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
                name: Text('Register')),
          ],
        ),
      ),
    );
  }
}
