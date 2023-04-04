// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tiobu/pages/auth.dart';
import 'package:tiobu/screens/authenticate.dart';
import 'package:tiobu/shared/loading.dart';
class Login extends StatefulWidget {
 final Function toggleView;
 Login({required this.toggleView});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth= AuthService();
  final _formkey= GlobalKey<FormState>();
  String email='';
  String  password='';
  String name='';
  String error='';
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body:
      Container(
        height: double.infinity,
        color: Colors.greenAccent,
        child: Center(
          child:Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0) ,
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 33,
                      child: Image(image: AssetImage('assets/login.png'),)),
                  //SizedBox(height: 10,),
                  Text('Login Page',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  //SizedBox(height: 50,),
                  TextFormField(

                    validator: (val)=>val!.isEmpty? 'Enter a valid email':null,
                    onChanged: (val){
                      setState(() {
                        email=val;
                      });
                    },
                    decoration:InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        label: Text('Email id',style: TextStyle(color: Colors.black,),)
                    ),
                  ),
                  //SizedBox(height: 12,),
                  TextFormField(
                    validator: (val)=>val!.length<6? 'Enter a valid password':null,
                    onChanged: (val){
                      setState(() {
                        password=val;
                      });
                    },
                    obscureText: true,
                    decoration:InputDecoration(
                      fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        label: Text('Password',style: TextStyle(color: Colors.black,),)
                    ),
                  ),
                  //SizedBox(height: 12,),
                  TextButton(onPressed: ()async{
    if(_formkey.currentState!.validate()) {
      setState(() {
        loading=true;
      });
    dynamic result= await _auth.signInWithemailandpassword(email, password);
    if(result==null){
    setState(() {
    error='could not sign in with the given credentials';
    loading=false;
    });
    }}

                     }, style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),),child:Text('Login',style: TextStyle(color: Colors.white),)),
                  Text(error,style: TextStyle(color: Colors.red,fontSize: 15),),

                  Text('Forgot password?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),),
                  TextButton(onPressed: ()async{
                    widget.toggleView();
                  }, child: Text('Sign in',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
