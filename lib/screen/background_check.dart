import 'package:flutter/material.dart';
import 'personalinfo.dart'; // Import the Personal Info Screen

// Stateless Widget for Background Check Screen
class BackgroundCheckScreen extends StatelessWidget {
  const BackgroundCheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GlobalKey to manage the form state
    final _formKey = GlobalKey<FormState>();
    // Controllers for SSN and Confirm SSN fields
    final TextEditingController ssnController = TextEditingController();
    final TextEditingController confirmSsnController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Check'), // Title for the AppBar
        backgroundColor: Colors.blue, // Background color of the AppBar
      ),
      body: Center(
        child: Container(
          width: 300, // Width of the container holding the form
          padding: const EdgeInsets.all(16.0), // Padding inside the container
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the container
            borderRadius: BorderRadius.circular(8), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 2, // Spread radius of the shadow
                blurRadius: 5, // Blur radius of the shadow
                offset: const Offset(0, 3), // Offset of the shadow
              ),
            ],
          ),
          child: Form(
            key: _formKey, // Attach the GlobalKey to the Form
            child: Column(
              mainAxisSize: MainAxisSize.min, // Minimizes vertical space usage
              children: [
                const Text(
                  'Background Check', // Heading of the form
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue, // Text color
                  ),
                ),
                const SizedBox(height: 16), // Space between elements
                // Date of Birth Field
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Date of birth', // Label for the input field
                    border: OutlineInputBorder(), // Adds a border to the input
                  ),
                  validator: (value) {
                    // Validation for the Date of Birth field
                    if (value == null || value.isEmpty) {
                      return 'Date of birth is required'; // Error message
                    }
                    return null; // No error
                  },
                ),
                const SizedBox(height: 16), // Space between elements
                // SSN/EIN Field
                TextFormField(
                  controller: ssnController, // Controller for SSN input
                  decoration: const InputDecoration(
                    labelText: 'SSN \ EIN', // Label for the input field
                    border: OutlineInputBorder(), // Adds a border to the input
                  ),
                  validator: (value) {
                    // Validation for the SSN/EIN field
                    if (value == null || value.isEmpty) {
                      return 'SSN/EIN is required'; // Error message
                    }
                    return null; // No error
                  },
                ),
                const SizedBox(height: 16), // Space between elements
                // Confirm SSN/EIN Field
                TextFormField(
                  controller: confirmSsnController, // Controller for Confirm SSN input
                  decoration: const InputDecoration(
                    labelText: 'Confirm SSN \ EIN', // Label for the input field
                    border: OutlineInputBorder(), // Adds a border to the input
                  ),
                  validator: (value) {
                    // Validation for Confirm SSN/EIN field
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your SSN/EIN'; // Error message
                    }
                    if (value != ssnController.text) {
                      return 'SSN/EIN does not match'; // Error message if values do not match
                    }
                    return null; // No error
                  },
                ),
                const SizedBox(height: 16), // Space between elements
                // Next Button
                ElevatedButton(
                  onPressed: () {
                    // Validate the form
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, navigate to the Personal Info screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PersonalInfoScreen(), // Navigate to Personal Info Screen
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    minimumSize: const Size(double.infinity, 40), // Button size
                  ),
                  child: const Text('Next'), // Button text
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200], // Background color of the screen
    );
  }
}
