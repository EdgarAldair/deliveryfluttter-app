// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_delivery/src/pages/login/login_controller.dart';
import 'package:flutter_delivery/src/utils/my_colors.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ignore: prefer_final_fields, unnecessary_new
  LoginController _con = new LoginController();

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(top: -80, left: -100, child: _circleLogin()),
            _lottieAnimation(),
            Positioned(top: 60, left: 25, child: _textLogin()),
            Container(
              margin: EdgeInsets.only(top: 360),
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 80),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //_imageBanner(),

                      _textfieldEmail(),
                      _textfieldPassword(),
                      _botonLogin(),
                      _textRegistrar(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textLogin() {
    return Text(
      'LOGIN',
      style: TextStyle(
          fontFamily: 'NimbusSans',
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _textRegistrar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No tienes cuenta?',
          style: TextStyle(color: MyColors.primaryColor),
        ),
        SizedBox(
          width: 7,
        ),
        GestureDetector(
          onTap: _con.goToRegisterPage,
          child: Text(
            'Regístrate',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: MyColors.primaryColor),
          ),
        )
      ],
    );
  }

  Widget _botonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
          onPressed: _con.login,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text('Ingresar')),
    );
  }

  Widget _textfieldPassword() {
    // ignore: duplicate_ignore
    return Container(
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      // ignore: prefer_const_constructors
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      child: TextField(
        obscureText: true,
        controller: _con.passwordController,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(
              Icons.lock,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _lottieAnimation() {
    return Container(
      margin: EdgeInsets.only(
          top: 160, bottom: MediaQuery.of(context).size.height * 0.13),
      child: Lottie.asset('assets/json/loginanimation.json',
          width: 350, height: 200, fit: BoxFit.fill),
    );
  }

  Widget _textfieldEmail() {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      // ignore: prefer_const_constructors
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Correo electrónico',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(
              Icons.email,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  // ignore: unused_element
  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(
          top: 100, bottom: MediaQuery.of(context).size.height * 0.22),
      child: Image.asset(
        'assets/img/delivery.png',
        width: 200,
        height: 200,
      ),
    );
  }

  Widget _circleLogin() {
    return Container(
      height: 240,
      width: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor),
    );
  }
}
