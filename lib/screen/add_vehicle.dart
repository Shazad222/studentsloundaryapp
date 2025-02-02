import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'background_check.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      home: AddVehicleScreen(), // Sets the initial screen
    );
  }
}

class AddVehicleScreen extends StatefulWidget {
  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  final ValueNotifier<bool> _isChecked = ValueNotifier(false); // Tracks the checkbox state
  XFile? _selectedImage; // Stores the selected image
  final ImagePicker _picker = ImagePicker(); // Initializes the image picker

  // Function to show a dialog for choosing the image source (Camera or Gallery)
  Future<XFile?> _showImageSourceDialog() async {
    return await showDialog<XFile?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Image Source'), // Dialog title
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt), // Camera icon
                title: const Text('Camera'),
                onTap: () async {
                  // Pick image from camera
                  final image = await _picker.pickImage(source: ImageSource.camera);
                  Navigator.of(context).pop(image); // Close the dialog and return the image
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library), // Gallery icon
                title: const Text('Gallery'),
                onTap: () async {
                  // Pick image from gallery
                  final image = await _picker.pickImage(source: ImageSource.gallery);
                  Navigator.of(context).pop(image); // Close the dialog and return the image
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
        title: const Text('Add Vehicle'), // AppBar title
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
            mainAxisSize: MainAxisSize.min, // Minimizes the vertical space
            children: [
              const Text(
                'Add Vehicle',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 16),
              // Dropdown for selecting vehicle model
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Model',
                  border: OutlineInputBorder(),
                ),
                items: ['Model 1', 'Model 2', 'Model 3'] // Dropdown options
                    .map((model) => DropdownMenuItem(
                          value: model,
                          child: Text(model),
                        ))
                    .toList(),
                onChanged: (value) {}, // Action when an option is selected
              ),
              const SizedBox(height: 16),
              // Dropdown for selecting vehicle make
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Make',
                  border: OutlineInputBorder(),
                ),
                items: ['Make 1', 'Make 2', 'Make 3']
                    .map((make) => DropdownMenuItem(
                          value: make,
                          child: Text(make),
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              // Dropdown for selecting vehicle year
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Year',
                  border: OutlineInputBorder(),
                ),
                items: ['2020', '2021', '2022']
                    .map((year) => DropdownMenuItem(
                          value: year,
                          child: Text(year),
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              // Dropdown for selecting vehicle color
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Color',
                  border: OutlineInputBorder(),
                ),
                items: ['Red', 'Blue', 'Black']
                    .map((color) => DropdownMenuItem(
                          value: color,
                          child: Text(color),
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 16),
              // Image container for selecting and displaying the vehicle photo
              GestureDetector(
                onTap: () async {
                  // Show dialog for image source selection
                  final image = await _showImageSourceDialog();
                  if (image != null) {
                    setState(() {
                      _selectedImage = image; // Update the selected image
                    });
                  }
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300], // Background color
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                    border: Border.all(color: Colors.grey), // Border color
                  ),
                  child: _selectedImage == null
                      ? const Icon(Icons.add_a_photo, size: 40, color: Colors.grey)
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(_selectedImage!.path), // Display the selected image
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 8),
              const Text('Add Vehicle Photo'),
              const SizedBox(height: 16),
              // Checkbox for insurance confirmation
              Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: _isChecked,
                    builder: (context, value, child) {
                      return Checkbox(
                        value: value,
                        onChanged: (bool? newValue) {
                          _isChecked.value = newValue ?? false; // Update checkbox state
                        },
                      );
                    },
                  ),
                  const Text('I have insurance for the car'),
                ],
              ),
              const SizedBox(height: 16),
              // Button to navigate to the BackgroundCheckScreen
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BackgroundCheckScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                  minimumSize: const Size(double.infinity, 40), // Button size
                ),
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200], // Background color of the screen
    );
  }
}
