// import 'dart:js';
import 'package:tiobu/main.dart';
import 'package:flutter/material.dart';
import'package:tiobu/screens/authenticate.dart';
import 'package:tiobu/pages/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:tiobu/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tiobu/pages/auth.dart';
import 'package:tiobu/pages/all_creator_screen.dart';
class Wrapper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final user= Provider.of<Use?>(context);
    if (user==null){
    return Authenticate();
  }
  else{
    return AllCreatorScreen();
    }
  }
}
