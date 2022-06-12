import 'package:fahasa_app/constants/globals.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                      'Welcome\nBack',
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
                      // contentPadding: EdgeInsets.all(5)
                    ),
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
              Row(children: [
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
                    ])),
              ]),
              Container(
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
                              'Welcome\nBack',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              labelText: 'Enter your number',
                              // contentPadding: EdgeInsets.all(5)
                            ),
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
                      Row(children: [
                        RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                children: [
                              const TextSpan(
                                  text: 'Doesn\'t have any account? '),
                              TextSpan(
                                text: 'Register here!',
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      Navigator.pushNamed(context, toRegister),
                              )
                            ])),
                      ]),
                      Container(
                        margin: const EdgeInsets.only(top: 60),
                        child: const Text(
                          'Use the application accoring to policy rules.\nAny kinds of violations will be subject to sanctions.',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 60),
                child: const Text(
                  'Use the application accoring to policy rules.\nAny kinds of violations will be subject to sanctions.',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          )),
    );
  }
}
