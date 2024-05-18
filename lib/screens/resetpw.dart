import 'package:bikepulse/screens/home.dart';
import 'package:bikepulse/screens/login.dart';
import 'package:bikepulse/signin_components/core/colors.dart';
import 'package:bikepulse/signin_components/core/space.dart';
import 'package:bikepulse/signin_components/core/text_style.dart';
import 'package:bikepulse/signin_components/widget/main_button.dart';
import 'package:bikepulse/signin_components/widget/text_field.dart';
import 'package:flutter/material.dart';

class ResetPwPage extends StatefulWidget {
  const ResetPwPage({Key? key}) : super(key: key);

  @override
  _ResetPwPageState createState() => _ResetPwPageState();
}

class _ResetPwPageState extends State<ResetPwPage> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reEnterPasswordController = TextEditingController();

  String? _currentPasswordError;
  String? _newPasswordError;
  String? _reEnterPasswordError;

  bool _validateInputs() {
    setState(() {
      _currentPasswordError = null;
      _newPasswordError = null;
      _reEnterPasswordError = null;
    });

    bool isValid = true;

    if (currentPasswordController.text.isEmpty) {
      setState(() {
        _currentPasswordError = 'Please enter your current password';
      });
      isValid = false;
    }

    if (newPasswordController.text.isEmpty) {
      setState(() {
        _newPasswordError = 'Please enter a new password';
      });
      isValid = false;
    } else if (newPasswordController.text.length < 8) {
      setState(() {
        _newPasswordError = 'Password must be at least 8 characters long';
      });
      isValid = false;
    }

    if (reEnterPasswordController.text.isEmpty) {
      setState(() {
        _reEnterPasswordError = 'Please re-enter your new password';
      });
      isValid = false;
    } else if (reEnterPasswordController.text != newPasswordController.text) {
      setState(() {
        _reEnterPasswordError = 'Passwords do not match';
      });
      isValid = false;
    }

    return isValid;
  }

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
                'Reset Password',
                style: headline1,
              ),
              SpaceVH(height: 10.0),
              Text(
                'Reset your password by setting up a new password',
                style: headline3,
              ),
              SpaceVH(height: 60.0),
              Column(
                children: [
                  textFild(
                    controller: currentPasswordController,
                    image: 'visibility.svg',
                    isObs: true,
                    hintTxt: 'Current Password',
                  ),
                  if (_currentPasswordError != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        _currentPasswordError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  SpaceVH(height: 20.0),
                  textFild(
                    controller: newPasswordController,
                    image: 'visibility.svg',
                    isObs: true,
                    hintTxt: 'New Password',
                  ),
                  if (_newPasswordError != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        _newPasswordError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  SpaceVH(height: 20.0),
                  textFild(
                    controller: reEnterPasswordController,
                    image: 'visibility.svg',
                    isObs: true,
                    hintTxt: 'Re-Enter Password',
                  ),
                  if (_reEnterPasswordError != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        _reEnterPasswordError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                ],
              ),
              SpaceVH(height: 50.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Mainbutton(
                      onTap: () {
                        if (_validateInputs()) {
                          // Implement your password reset logic here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        }
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
                            builder: (builder) => LoginPage(),
                          ),
                        );
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
