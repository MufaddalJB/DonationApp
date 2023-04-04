import 'package:flutter/material.dart';
import 'package:tiobu/pages/all_creator_screen.dart';
import 'package:tiobu/pages/auth.dart';
import 'package:tiobu/pages/donation_screen.dart';
import 'package:tiobu/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tiobu/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:tiobu/models/user.dart';
void main() async {
 WidgetsFlutterBinding.ensureInitialized();
await  Firebase.initializeApp(); //initialization of Firebase app
 // here, Firebase.initializeApp() is Future method, so you need to add await before.
 //run time error: Unhandled Exception: [core/no-app]
 //No Firebase App '[DEFAULT]' has been created - call Firebase.initializeApp()
runApp(MyApp() ); }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {

   return StreamProvider<Use?>.value(
     value: AuthService().user,
     initialData: null,
     child: MaterialApp(


     home: Wrapper(),

     ),
   );}
}




//  runApp(MaterialApp(
//  debugShowCheckedModeBanner: false,
//  home: Wrapper(),
//
// ));
// }
// void main()async =>
//     WidgetsFlutterBinding.ensureInitialized();
// Firebase.initializeApp();
// runApp(MaterialApp(
//  debugShowCheckedModeBanner: false,
//  initialRoute: '/',
//   routes:{
//    "/":(context)=>Login(),
//    "//":(context)=>Donation_screen()
//   } ,
// ));
