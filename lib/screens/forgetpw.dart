import 'package:bikepulse/screens/entercode.dart';
import 'package:bikepulse/screens/login.dart';
import 'package:bikepulse/screens/signin.dart';
import 'package:bikepulse/signin_components/core/colors.dart';
import 'package:bikepulse/signin_components/core/space.dart';
import 'package:bikepulse/signin_components/core/text_style.dart';
import 'package:bikepulse/signin_components/widget/main_button.dart';
import 'package:bikepulse/signin_components/widget/text_field.dart';
import 'package:flutter/material.dart';


class ForgetPwPage extends StatefulWidget {
  const ForgetPwPage({Key? key}) : super(key: key);

  @override
  _ForgetPwPageState createState() =>  _ForgetPwPageState();
}

class   _ForgetPwPageState  extends State<ForgetPwPage> {
   TextEditingController userEmail = TextEditingController();
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
                'Forgot Password?',
                style: headline1,
              ),
              SpaceVH(height: 10.0),
              Text(
                'Enter your email for the verification process.We will send 4-digits code to your email.',
                style: headline3,
              ),
              SpaceVH(height: 60.0),
              textFild(
                controller: userEmail,
                image: 'user.svg',
                hintTxt: 'Email Address',
              ),
            
            
              SpaceVH(height: 100.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Mainbutton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EnterCodePage(),
                        ),
                      );
                    },
                    btnColor: blueButton,
                    text: 'Continue',
                  ),
                  
                    
                    SpaceVH(height: 20.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => LoginPage()));
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Already Have an Account? ',
                            style: headline.copyWith(
                              fontSize: 14.0,
                            ),
                          ),
                          TextSpan(
                            text: ' Log in',
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