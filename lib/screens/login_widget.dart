import 'dart:html';

import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController emailTextField = TextEditingController();
  final TextEditingController passwordTextField = TextEditingController();
  bool alertBoxActive = false;

  @override dispose() {
    emailTextField.dispose();
    passwordTextField.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(98, 101, 33, 117),
        title: const Text('Find your next Third Place'),
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login: "),
             SizedBox(
                width: 200,
                child: TextField(
                  controller: emailTextField,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'email',
                      alignLabelWithHint: true,
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  obscureText: true,
                  controller: passwordTextField,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'password',
                      alignLabelWithHint: true,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _showAlertDialog(context);

                },
                child: const Text('Login'),
              ),
          ].map((widget) => Padding(
            padding: const EdgeInsets.all(16),
            child: widget,
            )).toList(),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('You are now logged in'),
          actions: [
            TextButton(
              onPressed: () {
                //cheeseeeeeed
                print('OK pressed');

                // Close the alert dialog
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}