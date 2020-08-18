import 'package:flutter/material.dart';

void main() => runApp(WinkStudy());

class WinkStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'hi wink study',
      home: WinkScreen(),
    );
  }
}

class WinkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent[100],
      appBar: AppBar(
        title: Text('BlackPink',
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300,
          letterSpacing: 10,
          color: Colors.pinkAccent[100],
        ),
        ),
        backgroundColor: Colors.black54,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
            child: Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/jennie.jpg'),
                radius: 100,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
                child: Divider(
                  height: 60,
                  color: Colors.grey[900],
                  thickness: 0.5,
                  endIndent: 30.0,
                ),
              ),
              Text(
                'NAME',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 9.0,
              ),
              Text(
                'Jennie',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                'Age',
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 9.0,
              ),
              Text(
                '25',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          buildList('출생: 1996년 1월 16일 (만 24세)'),
          buildList('키: 163cm'),
          buildList('본명: Jennie Kim'),
          buildList('국적: 대한민국'),
        ],
      ),
    );
  }

  Padding buildList(text) {
    return Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.play_circle_filled),
              SizedBox(
                width: 10.0,
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        );
  }
}
