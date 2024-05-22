import 'package:flutter/material.dart';
import 'package:untitled1/main.dart';
class Notes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes & Resources',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              // Navigate to notes page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
        ],
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
            color: Colors.blue.shade900,
            child: Text(
              'Select Your Year',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to 1st year 1st semester notes page

                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent), // Change button color here
                  ),
                  child: Text('1st Year 1st Semester'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to 2nd year 1st semester notes page

                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent), // Change button color here
                  ),
                  child: Text('2nd Year 1st Semester'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to 3rd year 1st semester notes page

                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent), // Change button color here
                  ),
                  child: Text('3rd Year 1st Semester'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to 3rd year 1st semester notes page

                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent), // Change button color here
                  ),
                  child: Text('4th Year 1st Semester'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to 3rd year 1st semester notes page

                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent), // Change button color here
                  ),
                  child: Text('4th Year 2nd Semester'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}