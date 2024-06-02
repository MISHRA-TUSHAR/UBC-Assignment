import 'package:assignment/common/cistom_button.dart';
import 'package:flutter/material.dart';
import 'package:assignment/constants/const.dart';

class SigninScreen extends StatefulWidget {
  static const String routeName = '/signin';

  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController mobileController = TextEditingController();

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
                      'Sign in to continue',
                      style: TextStyle(
                        fontSize: 36,
                        color: Constants.textColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We will send you a 4 digit OTP on this number',
                      style: TextStyle(
                        fontSize: 14,
                        color: Constants.textColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Phone Number',
                style: TextStyle(
                  fontSize: 18,
                  color: Constants.textColor,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Constants.textColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      '+91',
                      style: TextStyle(
                        fontSize: 16,
                        color: Constants.textColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Mobile Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black38,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black38,
                          ),
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Enter your mobile number';
                        }
                        return null;
                      },
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Send OTP',
                color: Constants.btnColor,
                onTap: () {
                  if (mobileController.text.isNotEmpty) {
                    Navigator.of(context).pushNamed('/otp');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
