import 'package:flutter/material.dart';
import 'package:wink_study/screens/loginin.dart';

void main() => runApp(WinkStudy());

class WinkStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'hi wink study',
      home: LoginIn(),
    );
  }
}