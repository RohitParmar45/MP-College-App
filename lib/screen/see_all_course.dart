import 'package:college_app/screen/ai_chat_bot/consts.dart';
import 'package:college_app/screen/course_screen.dart';
import 'package:flutter/material.dart';

class SeeAllCourse extends StatefulWidget {
  const SeeAllCourse({Key? key});

  @override
  State<SeeAllCourse> createState() => _SeeAllCourseState();
}

class _SeeAllCourseState extends State<SeeAllCourse> {
  List<String> imgList = [
    "Computer Networking",
    "Data Structure",
    "DBMS",
    "Theory of Computation",
    "Software Engineering",
    "Cryptography"
  ];

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    // Filter courses based on search text
    List<String> filteredList = imgList
        .where(
            (course) => course.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("All Courses"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search courses...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CourseScreeen(filteredList[index]),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFF5F3FF),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: favouriteList
                                            .contains(filteredList[index])
                                        ? Colors.redAccent
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(20)),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    if (favouriteList
                                        .contains(filteredList[index])) {
                                      favouriteList.remove(filteredList[index]);
                                      setState(() {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text('Removed'),
                                                duration: Duration(
                                                    milliseconds: 1000)));
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text('Already Removed'),
                                            duration:
                                                Duration(milliseconds: 1000)),
                                      );
                                    }
                                  },
                                ),
                              ),
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: favouriteList
                                            .contains(filteredList[index])
                                        ? Colors.grey
                                        : Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(20)),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    if (favouriteList
                                        .contains(filteredList[index])) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text('Already Added'),
                                              duration: Duration(
                                                  milliseconds: 1000)));
                                    } else {
                                      favouriteList.add(filteredList[index]);
                                      setState(() {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text('Added'),
                                          duration:
                                              Duration(milliseconds: 1000),
                                          backgroundColor: Colors.green,
                                        ));
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              "assets/image/Python.png",
                              width: 60,
                              height: 60,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            textAlign: TextAlign.center,
                            filteredList[index],
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
