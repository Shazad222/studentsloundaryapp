import 'package:flutter/material.dart';
import 'add_vehicle.dart'; // Import the next screen (AddVehicleScreen)

// Main screen for becoming a driver
class BecomeDriverScreen extends StatefulWidget {
  const BecomeDriverScreen({Key? key}) : super(key: key);

  @override
  _BecomeDriverScreenState createState() => _BecomeDriverScreenState();
}

class _BecomeDriverScreenState extends State<BecomeDriverScreen> {
  // Variables to track the checkbox states
  bool is18OrOlder = false; // Tracks if the user is 18 years or older
  bool canLift = false; // Tracks if the user can lift 30-40 lbs
  bool hasCar = false; // Tracks if the user has a registered car

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Become Driver'), // Title of the AppBar
        backgroundColor: Colors.blue, // Background color of the AppBar
      ),
      body: Center(
        child: Container(
          width: 300, // Width of the container
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
          child: Column(
            mainAxisSize: MainAxisSize.min, // Minimizes vertical space usage
            children: [
              const Text(
                'Become Driver', // Heading text
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Text color
                ),
              ),
              const SizedBox(height: 16), // Space between elements
              // Checkbox for "I am 18 years or older"
              CheckboxListTile(
                title: const Text('I am 18 years or older'), // Checkbox label
                value: is18OrOlder, // Checkbox value
                onChanged: (value) {
                  setState(() {
                    is18OrOlder = value ?? false; // Update the state when value changes
                  });
                },
              ),
              // Checkbox for "Can lift 30-40 lbs"
              CheckboxListTile(
                title: const Text('Can lift 30-40 lbs'), // Checkbox label
                value: canLift, // Checkbox value
                onChanged: (value) {
                  setState(() {
                    canLift = value ?? false; // Update the state when value changes
                  });
                },
              ),
              // Checkbox for "Have a registered car"
              CheckboxListTile(
                title: const Text('Have a registered car'), // Checkbox label
                value: hasCar, // Checkbox value
                onChanged: (value) {
                  setState(() {
                    hasCar = value ?? false; // Update the state when value changes
                  });
                },
              ),
              const SizedBox(height: 16), // Space between elements
              // Next Button
              ElevatedButton(
                onPressed: () {
                  // Proceed to the next step if all conditions are met
                  if (is18OrOlder && canLift && hasCar) {
                    // Navigate to the AddVehicleScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddVehicleScreen(), // Navigate to AddVehicleScreen
                      ),
                    );
                  } else {
                    // Show a message if any condition is not met
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please agree to all conditions')), // Error message
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                  minimumSize: const Size(double.infinity, 40), // Button size
                ),
                child: const Text('Next'), // Button text
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200], // Background color of the screen
    );
  }
}
