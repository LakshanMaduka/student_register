import 'package:flutter/material.dart';
import 'package:student_register/utils/const.dart';

class CustomTextFormWidget extends StatelessWidget {
  final String title;
  final Icon? icon;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  CustomTextFormWidget(
      {super.key,
      required this.title,
      this.icon,
      this.keyboardType,
      this.focusNode,
      this.onFieldSubmitted,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        focusNode: focusNode,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: icon,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryLightBlue),
                borderRadius: BorderRadius.circular(10)),

            // OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(10),
            //     borderSide:
            //         BorderSide(color: Color.fromRGBO(224, 224, 224, 1))),
            fillColor: primaryAsh,
            hintText: title,
            filled: true),
      ),
    );
  }
}
