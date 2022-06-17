import 'package:fahasa_app/constants/globals.dart';
import 'package:fahasa_app/containers/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _phoneNumber = '';
  String _address = '';
  String _fullName = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(55, 100, 55, 100),
        children: [
          Column(
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
                      'Welcome\nTo Fahasa',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
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
                      Icons.phone_rounded,
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
                  onChanged: (value) => setState(
                    () {
                      _phoneNumber = value;
                    },
                  ),
                ),
                elevation: 5,
              ),
              Container(
                child: const Text('Full Name',
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
                      Icons.person_outline_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    labelText: 'Enter your name',
                  ),
                  onChanged: (value) => setState(
                    () {
                      _fullName = value;
                    },
                  ),
                ),
                elevation: 5,
              ),
              Container(
                child: const Text('Address',
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
                      Icons.location_on_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    labelText: 'Enter your address...',
                  ),
                  onChanged: (value) => setState(
                    () {
                      _address = value;
                    },
                  ),
                ),
                elevation: 5,
              ),
              Container(
                child: const Text('Email',
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
                      Icons.email_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    labelText: 'Enter your email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  onChanged: (value) => setState(
                    () {
                      _email = value;
                    },
                  ),
                ),
                elevation: 5,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () => _verifyPhoneNumber(context),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      children: [
                        const TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Login here!',
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pop(context),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 60),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                          text:
                              'By registering your account, you are agree to our\n'),
                      TextSpan(
                        text: 'terms of service',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _verifyPhoneNumber(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: '+84 $_phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);

        Navigator.pushNamed(context, toMainScreen);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          showDialog(
            context: context,
            builder: (context) => StatefulBuilder(
              builder: (context, setDialogState) => AlertDialog(
                title: const Text('Gender'),
                content: const Text('Not a valid phone number.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          );
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTPScreen(
              verificationId: verificationId,
              phoneNumber: _phoneNumber,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
