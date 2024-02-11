import 'package:flutter/material.dart';
import 'package:student_register/components/top_container.dart';
import 'package:student_register/services/student_service.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final StudentService _studentService = StudentService();
  // Future<List<Student>>? _studentList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: _studentService.fetchStudents(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Container(
                  height: height,
                  child: Column(
                    children: [
                      TopContainer(
                        height: height * 0.15,
                        width: width,
                        title: "STUDENT DETAILS",
                      ),
                      Expanded(
                        child: Container(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              final student = snapshot.data![index];
                              return ExpansionTile(
                                  leading: Icon(Icons.person),
                                  title: Text(student.name),
                                  children: [
                                    ListTile(
                                      subtitle: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(student.email),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(student.phoneNumber),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(student.birthday),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(student.gender!),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(student.address),
                                        ],
                                      ),
                                      trailing: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.edit),
                                          SizedBox(width: 8.0),
                                          Icon(Icons.delete),
                                        ],
                                      ),
                                    ),
                                  ]);
                            },
                            itemCount: snapshot.data!.length,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
