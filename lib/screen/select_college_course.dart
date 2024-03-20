import 'package:college_app/screen/main_screen.dart';
import 'package:flutter/material.dart';

class SelectCollegeCourse extends StatefulWidget {
  @override
  _SelectCollegeCourseState createState() => _SelectCollegeCourseState();
}

class _SelectCollegeCourseState extends State<SelectCollegeCourse> {
  // Define lists for dropdown options
  List<String> colleges = [
    'Medi-Caps University',
    'Acropolis Institute of Technology and Research',
    'SVVV (Shri Vaishnav Vidyapeeth Vishwavidyalaya) ',
    'Sage University Indore',
    'RGPV',
    'DAVV',
  ];
  List<String> years = ['1st Year', '2nd Year', '3rd Year', '4th Year'];
  List<String> semesters = ['1', '2', '3', '4', '5', '6', '7', '8'];
  List<String> courses = [
    'Btech CSE',
    'BCA',
    'Bsc cs',
    'Btech ME',
    'Btech CE',
    'BBA',
    'BCom',
  ];

  // Define variables to hold selected values
  String selectedCollege = 'Medi-Caps University';
  String selectedYear = '1st Year';
  String selectedSemester = '1';
  String selectedCourse = 'Btech CSE';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select College & Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDropdown('Select College', colleges, selectedCollege,
                (value) => setState(() => selectedCollege = value)),
            SizedBox(height: 20.0),
            _buildDropdown('Select Year', years, selectedYear,
                (value) => setState(() => selectedYear = value)),
            SizedBox(height: 20.0),
            _buildDropdown('Select Semester', semesters, selectedSemester,
                (value) => setState(() => selectedSemester = value)),
            SizedBox(height: 20.0),
            _buildDropdown('Select Course', courses, selectedCourse,
                (value) => setState(() => selectedCourse = value)),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.yellow),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainScreen();
                }));
              },
              child: Text(
                'Submit',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(
      String label, List<String> items, String value, Function onChanged) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      value: value,
      items: items.map((String item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {});
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SelectCollegeCourse(),
  ));
}
