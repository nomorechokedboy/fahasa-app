import 'package:fahasa_app/components/button.dart';
import 'package:fahasa_app/constants/globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({
    Key? key,
    required this.phoneNumber,
    required this.verificationId,
  }) : super(key: key);

  final String phoneNumber;
  final String verificationId;

  @override
  State<StatefulWidget> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final List<String> _otpValues = List<String>.generate(4, (int _index) => '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Authentication'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 100),
        child: Column(
          children: [
            const Center(
              child: Text(
                'Verify Phone Number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Text(
                'We have send OTP to ${widget.phoneNumber}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _OTPTextField(
                  onChanged: (value) => _otpValues[0] = value,
                ),
                _OTPTextField(
                  onChanged: (value) => _otpValues[1] = value,
                ),
                _OTPTextField(
                  onChanged: (value) => _otpValues[2] = value,
                ),
                _OTPTextField(
                  onChanged: (value) => _otpValues[3] = value,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  children: [
                    const TextSpan(text: 'Didn\'t receive OTP? '),
                    TextSpan(
                      text: 'Re-send!',
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => Navigator.pushNamed(context, toRegister),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            FaButton(
              onPressed: () async {
                final smsCode = _otpValues.join();

                FirebaseAuth auth = FirebaseAuth.instance;
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId, smsCode: smsCode);

                await auth.signInWithCredential(credential);
              },
              label: 'Verify',
              width: 220,
            )
          ],
        ),
      ),
    );
  }
}

class _OTPTextField extends StatelessWidget {
  const _OTPTextField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Material(
        child: TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
          ),
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          onChanged: onChanged,
        ),
        elevation: 5,
      ),
    );
  }
}
