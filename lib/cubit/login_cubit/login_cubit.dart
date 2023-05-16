import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:untitled_16_may/models/login_model.dart';
import 'package:untitled_16_may/screens/home_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context)=> BlocProvider.of(context);
  
  LoginModel? loginModel;

  void userLogin({required String email,required String password}) async
  {
    await http.post(Uri.parse('https://api.escuelajs.co/api/v1/auth/login'),body: {
      'email' : email,
      'password' : password,
    }).then((value)
    {
      if(value.statusCode == 201)
      {
        var json = jsonDecode(value.body);
        emit(LoginSuccessState());
      }
      emit(LoginSuccessState());
    });
  }

}
