import 'package:flutter/material.dart';

class RegisterController {
  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  Future? init(BuildContext context) {
    this.context = context;
  }

  void registro() {
    String email = emailController.text.trim();
    String nombre = nombreController.text.trim();
    String apellido = apellidoController.text.trim();
    String telefono = telefonoController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmpasswordController.text.trim();

    print('Email: $email');
    print('nombre: $nombre');
    print('apellido: $apellido');
    print('telefono: $telefono');
    print('password: $password');
    print('confirmPassword: $confirmPassword');
  }
}
