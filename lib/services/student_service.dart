// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:student_register/models/students.dart';
import 'package:http/http.dart' as http;
import 'package:student_register/utils/const.dart';
import 'package:student_register/utils/utills.dart';

class StudentService {
  //save student details
  void saveStudent({
    void Function()? btnOkOnPress,
    required BuildContext context,
    required String id,
    required String name,
    required String email,
    required String phoneNumber,
    required String gender,
    required String birthday,
    required String address,
  }) async {
    try {
      Student student = Student(
          id: id,
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          gender: gender,
          birthday: birthday,
          address: address);

      http.Response res = await http.post(Uri.parse('$URI/student/add'),
          body: student.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccsess: () {
            AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.success,
                    title: "Registration Successful !",
                    btnOkOnPress: btnOkOnPress)
                .show();
          });
    } catch (e) {
      print(e);
    }
  }

//Fetch data from the backend
  Future<List<Student>> fetchStudents() async {
    late http.Response response;
    List<Student> students = [];

    try {
      response = await http.get(
        Uri.parse('$URI/student'),
      );
      print(response.body);
      if (response.statusCode == 200) {
        final List<dynamic> studentsData = jsonDecode(response.body);
        students = studentsData.map((dynamic item) {
          return Student(
              id: item['_id'],
              name: item['name'],
              email: item['email'],
              phoneNumber: item['phoneNumber'],
              gender: item['gender'],
              birthday: item['birthday'],
              address: item['address']);
        }).toList();
        return students;
      } else {
        return Future.error("Something went wrong, ${response.statusCode}");
      }
    } catch (e) {
      print("err");
      throw Future.error(e);
    }
  }

  // delete student
  void deleteFunction(String id, BuildContext context) async {
    late http.Response response;
    try {
      response = await http.delete(Uri.parse('$URI/student/delete/$id'));
      httpErrorHandle(
          response: response,
          context: context,
          onSuccsess: () {
            AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.success,
                    title: "Delete Successful !",
                    btnOkOnPress: () {})
                .show();
          });
    } catch (e) {
      throw e;
    }
  }

  // updateUser
  void updateStudent({
    void Function()? btnOkOnPress,
    required BuildContext context,
    required String id,
    required String name,
    required String email,
    required String phoneNumber,
    required String gender,
    required String birthday,
    required String address,
  }) async {
    try {
      Student student = Student(
          id: id,
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          gender: gender,
          birthday: birthday,
          address: address);

      http.Response res = await http.put(Uri.parse('$URI/student/update/$id'),
          body: student.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccsess: () {
            AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.success,
                    title: "Update Successful !",
                    btnOkOnPress: btnOkOnPress)
                .show();
          });
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
