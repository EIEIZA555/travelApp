import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytravel/screens/onboarding_screen.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.jpg"),
          radius: 30,
        ),
        Spacer(),
        IconButton(
            onPressed: () {
              signOut();
            },
            icon: Icon(
              Icons.exit_to_app,
              size: 28.0,
              color: Colors.red,
            ))
      ],
    );
  }
}
