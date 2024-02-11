import 'package:flutter/material.dart';

import 'package:student_register/components/custom_text_feild.dart';
import 'package:student_register/components/gradient_button.dart';
import 'package:student_register/components/top_container.dart';
import 'package:student_register/models/students.dart';

import '../services/student_service.dart';
import '../utils/const.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isEdit = false;
  String? _birtday;
  String? _selectedGender;
  String? id;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phNoController = TextEditingController();
  final _genderController = TextEditingController();
  final _dobController = TextEditingController();
  final _addressController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _dobFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final studentMap = ModalRoute.of(context)?.settings.arguments as Map;

        final student = studentMap['details'];

        setState(() {
          _nameController.text = student.name;
          _emailController.text = student.email;
          _phNoController.text = student.phoneNumber;
          _selectedGender = student.gender;
          _dobController.text = student.birthday;
          _addressController.text = student.address;
          id = student.id;
          _birtday = student.birthday!;
          isEdit = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phNoController.dispose();
    _genderController.dispose();
    _dobController.dispose();
    _addressController.dispose();

    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _dobFocusNode.dispose();
    _addressFocusNode.dispose();
  }

  bool _validateEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }

  void clearFeilds() {
    setState(() {
      _addressController.clear();
      _nameController.clear();
      _selectedGender = null;
      _dobController.clear();
      _phNoController.clear();
      _emailController.clear();
    });
  }

  StudentService studentService = StudentService();
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<StudentProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TopContainer(
                  height: height * 0.2,
                  width: width,
                  title: isEdit ? "UPDATE USER" : "REGISTER FORM",
                ),
                Container(
                  height: height - height * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormWidget(
                        keyboardType: TextInputType.name,
                        title: "Full Name",
                        focusNode: _nameFocusNode,
                        onFieldSubmitted: (val) {
                          FocusScope.of(context).requestFocus(_emailFocusNode);
                        },
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email address';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormWidget(
                        focusNode: _emailFocusNode,
                        onFieldSubmitted: (val) {
                          FocusScope.of(context).requestFocus(_phoneFocusNode);
                        },
                        title: "Email Address",
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email address';
                          } else if (!_validateEmail(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormWidget(
                        focusNode: _phoneFocusNode,
                        keyboardType: TextInputType.number,
                        title: "Phone Number",
                        controller: _phNoController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an phone number';
                          } else if (value.length != 10) {
                            return 'Please enter valid phone number';
                          }
                          return null;
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Text("Select Gender"),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                                title: Text("Male"),
                                value: "Male",
                                activeColor: primaryDarkBlue,
                                groupValue: _selectedGender,
                                onChanged: (val) {
                                  setState(() {
                                    _selectedGender = val;
                                  });
                                }),
                          ),
                          Expanded(
                            child: RadioListTile(
                                activeColor: primaryDarkBlue,
                                title: Text("Female"),
                                value: "Female",
                                groupValue: _selectedGender,
                                onChanged: (val) {
                                  setState(() {
                                    _selectedGender = val;
                                  });
                                }),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          focusNode: _dobFocusNode,
                          onFieldSubmitted: (val) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select birthday';
                            }
                            return null;
                          },
                          controller: _dobController,
                          onTap: () => {_selectDate()},
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.calendar_month),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: primaryLightBlue),
                                  borderRadius: BorderRadius.circular(10)),
                              fillColor: primaryAsh,
                              hintText: "Date Of Birth",
                              filled: true),
                          readOnly: true,
                        ),
                      ),
                      CustomTextFormWidget(
                          focusNode: _addressFocusNode,
                          title: "Address",
                          controller: _addressController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an address';
                            }
                            return null;
                          }),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GradientButton(
                        height: height * 0.08,
                        borderRadius: BorderRadius.circular(10),
                        onPressed: () async {
                          if (_selectedGender == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Please select Birthday")));
                          }
                          if (_formKey.currentState!.validate()) {
                            final newStudent = Student(
                              id: '',
                              name: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              phoneNumber: _phNoController.text.trim(),
                              gender: _selectedGender,
                              birthday: _birtday!,
                              address: _addressController.text.trim(),
                            );
                            isEdit
                                ? studentService.updateStudent(
                                    id: id!,
                                    name: newStudent.name,
                                    email: newStudent.email,
                                    phoneNumber: newStudent.phoneNumber,
                                    gender: newStudent.gender!,
                                    birthday: newStudent.birthday,
                                    address: newStudent.address,
                                    context: context,
                                    btnOkOnPress: () {})
                                : studentService.saveStudent(
                                    id: newStudent.id,
                                    name: newStudent.name,
                                    email: newStudent.email,
                                    phoneNumber: newStudent.phoneNumber,
                                    gender: newStudent.gender!,
                                    birthday: newStudent.birthday,
                                    address: newStudent.address,
                                    context: context,
                                    btnOkOnPress: clearFeilds);
                          } else {}
                        },
                        child: Text(
                          isEdit ? "Update" : "SAVE",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GradientButton(
                        borderRadius: BorderRadius.circular(10),
                        height: height * 0.08,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "CANCEL",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context, firstDate: DateTime(1900), lastDate: DateTime(2100));
    if (_picked != null) {
      setState(() {
        _dobController.text = _picked.toString().split(" ")[0];
        _birtday = _picked.toString().split(" ")[0].toString();
      });
    }
    FocusScope.of(context).requestFocus(_addressFocusNode);
  }
}
