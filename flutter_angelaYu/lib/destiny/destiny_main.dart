import 'package:flutter/material.dart';
import 'package:test2app/destiny/story_brain.dart';

StoryBrain storyBrain = StoryBrain();

class Destiny extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("image/destiny/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: DestinyQuestion()
      ),
    );
  }
}

class DestinyQuestion extends StatefulWidget {
  @override
  _DestinyQuestionState createState() => _DestinyQuestionState();
}

class _DestinyQuestionState extends State<DestinyQuestion> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text('Main Page',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0
                    ),
                  )
                ],
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(storyBrain.getStory(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 350,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.pressChoice1();
                    });
                  },
                  child: Text(storyBrain.getChoice1(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0
                  ),),
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ButtonTheme(
                minWidth: 350,
                height: 50,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.pressChoice2();
                    });
                  },
                  child: Text(storyBrain.getChoice2(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0
                  ),),
                  color: Colors.greenAccent,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



//backgroundColor: Image.asset(''),
//appBar: AppBar(
//backgroundColor: Colors.transparent,
//elevation: 0.0,
//title: Text(
//'Choose Your Destiny',
//style: TextStyle(
//color: Colors.black,
//fontFamily: 'SourceSansPro',
//fontSize: 20.0,
//fontWeight: FontWeight.bold
//),
//),
//),