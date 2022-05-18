import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Stack(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: Colors.red),
          ),
          Container(
            margin: EdgeInsets.only(left: 55, top: 65),
            child: Text('LOGIN'),
          )
        ],
      ),
    );
  }
}
