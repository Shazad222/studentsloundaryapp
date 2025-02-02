import 'package:flutter/material.dart';
import 'become3.dart';
class RulesAndRegulationsScreen extends StatefulWidget {
  const RulesAndRegulationsScreen({Key? key}) : super(key: key);

  @override
  _RulesAndRegulationsScreenState createState() => _RulesAndRegulationsScreenState();
}

class _RulesAndRegulationsScreenState extends State<RulesAndRegulationsScreen> {
  // Boolean variable to track the checkbox state
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rules and Regulations'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Rules and Regulation',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Use this Business Rule template to describe how company policies or practices apply to your business. Business rules identify the appropriate action that needs to be taken and removes any ambiguity regarding the rules.',
                style: TextStyle(fontSize: 14, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: isChecked, // Bind the checkbox to the state
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false; // Update the state when checkbox is toggled
                      });
                    },
                  ),
                  const Text('Check here'),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add action when the 'Agree' button is pressed
                  if (isChecked) {
                    // Proceed with the next step, e.g., navigate to another page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BecomeDriverScreen(), // Replace with the actual page
                      ),
                    );
                  } else {
                    // Show a snackbar or alert if the user hasn't agreed
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please agree to the rules before proceeding.')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 40),
                ),
                child: const Text('Agree'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
