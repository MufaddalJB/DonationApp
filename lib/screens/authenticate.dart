import 'package:flutter/material.dart';
import 'package:tiobu/pages/login_screen.dart';
import 'package:tiobu/pages/register.dart';
import 'package:tiobu/screens/wrapper.dart';
import 'package:tiobu/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tiobu/pages/auth.dart';
class Authenticate extends StatefulWidget {


  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
   void toggleView(){
    setState(() => showSignIn=!showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return Login(toggleView:toggleView);
    }else{
    return Register(toggleView:toggleView);
  }}
}
