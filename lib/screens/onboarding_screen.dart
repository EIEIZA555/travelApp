import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mytravel/screens/sign_up_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Hello There.",
              body: "You can henshin and fight the enemy.",
              image: buildImage('assets/images/screen1-removebg-preview.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Easy To Use.",
              body: "You can use rider drive to save the world.",
              image: buildImage('assets/images/screen2-removebg-preview.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: "Get Started",
              body: "Sign up and start using the app now and you can be like kamen rider.",
              image: buildImage('assets/images/screen3-removebg-preview.png'),
              decoration: getPageDecoration(),
              footer: ElevatedButton(
                onPressed: () => goToHome(context),
                child: Text("Start Now"),
              ),
            ),
          ],
          done: Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text("Skip"),
          next: Icon(Icons.arrow_forward),
          dotsDecorator: getDotsDecorator(),
        ),
      ),
    );
  }

  Future<void> goToHome(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool('ON BOARDING', false);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => SignUpPage()),
    );
  }

  Widget buildImage(String path) => Center(child: Image.asset(path, width: 250));

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 16, color: Colors.grey),
        imagePadding: EdgeInsets.all(20),
      );

  DotsDecorator getDotsDecorator() => DotsDecorator(
        size: Size(10, 10),
        color: Colors.grey,
        activeSize: Size(22, 10),
        activeColor: Colors.blue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      );
}
