import 'package:fahasa_app/constants/globals.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: const EdgeInsets.fromLTRB(55, 100, 55, 100),
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
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        labelText: 'Enter your number',
                        contentPadding: EdgeInsets.all(15)),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ]),
                elevation: 20,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      onPressed: () {},
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
                margin: const EdgeInsets.only(top: 35, bottom: 35),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                RichText(
                    text: TextSpan(
                        style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                      const TextSpan(text: 'Already have an account? '),
                      TextSpan(
                        text: 'Login here!',
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pushNamed(context, toLogin),
                      )
                    ])),
              ]),
              Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    'By registering your account, you are agree to our\n'),
                            TextSpan(
                                text: 'terms of service',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold))
                          ])))
            ],
          )),
    );
  }
}
