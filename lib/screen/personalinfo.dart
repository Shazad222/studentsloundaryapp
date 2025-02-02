import 'package:deliveryboy/screen/DeliveryInfoScreen.dart';
import 'package:deliveryboy/screen/subscription_order.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For image picking functionality
import 'dart:io'; // For handling files

// The main screen for Personal Info
class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  XFile? _selfieImage; // Variable to store the selected selfie image
  XFile?
      _drivingLicenseImage; // Variable to store the selected driving license image

  final ImagePicker _picker = ImagePicker(); // Instance of ImagePicker

  // Function to show a dialog for selecting the image source (Camera or Gallery)
  Future<XFile?> _pickImage(BuildContext context) async {
    return await showDialog<XFile?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Image Source'), // Title of the dialog
          content: Column(
            mainAxisSize:
                MainAxisSize.min, // Ensures the dialog content is compact
            children: [
              // Option to select image from Camera
              ListTile(
                leading: const Icon(Icons.camera_alt), // Camera icon
                title: const Text('Camera'), // Text for camera option
                onTap: () async {
                  final image = await _picker.pickImage(
                      source: ImageSource.camera); // Pick image from camera
                  Navigator.of(context)
                      .pop(image); // Close the dialog and return the image
                },
              ),
              // Option to select image from Gallery
              ListTile(
                leading: const Icon(Icons.photo_library), // Gallery icon
                title: const Text('Gallery'), // Text for gallery option
                onTap: () async {
                  final image = await _picker.pickImage(
                      source: ImageSource.gallery); // Pick image from gallery
                  Navigator.of(context)
                      .pop(image); // Close the dialog and return the image
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Info'), // AppBar title
        backgroundColor: Colors.blue, // AppBar background color
      ),
      body: Center(
        child: Container(
          width: 300, // Width of the main container
          padding: const EdgeInsets.all(16.0), // Padding inside the container
          decoration: BoxDecoration(
            color: Colors.white, // Background color of the container
            borderRadius: BorderRadius.circular(8), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // Shadow offset
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Minimizes vertical space usage
            children: [
              const Text(
                'Personal Info', // Heading text
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Text color
                ),
              ),
              const SizedBox(height: 16),
              // Section for adding selfie
              CircleAvatar(
                radius: 40, // Size of the avatar
                backgroundColor: Colors.grey[300], // Background color
                backgroundImage: _selfieImage != null
                    ? FileImage(
                        File(_selfieImage!.path)) // Display selected selfie
                    : null,
                child: _selfieImage == null
                    ? IconButton(
                        icon: const Icon(Icons.camera_alt), // Camera icon
                        onPressed: () async {
                          final image = await _pickImage(context); // Pick image
                          if (image != null) {
                            setState(() {
                              _selfieImage = image; // Update selfie image
                            });
                          }
                        },
                      )
                    : null, // No icon if image is selected
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  final image = await _pickImage(context); // Pick image
                  if (image != null) {
                    setState(() {
                      _selfieImage = image; // Update selfie image
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300], // Button color
                  foregroundColor: Colors.black, // Text color
                  minimumSize: const Size(double.infinity, 40), // Button size
                ),
                child: const Text('Add Selfie'), // Button text
              ),
              const SizedBox(height: 16),
              // Section for adding driving license
              Container(
                height: 100, // Height of the container
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Border color
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: _drivingLicenseImage == null
                    ? Center(
                        child: IconButton(
                          icon: const Icon(Icons.add_a_photo), // Add photo icon
                          onPressed: () async {
                            final image =
                                await _pickImage(context); // Pick image
                            if (image != null) {
                              setState(() {
                                _drivingLicenseImage =
                                    image; // Update driving license image
                              });
                            }
                          },
                        ),
                      )
                    : ClipRRect(
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                        child: Image.file(
                          File(_drivingLicenseImage!
                              .path), // Display selected license image
                          fit: BoxFit.cover, // Fit the image to the container
                        ),
                      ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  final image = await _pickImage(context); // Pick image
                  if (image != null) {
                    setState(() {
                      _drivingLicenseImage =
                          image; // Update driving license image
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300], // Button color
                  foregroundColor: Colors.black, // Text color
                  minimumSize: const Size(double.infinity, 40), // Button size
                ),
                child: const Text('Add Driving License'), // Button text
              ),
              const SizedBox(height: 16),
              // Button to proceed to the next step
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                           LaundryPickupScreen()), // Replace NextPage with your widget
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Proceeding to the next step...')),
                  ); // Temporary action
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
      backgroundColor: Colors.grey[200], // Background color of the screen
    );
  }
}
