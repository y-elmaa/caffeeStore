import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePage.dart';
import 'package:flutter_application_1/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My App',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 72, 49, 39),
        titleTextStyle: TextStyle(
          color: Colors.white, // Text color
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildText("Log in "),
            _buildTextField(context, "Username", Icons.person),
            _buildTextField(context, "Password", Icons.password_sharp),
            _buildLoginButton(context, "log in "),
            _forgitpassword(context),
            _signein(context),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style:
          const TextStyle(color: Color.fromARGB(255, 72, 49, 39), fontSize: 20),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTextField(
      BuildContext context, String hintText, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            filled: true,
            fillColor: Theme.of(context).primaryColor.withOpacity(0.2),
            prefixIcon: Icon(iconData)),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context, String text) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 72, 49, 39),
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(text),
        ));
  }

  Widget _forgitpassword(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: const Text("forgit password",
            style: TextStyle(color: Colors.white)));
  }

  Widget _signein(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("don't have acount"),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignUp(),
                ),
              );
            },
            child: const Text("signein", style: TextStyle(color: Colors.white)))
      ],
    );
  }
}
