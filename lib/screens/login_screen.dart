import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled_16_may/cubit/login_cubit/login_cubit.dart';
import 'package:untitled_16_may/models/login_model.dart';
import 'package:untitled_16_may/screens/home_screen.dart';
import 'package:untitled_16_may/screens/register_screen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {},
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Shopping'
        ),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text('Login',style: TextStyle(fontSize: 40),),
                Text('Login now to browse our offers',style: TextStyle(fontSize: 20,color: Colors.grey),),
                SizedBox(height: 30,),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return 'Email must not be empty';
                    }  return null;
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                TextFormField(
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return 'Password must not be empty';
                    }  return null;
                  },
                  controller: passController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Center(
                  child: ElevatedButton(onPressed: (){
                    if (formKey.currentState!.validate()) {
                      LoginCubit.get(context).userLogin(
                          email: emailController.text,
                          password: passController.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                    }

                  }, child: Text('Login')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Text('Don\'t have an account?',style: TextStyle(fontSize: 20),),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterScreen()));
                    }, child: Text('Register',style: TextStyle(fontSize: 20),)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

  },
);
  }
}
