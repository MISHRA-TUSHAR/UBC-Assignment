import 'package:assignment/common/cistom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:assignment/constants/const.dart';

class OTPScreen extends StatefulWidget {
  static const String routeName = '/otp';

  const OTPScreen({
    super.key,
  });

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FadeTransition(
                opacity: Tween<double>(
                  begin: 0.0,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    parent: ModalRoute.of(context)!.animation!,
                    curve: Curves.easeOut,
                  ),
                ),
                child: Hero(
                  tag: 'splashImage',
                  child: Image.asset(
                    'assets/splash.jpg',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Verification',
                      style: TextStyle(
                        fontSize: 36,
                        color: Constants.textColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Please enter 4 digit OTP sent via SMS here',
                      style: TextStyle(
                        fontSize: 14,
                        color: Constants.textColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Enter OTP here',
                      style: TextStyle(
                        fontSize: 16,
                        color: Constants.textColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            OtpTextField(
                              numberOfFields: 4,
                              borderColor: Constants.textColor,
                              focusedBorderColor: Constants.textColor,
                              showFieldAsBox: true,
                              onCodeChanged: (String code) {},
                              onSubmit: (String verificationCode) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text("Verification Code"),
                                      content: Text(
                                          'Code entered is $verificationCode'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "Didn't receive OTP? ",
                              style: TextStyle(
                                fontSize: 16,
                                color: Constants.textColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                print('Resend OTP tapped');
                              },
                              child: const Text(
                                'Resend OTP',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Constants.btnColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomButton(
                  text: 'Verify OTP',
                  color: Constants.btnColor,
                  onTap: () {
                    Navigator.of(context).pushNamed('/email');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
