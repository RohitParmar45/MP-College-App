import 'package:flutter/material.dart';

class OtherServiceModel {
  final String name;
  final String subtitle;

  OtherServiceModel({required this.name, required this.subtitle});
}

class OtherServiceScreen extends StatelessWidget {
  final List<OtherServiceModel> chapters = [
    OtherServiceModel(
        name: 'Gupta Bhaujnalay : Tiffin and Mesh Service',
        subtitle: 'shiv Mandir, Rau , Indore'),
    OtherServiceModel(
        name: 'Shivay Bhaujnalay : Tiffin and Mesh Service',
        subtitle: 'shiv Mandir, Rau , Indore'),
    OtherServiceModel(
        name: 'Shakti Bhog : Tiffin and Mesh Service',
        subtitle: 'Medicaps, Rau , Indore'),
    OtherServiceModel(
        name: 'Patidar House : To let Room',
        subtitle: 'Near Bridge, Rau , Indore'),
    OtherServiceModel(
        name: 'Gyanoday Mention : To let Room',
        subtitle: 'Bus Stand, Rau , Indore'),
  ];

  OtherServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 1,
            child: ListTile(
              leading: chapters[index].name.toLowerCase().contains('tiffin')
                  ? Image.asset('assets/image/food_icon.png')
                  : Image.asset(
                      'assets/image/hostel_icon.png'), // Placeholder for PDF icon
              title: Text(chapters[index].name),
              subtitle: Text(chapters[index].subtitle),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {
                      // Implement download PDF logic
                      // Example: launch a download URL
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.location_on),
                    onPressed: () {
                      // Implement view PDF logic
                      // Example: navigate to a PDF viewer screen
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
