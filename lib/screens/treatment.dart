import 'package:flutter/material.dart';

class TreatmentScreen extends StatefulWidget {
  @override
  _TreatmentScreenState createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  // Define a variable to track which treatment is expanded
  String? selectedTreatment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Treatment',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Mobil Section
          Text('Mobil',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          buildTreatmentOption('Car Wash'),
          buildTreatmentOption('Car Detailing'),
          buildTreatmentOption('Salon Mobil'),
          buildTreatmentOption('Service Car'),

          // Motor Section
          SizedBox(height: 16.0),
          Text('Motor',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          buildTreatmentOption('Motor Wash'),
          buildTreatmentOption('Motor Deatiling'),
          buildTreatmentOption('Salon Motor'),
          buildTreatmentOption('Service Motor'),
        ],
      ),
    );
  }

  Widget buildTreatmentOption(String treatmentName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(treatmentName),
          trailing: Icon(Icons.add),
          onTap: () {
            setState(() {
              // Toggle the selected treatment
              if (selectedTreatment == treatmentName) {
                selectedTreatment = null;
              } else {
                selectedTreatment = treatmentName;
              }
            });
          },
        ),
        if (selectedTreatment == treatmentName)
          buildTreatmentDetails(treatmentName),
      ],
    );
  }

  Widget buildTreatmentDetails(String treatmentName) {
    // Replace the hardcoded details with actual data as needed
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (treatmentName == 'Car Wash')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Regular Wash'),
                SizedBox(height: 4.0),
                Text('Detail information about Regular Wash...'),
                SizedBox(height: 8.0),
                Text('Wash & Wax'),
                SizedBox(height: 4.0),
                Text('Detail information about Wash & Wax...'),
              ],
            ),
          // Add more detailed information based on the treatmentName as needed
        ],
      ),
    );
  }
}
