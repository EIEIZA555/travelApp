import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mytravel/screens/sign_in_screen.dart';

import '../widgets/mybutton.dart';
import '../widgets/mytextfield.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final repwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Form(
          child: Column(
            children: [
              Text(
                "Welcome to Valorant",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Text(
                '\n To go to next page please fill this form',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: nameController,
                  labelText: 'name',
                  hintText: 'Enter your name',
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: emailController,
                  labelText: 'email',
                  hintText: 'Enter your email',
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: pwdController,
                  labelText: 'password',
                  hintText: 'Enter your password',
                  obscureText: true),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  controller: repwdController,
                  labelText: 'confirm password',
                  hintText: 'Enter your password again',
                  obscureText: true),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                onTap: () {},
                labelText: 'Sign Up',
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Have a member?',
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  TextButton(onPressed: () {
                    Navigator.push(
                     context,
                     MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                      ),
                      );
                  }, child: Text('Sign In'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
