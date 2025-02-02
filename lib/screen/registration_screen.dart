import 'package:deliveryboy/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverRegistrationScreen extends StatefulWidget {
  @override
  _DriverRegistrationScreenState createState() =>
      _DriverRegistrationScreenState();
}

class _DriverRegistrationScreenState extends State<DriverRegistrationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController ssnController = TextEditingController();
  final TextEditingController driverTypeController = TextEditingController();
  final TextEditingController contactDetailsController =
      TextEditingController();
  final TextEditingController zoneController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController routingNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController countryCodeController =
      TextEditingController(text: "+92");
  final TextEditingController mobileController = TextEditingController();

  final ApiService apiService = ApiService();
  bool isLoading = false;
  bool vehicleInsured = false;
  bool canLiftWeight = false;
  bool isTwentyYearsOld = false;

  void handleRegister() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Split full name into first and last name
      List<String> nameParts = nameController.text.split(" ");
      String firstName = nameParts.isNotEmpty ? nameParts.first : "Unknown";
      String lastName =
          nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "Unknown";

      // Validate required fields
      if (nameController.text.isEmpty ||
          dobController.text.isEmpty ||
          stateController.text.isEmpty ||
          ssnController.text.isEmpty ||
          contactDetailsController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          mobileController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please fill all the required fields")),
        );
        setState(() {
          isLoading = false;
        });
        return;
      }

      // Prepare the data for API
      final data = {
        "laundry_id": "2",
        "first_name": firstName,
        "last_name": lastName,
        "dob": dobController.text,
        "state_id": stateController.text,
        "ssn": ssnController.text,
        "driver_type": driverTypeController.text,
        "contact_details": contactDetailsController.text,
        "zone": int.tryParse(zoneController.text) ?? 1,
        "status": "active",
        "language": languageController.text,
        "account_number": accountNumberController.text,
        "routing_number": routingNumberController.text,
        "address": addressController.text,
        "condition_vehicle_insured": vehicleInsured,
        "condition_lift_weight": canLiftWeight,
        "condition_20_years": isTwentyYearsOld,
        "driver_email": emailController.text,
        "driver_password": passwordController.text,
        "ccode": countryCodeController.text,
        "mobile": mobileController.text,
      };

      print("Data Sent to API: $data");

      // Send API request
      final response = await apiService.driverRegistration(data);

      setState(() {
        isLoading = false;
      });

      if (response.status == "success") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration Successful! Please login.")),
        );
        Get.offNamed("/driverLoginScreen");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.message ?? 'Registration failed')),
        );
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver Registration"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Full Name
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              SizedBox(height: 10),

              // Date of Birth
              TextField(
                controller: dobController,
                decoration:
                    InputDecoration(labelText: 'Date of Birth (YYYY-MM-DD)'),
              ),
              SizedBox(height: 10),

              // State
              TextField(
                controller: stateController,
                decoration: InputDecoration(labelText: 'State ID'),
              ),
              SizedBox(height: 10),

              // SSN
              TextField(
                controller: ssnController,
                decoration: InputDecoration(labelText: 'SSN'),
              ),
              SizedBox(height: 10),

              // Driver Type
              TextField(
                controller: driverTypeController,
                decoration: InputDecoration(labelText: 'Driver Type'),
              ),
              SizedBox(height: 10),

              // Contact Details
              TextField(
                controller: contactDetailsController,
                decoration: InputDecoration(labelText: 'Contact Details'),
              ),
              SizedBox(height: 10),

              // Zone
              TextField(
                controller: zoneController,
                decoration: InputDecoration(labelText: 'Zone'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),

              // Language
              TextField(
                controller: languageController,
                decoration: InputDecoration(labelText: 'Language'),
              ),
              SizedBox(height: 10),

              // Account Number
              TextField(
                controller: accountNumberController,
                decoration: InputDecoration(labelText: 'Account Number'),
              ),
              SizedBox(height: 10),

              // Routing Number
              TextField(
                controller: routingNumberController,
                decoration: InputDecoration(labelText: 'Routing Number'),
              ),
              SizedBox(height: 10),

              // Address
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              SizedBox(height: 10),

              // Email
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 10),

              // Password
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 10),

              // Country Code
              TextField(
                controller: countryCodeController,
                decoration: InputDecoration(labelText: 'Country Code'),
              ),
              SizedBox(height: 10),

              // Mobile
              TextField(
                controller: mobileController,
                decoration: InputDecoration(labelText: 'Mobile'),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),

              // Checkbox Conditions
              CheckboxListTile(
                title: Text("Is your vehicle insured?"),
                value: vehicleInsured,
                onChanged: (value) {
                  setState(() {
                    vehicleInsured = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Can you lift weights?"),
                value: canLiftWeight,
                onChanged: (value) {
                  setState(() {
                    canLiftWeight = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Are you 20 years or older?"),
                value: isTwentyYearsOld,
                onChanged: (value) {
                  setState(() {
                    isTwentyYearsOld = value ?? false;
                  });
                },
              ),

              // Register Button
              ElevatedButton(
                onPressed: isLoading ? null : handleRegister,
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
