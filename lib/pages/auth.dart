import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tiobu/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tiobu/pages/database.dart';
class AuthService{
  final FirebaseAuth _auth= FirebaseAuth.instance;

  Use? _userFromFirebaseUser (User? user){
    return user != null? Use(uid: user.uid):null;
  }

  Stream<Use?> get user{
    return _auth.authStateChanges()
        .map(_userFromFirebaseUser);
  }
  Future signInWithemailandpassword(String email,String password)async{
    try {
      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user=result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }}
  Future SignIn() async{
     try{
      UserCredential result=await _auth.signInAnonymously();
      User? user = result.user;
    return _userFromFirebaseUser(user);
    }catch(e){
       print(e.toString());
       return null;
    }
  }
  Future registerwithemailandpassword(String email,String password)async{
try {
  UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
  User? user=result.user;
  await DatabaseService(uid:user!.uid).updateUsersData(0,'New member','-');
  return _userFromFirebaseUser(user);
}
  catch(e){
  print(e.toString());
  return null;
  }}

  Future SignOut() async{
    try{
      return await _auth.signOut();
    }
        catch(e){
      print(e.toString());
      return null;
        }
  }

}