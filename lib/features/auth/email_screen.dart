import 'package:assignment/common/cistom_button.dart';
import 'package:flutter/material.dart';
import 'package:assignment/constants/const.dart';

class EmailScreen extends StatefulWidget {
  static const String routeName = '/email';

  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

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
                      'Verify your E-mail',
                      style: TextStyle(
                        fontSize: 36,
                        color: Constants.textColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We will send you a verification email on this id',
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
                'Your Preferred E-mail',
                style: TextStyle(
                  fontSize: 18,
                  color: Constants.textColor,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'E-Mail',
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
                          return 'Enter your email';
                        }
                        return null;
                      },
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Didn't receive a mail? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Constants.textColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Resend Mail tapped');
                    },
                    child: const Text(
                      'Resend Mail',
                      style: TextStyle(
                        fontSize: 16,
                        color: Constants.btnColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Verify E-Mail',
                color: Constants.btnColor,
                onTap: () {
                  Navigator.of(context).pushNamed('/business');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
