import 'package:assignment/common/cistom_button.dart';
import 'package:flutter/material.dart';
import 'package:assignment/common/custom_textfield.dart';
import 'package:assignment/constants/const.dart';

class PersonalAccountScreen extends StatefulWidget {
  static const String routeName = '/personal';

  const PersonalAccountScreen({super.key});

  @override
  State<PersonalAccountScreen> createState() => _PersonalAccountScreenState();
}

class _PersonalAccountScreenState extends State<PersonalAccountScreen> {
  TextEditingController nameController = TextEditingController();
  String? _selectedKnowledge;
  String? _selectedGender;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Center(
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
                child: Text(
                  'Personal Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Constants.textColor,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Provide the following information to create a \nPersonal Account',
                  style: TextStyle(
                    fontSize: 16,
                    color: Constants.textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Your Full Name',
                style: TextStyle(
                  fontSize: 16,
                  color: Constants.textColor,
                ),
              ),
              const SizedBox(height: 10),
              CustomTextField(
                controller: nameController,
                hintText: 'Name',
              ),
              const SizedBox(height: 20),
              const Text(
                'Electric and Electronics Product Engineer Knowledge',
                style: TextStyle(
                  fontSize: 16,
                  color: Constants.textColor,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                isExpanded: true,
                value: _selectedKnowledge,
                hint: const Text('Select your knowledge level'),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Constants.btnColor),
                  ),
                ),
                items: <String>[
                  'Beginner',
                  'Intermediate',
                  'Advanced',
                  'Expert'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedKnowledge = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Gender',
                style: TextStyle(
                  fontSize: 16,
                  color: Constants.textColor,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: 'Male',
                    groupValue: _selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    activeColor: Constants.btnColor,
                  ),
                  const Text(
                    'Male',
                    style: TextStyle(
                      fontSize: 16,
                      color: Constants.textColor,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Radio<String>(
                    value: 'Female',
                    groupValue: _selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    activeColor: Constants.btnColor,
                  ),
                  const Text(
                    'Female',
                    style: TextStyle(
                      fontSize: 16,
                      color: Constants.textColor,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Radio<String>(
                    value: 'Other',
                    groupValue: _selectedGender,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    activeColor: Constants.btnColor,
                  ),
                  const Text(
                    'Other',
                    style: TextStyle(
                      fontSize: 16,
                      color: Constants.textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomButton(
                  text: 'Create Profile',
                  color: Constants.btnColor,
                  onTap: () {
                    // Handle form submission here
                  },
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomButton(
                  text: 'Create A Business Account',
                  color: Colors.grey,
                  onTap: () {
                    // Handle form submission here
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
