import 'package:fahasa_app/constants/globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  String _phoneNumber = '';

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  void _handleLoginSuccess(PhoneAuthCredential credential) async {
    print('In handle login success`');
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushNamed(context, toMainScreen);
  }

  void _handleLoginFail(FirebaseAuthException e) {
    if (e.code == 'invalid-phone-number') {
      _showToast(
          context, 'Auth Failed!', 'The provided phone number is not valid.');
    }

    _showToast(context, 'Login Error', e.code);
  }

  void _handleCodeSent(String verificationId, int? resendToken) {
    // Update the UI - wait for the user to enter the SMS code
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
          phoneNumber: '+84${_phoneNumber.substring(1)}',
        ),
      ),
    );
    // String smsCode = '051001';

    // // Create a PhoneAuthCredential with the code
    // PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //     verificationId: verificationId, smsCode: smsCode);

    // // Sign the user in (or link) with the credential
    // _handleLoginSuccess(credential);
  }

  void _handleAutoRetrieve(String verificationId) {
    // Auto-resolution timed out...
  }

  void _showToast(BuildContext context, String label, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
            label: label, onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/splash.png',
                    width: 55,
                  ),
                  Container(
                    child: const Text(
                      'Welcome\nBack',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                    margin: const EdgeInsets.only(left: 12),
                  )
                ],
              ),
              Container(
                child: const Text('Phone Number',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    )),
                margin: const EdgeInsets.only(top: 40, bottom: 12),
              ),
              Material(
                child: TextField(
                  style: const TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.stars,
                      color: Theme.of(context).primaryColor,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    labelText: 'Enter your number',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) => {
                    setState(() => _phoneNumber = value),
                  },
                ),
                elevation: 5,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                            phoneNumber: '+84' + _phoneNumber.substring(1),
                            verificationCompleted: _handleLoginSuccess,
                            verificationFailed: _handleLoginFail,
                            codeSent: _handleCodeSent,
                            codeAutoRetrievalTimeout: _handleAutoRetrieve,
                            timeout: const Duration(seconds: 60));
                        // Navigator.pushNamed(context, toMainScreen);
                      },
                      color: Theme.of(context).colorScheme.primary,
                      textColor: Colors.white,
                      child: const Icon(
                        Icons.arrow_right_alt_rounded,
                        size: 25,
                      ),
                      padding: const EdgeInsets.all(16),
                      shape: const CircleBorder(),
                    )
                  ],
                ),
                margin: const EdgeInsets.symmetric(vertical: 35),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  children: [
                    const TextSpan(text: 'Doesn\'t have any account? '),
                    TextSpan(
                      text: 'Register here!',
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => Navigator.pushNamed(context, toRegister),
                    )
                  ],
                ),
              ),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    'Use the application accoring to policy rules.\nAny kinds of violations will be subject to sanctions.',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
