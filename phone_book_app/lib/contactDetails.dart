import 'package:flutter/material.dart';

class ContactDetails {
  String name;
  String phoneNumber;
  String email;
  String imagePath;

  ContactDetails({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.imagePath,
  });
}

class ContactDetailsScreen extends StatelessWidget {
  final ContactDetails contact = ContactDetails(
    name: 'Vikas',
    phoneNumber: '123-456-7890',
    email: 'john.doe@example.com',
    imagePath: 'assets/profile_image.jpg', // Add your image asset path here
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const FlutterLogo(
            // contact.imagePath,
            // fit: BoxFit.cover, // Ensure the image fills the container
            size: 200, // Adjust the height as needed
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Phone: ${contact.phoneNumber}',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Email: ${contact.email}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
