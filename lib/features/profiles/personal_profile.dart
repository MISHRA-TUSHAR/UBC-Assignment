import 'package:assignment/common/cistom_button.dart';
import 'package:assignment/common/custom_textfield.dart';
import 'package:assignment/features/profiles/profile_display.dart';
import 'package:flutter/material.dart';
import 'package:assignment/constants/const.dart';

class PersonalProfileScreen extends StatefulWidget {
  static const String routeName = '/personal-profile';

  const PersonalProfileScreen({super.key});

  @override
  State<PersonalProfileScreen> createState() => _PersonalProfileScreenState();
}

class _PersonalProfileScreenState extends State<PersonalProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String? _selectedGender;
  String? _selectedKnowledge;

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    dobController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        ProfileDisplayScreen.routeName,
        arguments: {
          'name': nameController.text,
          'mobile': mobileController.text,
          'email': emailController.text,
          'dob': dobController.text,
          'gender': _selectedGender,
          'address': addressController.text,
          'knowledge': _selectedKnowledge,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            child: const Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.grey,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Profile Picture',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Constants.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Your Name *',
                  style: TextStyle(fontSize: 16, color: Constants.textColor),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: nameController,
                  hintText: 'Enter your name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Mobile Number *',
                      style:
                          TextStyle(fontSize: 16, color: Constants.textColor),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '+91',
                          style: TextStyle(
                            fontSize: 16,
                            color: Constants.textColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            controller: mobileController,
                            hintText: 'Enter your mobile number',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Mobile number is required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Your Preferred Email *',
                  style: TextStyle(fontSize: 16, color: Constants.textColor),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: emailController,
                  hintText: 'Enter your email address',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Your Date of Birth *',
                  style: TextStyle(fontSize: 16, color: Constants.textColor),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: dobController,
                  hintText: 'Enter your date of birth',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Date of birth is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Your Gender *',
                  style: TextStyle(fontSize: 16, color: Constants.textColor),
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
                const Text(
                  'Your Address *',
                  style: TextStyle(fontSize: 16, color: Constants.textColor),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: addressController,
                  hintText: 'Enter your address',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Electric and Electronics Product Engineer Knowledge *',
                  style: TextStyle(fontSize: 16, color: Constants.textColor),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: _selectedKnowledge,
                  hint: const Text('Select your knowledge level'),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedKnowledge = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Knowledge level is required';
                    }
                    return null;
                  },
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
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'Update Profile',
                  color: Constants.btnColor,
                  onTap: _submitForm,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
