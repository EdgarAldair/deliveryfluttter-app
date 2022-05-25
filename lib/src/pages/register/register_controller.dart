import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/models/response_api.dart';
import 'package:flutter_delivery/src/models/user.dart';
import 'package:flutter_delivery/src/provider/users_provider.dart';
import 'package:flutter_delivery/src/utils/my_snackbar.dart';

class RegisterController {
  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  UsersProviders usersProviders = UsersProviders();

  Future? init(BuildContext context) {
    this.context = context;
    usersProviders.init(context);
  }

  void registro() async {
    String email = emailController.text.trim();
    String nombre = nombreController.text.trim();
    String apellido = apellidoController.text.trim();
    String telefono = telefonoController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmpasswordController.text.trim();

    if (email.isEmpty ||
        nombre.isEmpty ||
        apellido.isEmpty ||
        telefono.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      MySnackbar.show(context!, 'debes ingresar todos los campos');
      return;
    }
    if (confirmPassword != password) {
      MySnackbar.show(context!, 'Las contraseñas no coinciden');
      return;
    }
    if (password.length < 6) {
      MySnackbar.show(
          context!, 'La contraseña debe tener al menos 6 caracteres');
      return;
    }

    // ignore: unused_local_variable
    User user = User(
      email: email,
      name: nombre,
      lastname: apellido,
      phone: telefono,
      password: password,
    );
    ResponseApi? responseApi = await usersProviders.create(user);
    MySnackbar.show(context!, responseApi!.message);

    print('Respuesta: $responseApi.toJson()');
    print('Email: $email');
    print('nombre: $nombre');
    print('apellido: $apellido');
    print('telefono: $telefono');
    print('password: $password');
    print('confirmPassword: $confirmPassword');
  }
}
