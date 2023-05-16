import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled_16_may/cubit/login_cubit/login_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  var _formKey = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  var _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit,LoginState>(
      builder: (context,state) => Scaffold(
        appBar: AppBar(
          title: Text(
              'Shopping'
          ),
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return 'Email must not be empty';
                      }  return null;
                    },
                    controller: _emailController,
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
                    controller: _passController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                  ElevatedButton(onPressed: (){
                    _formKey.currentState!.validate();
                    LoginCubit.get(context).userLogin(email: _emailController.text, password: _passController.text);
                  }, child: Text('Login')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                      Text('Already have an account?',style: TextStyle(fontSize: 20),),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text('Login',style: TextStyle(fontSize: 20),)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
