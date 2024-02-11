import 'package:flutter/material.dart';

import '../components/home_card.dart';
import '../components/top_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              TopContainer(
                height: height * 0.26,
                width: width,
                title: "WELCOME !",
              ),

              Positioned(
                top: height * 0.2,
                child: Column(
                  children: [
                    HomeCard(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      width: width,
                      height: height,
                      text: "REGISTRATION",
                      imagePath: "assets/images/registration.png",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    HomeCard(
                      onTap: () {
                        Navigator.pushNamed(context, '/details');
                      },
                      width: width,
                      height: height,
                      text: "DETAILS",
                      imagePath: "assets/images/details.png",
                    )
                  ],
                ),
              ),

              // GradientButton(
              //   onPressed: () {},
              //   child: Text(
              //     "Register",
              //     style: TextStyle(color: Colors.white),
              //   ),
              //   width: width,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
