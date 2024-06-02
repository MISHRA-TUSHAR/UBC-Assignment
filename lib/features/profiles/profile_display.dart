import 'package:assignment/common/cistom_button.dart';
import 'package:flutter/material.dart';
import 'package:assignment/constants/const.dart';
import 'package:assignment/features/profiles/loan.dart';
import 'package:assignment/features/profiles/personal_profile.dart';

class ProfileDisplayScreen extends StatelessWidget {
  static const String routeName = '/profile-display';

  const ProfileDisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? userData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (userData != null) ...[
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey[200],
                          child: const Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Personal Account:',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Constants.textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                userData['email'] ?? 'Not provided',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Constants.textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTile(context, 'Account', ProfileDisplayScreen.routeName),
                _buildTile(context, 'Finance', LoanScreen.routeName),
                _buildTile(context, 'Settings', ProfileDisplayScreen.routeName),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow(
                        'Name:', userData?['name'] ?? 'Not provided'),
                    _buildDetailRow('Mobile Number:',
                        '+91 ${userData?['mobile'] ?? 'Not provided'}'),
                    _buildDetailRow(
                        'Date of Birth:', userData?['dob'] ?? 'Not provided'),
                    _buildDetailRow(
                        'Gender:', userData?['gender'] ?? 'Not provided'),
                    _buildDetailRow(
                        'Address:', userData?['address'] ?? 'Not provided'),
                    _buildDetailRow('Knowledge Level:',
                        userData?['knowledge'] ?? 'Not provided'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Edit Profile',
              color: Constants.btnColor,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  PersonalProfileScreen.routeName,
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, String title, String routeName) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Constants.btnColor, width: 2),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Constants.btnColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Constants.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: Constants.textColor,
          ),
        ),
        const SizedBox(height: 10),
        Divider(color: Colors.grey[300], thickness: 1),
      ],
    );
  }
}
