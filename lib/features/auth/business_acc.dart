import 'package:assignment/common/blank.dart';
import 'package:assignment/common/cistom_button.dart';
import 'package:flutter/material.dart';
import 'package:assignment/constants/const.dart';

class BusinessAccScreen extends StatefulWidget {
  static const String routeName = '/business';

  const BusinessAccScreen({super.key});

  @override
  State<BusinessAccScreen> createState() => _BusinessAccScreenState();
}

class _BusinessAccScreenState extends State<BusinessAccScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController gstController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: 'splashImage',
                child: Image.asset(
                  'assets/splash.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Business Account',
                      style: TextStyle(
                        fontSize: 36,
                        color: Constants.textColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Provide the following information to create a \nBusiness Account',
                      style: TextStyle(
                        fontSize: 14,
                        color: Constants.textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Your Company Name',
                style: TextStyle(
                  fontSize: 18,
                  color: Constants.textColor,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Company Name',
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
                    return 'Enter your company name';
                  }
                  return null;
                },
                maxLines: 1,
              ),
              const SizedBox(height: 10),
              const Text(
                'GSTIN (Optional)',
                style: TextStyle(
                  fontSize: 18,
                  color: Constants.textColor,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: gstController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'GSTIN',
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
                maxLines: 1,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Create Profile',
                color: Constants.btnColor,
                onTap: () {
                  Navigator.of(context).pushNamed('/business');
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: 'Create a Personal Account',
                color: Colors.blueGrey,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BlankScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
