import 'package:flutter/material.dart';
import 'package:wink_study/shared/constants.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  login_Gradient1,
                  login_Gradient2,
                  login_Gradient3,
                  login_Gradient4,
                ])),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  buildNameTextField(),
                  SizedBox(
                    height: 30,
                  ),
                  buildPhoneNoField(),
                  SizedBox(
                    height: 30,
                  ),
                  buildEmailField(),
                  SizedBox(
                    height: 30,
                  ),
                  buildPWField('PassWord', 'Enter your Password'),
                  SizedBox(
                    height: 30,
                  ),
                  buildPWField('Confirm PassWord', 'Confirm Password'),
                  SizedBox(
                    height: 20,
                  ),
                  buildRegisterBtn(),
                  SizedBox(
                    height: 40,
                  ),
                  buildSignInText(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column buildPWField(password, confirmPW) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          password,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: loginBoxDeco,
          height: 60,
          child: TextField(
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.vpn_key,
                  color: Colors.white,
                ),
                hintText: confirmPW,
                hintStyle: TextStyle(
                  color: Colors.white54,
                )),
          ),
        )
      ],
    );
  }

  Column buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: loginBoxDeco,
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your Email',
                hintStyle: TextStyle(
                  color: Colors.white54,
                )),
          ),
        )
      ],
    );
  }

  Column buildPhoneNoField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone No',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: loginBoxDeco,
          height: 60,
          child: TextField(
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  color: Colors.white,
                ),
                hintText: 'Enter your Phone no',
                hintStyle: TextStyle(
                  color: Colors.white54,
                )),
          ),
        )
      ],
    );
  }

  Widget buildSignInText() {
    return GestureDetector(
      onTap: () {
        print('당신은 로그인을 눌렀습니다');
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: 'Have an Account?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Sign in',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
          elevation: 5.0,
          onPressed: () {
            print('press login btn');
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: Text(
            'REGISTER',
            style: TextStyle(
              color: btnTextColor,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          )),
    );
  }

  Widget buildNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Full Name',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: loginBoxDeco,
          height: 60,
          child: TextField(
            keyboardType: TextInputType.text,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.perm_identity,
                  color: Colors.white,
                ),
                hintText: 'Enter your Name',
                hintStyle: TextStyle(
                  color: Colors.white54,
                )),
          ),
        )
      ],
    );
  }
}
