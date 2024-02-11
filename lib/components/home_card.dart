import 'package:flutter/material.dart';
import 'package:student_register/utils/const.dart';

class HomeCard extends StatefulWidget {
  final String imagePath;
  final String text;
  final void Function()? onTap;
  HomeCard(
      {super.key,
      required this.width,
      required this.height,
      required this.imagePath,
      required this.text,
      required this.onTap});

  final double width;
  final double height;

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: 10,
      child: InkWell(
        onTap: widget.onTap,
        splashColor: Color(0xffE6EBFE),
        child: Container(
          width: widget.width * 0.8,
          height: widget.height * 0.35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: widget.height * 0.20,
                child: Image.asset(widget.imagePath),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "STUDENT",
                style: TextStyle(
                  fontSize: 28,
                  color: primaryDarkBlue,
                ),
              ),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: primaryDarkBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
