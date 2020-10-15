import 'package:flutter/material.dart';

class MiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            'Mi Card',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        body: SafeArea(
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                radius: 70.0,
                backgroundImage: ExactAssetImage('image/profile.jpg'),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Minki Kim',
                style: TextStyle(fontSize: 32.0, fontFamily: 'Pacifico'),
              ),
              Container(
                width: 150,
                child: Center(
                  child: Text(
                    'Flutter Developer',
                    style: TextStyle(
                        wordSpacing: 5.0,
                        letterSpacing: 1.0,
                        fontSize: 16.0,
                        fontFamily: 'SourceSansPro',
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
                child: Divider(
                  color: Colors.redAccent[100],
                  indent: 50.0,
                  endIndent: 50.0,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                decoration: BoxDecoration(color: Colors.grey[200], boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2))
                ]),
                width: 300.0,
                height: 40.0,
                child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone_forwarded,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Center(
                      child: Text(
                        '010-1111-1111',
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontStyle: FontStyle.italic,
                            color: Colors.redAccent,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                decoration: BoxDecoration(color: Colors.grey[200], boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2))
                ]),
                width: 300.0,
                height: 40.0,
                child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Center(
                      child: Text(
                        'flutter@gmail.com',
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontStyle: FontStyle.italic,
                            color: Colors.redAccent,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 55.0),
                color: Colors.grey[200],
                child: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone_forwarded,
                        color: Colors.redAccent,
                      ),
                      title: Text(
                        '010-1111-1111',
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontStyle: FontStyle.italic,
                            color: Colors.redAccent,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ]),
          ),
        ));
  }
}
