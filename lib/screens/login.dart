import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login ')),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(label: Text('Write your gmail ')),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'write valid email';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(label: Text('Write your password ')),
              validator: (value) {
                if (value == null || value.length < 4) {
                  return 'password must contains 4 letters ';
                } else {
                  return null;
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  print(Text('error'));
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
