import 'package:bikepulse/screens/forgetpw.dart';
import 'package:bikepulse/screens/signin.dart';
import 'package:bikepulse/signin_components/core/colors.dart';
import 'package:bikepulse/signin_components/core/space.dart';
import 'package:bikepulse/signin_components/core/text_style.dart';
import 'package:bikepulse/signin_components/widget/main_button.dart';
import 'package:bikepulse/signin_components/widget/text_field.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userName = TextEditingController();
  TextEditingController userPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBG,
      body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SpaceVH(height: 50.0),
              Text(
                'Welcome Back!',
                style: headline1,
              ),
              SpaceVH(height: 10.0),
              Text(
                'Please sign in to your account',
                style: headline3,
              ),
              SpaceVH(height: 60.0),
              textFild(
                controller: userName,
                image: 'user.svg',
                hintTxt: 'Username',
              ),
              textFild(
                controller: userPass,
                image: 'hide.svg',
                isObs: true,
                hintTxt: 'Password',
              ),
              SpaceVH(height: 10.0),
             Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => ForgetPwPage(),
              ),
            );
          },
          child: Text(
            'Forgot Password?',
            style: TextStyle(fontSize: 16), // replace with headline3 if defined
          ),
        ),
      ),
    ),
              SpaceVH(height: 100.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Mainbutton(
                      onTap: () {},
                      text: 'Sign in',
                      btnColor: blueButton,
                    ),
                    SpaceVH(height: 20.0),
                    Mainbutton(
                      onTap: () {},
                      text: 'Sign in with google',
                      image: 'google.png',
                      btnColor: white,
                      txtColor: blackBG,
                    ),
                    SpaceVH(height: 20.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => SignUpPage()));
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Don\' have an account? ',
                            style: headline.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: ' Sign Up',
                            style: headlineDot.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                        ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}