// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_delivery/src/register/register_controller.dart';
import 'package:flutter_delivery/src/utils/my_colors.dart';

class RegisterPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // ignore: prefer_final_fields, unnecessary_new
  RegisterController _conR = new RegisterController();
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _conR.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(top: -80, left: -100, child: _circleLogin()),
            Positioned(
                top: 180,
                left: MediaQuery.of(context).size.height * 0.18,
                child: _imageUser()),
            Positioned(top: 75, left: -1, child: _textRegister()),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 310),
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _textfieldEmail(),
                      _textfieldName(),
                      _textfieldApellido(),
                      _textfieldTelefono(),
                      _textfieldPassword(),
                      _textfieldConfirmPassword(),
                      _botonRegistrar()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _imageUser() {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/img/user_profile_2.png'),
      radius: 60,
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _textRegister() {
    return Row(
      children: [
        _iconBack(),
        SizedBox(
          width: 4,
        ),
        Text(
          'REGISTRO',
          style: TextStyle(
              fontFamily: 'NimbusSans',
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _botonRegistrar() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
          onPressed: _conR.registro,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.symmetric(vertical: 15)),
          child: Text('Registrarse')),
    );
  }

  Widget _iconBack() {
    return Icon(
      Icons.arrow_back_ios_rounded,
      color: Colors.white,
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
        keyboardType: TextInputType.emailAddress,
        controller: _conR.emailController,
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

  Widget _textfieldName() {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      // ignore: prefer_const_constructors
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      child: TextField(
        keyboardType: TextInputType.name,
        controller: _conR.nombreController,
        decoration: InputDecoration(
            hintText: 'Nombre',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(
              Icons.person,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _textfieldApellido() {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      // ignore: prefer_const_constructors
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      child: TextField(
        controller: _conR.apellidoController,
        decoration: InputDecoration(
            hintText: 'Apellido',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(
              Icons.person_outline,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _textfieldTelefono() {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      // ignore: prefer_const_constructors
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: _conR.telefonoController,
        decoration: InputDecoration(
            hintText: 'Teléfono',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(
              Icons.phone,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _textfieldPassword() {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      // ignore: prefer_const_constructors
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      child: TextField(
        obscureText: true,
        controller: _conR.passwordController,
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

  Widget _textfieldConfirmPassword() {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      // ignore: prefer_const_constructors
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      child: TextField(
        obscureText: true,
        controller: _conR.confirmpasswordController,
        decoration: InputDecoration(
            hintText: 'Confirmar Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(
              Icons.lock_outlined,
              color: MyColors.primaryColor,
            )),
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
