import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/const.dart';

class TopContainer extends StatelessWidget {
  final String? title;
  const TopContainer({
    super.key,
    this.title,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Center(
        child: Text(
          title ?? "",
          style: GoogleFonts.poppins(fontSize: 30, color: Colors.white),
        ),
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        gradient: LinearGradient(
          colors: [primaryLightBlue, primaryDarkBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
