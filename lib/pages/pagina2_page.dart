import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/models/user.dart';
import 'package:estados/bloc/user/user_bloc.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final newUser = User(
                  nombre: 'Nicolas',
                  edad: 24,
                  profesiones: [
                    'Mobile Developer',
                  ],
                );

                userBloc.add(ActivateUser(newUser));

                Navigator.pop(context);
              }),
          MaterialButton(
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(ChangeUserAge(30));

                Navigator.pop(context);
              }),
          MaterialButton(
              child: const Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(AddUserProfession('Nueva profesion'));

                Navigator.pop(context);
              }),
        ],
      )),
    );
  }
}
