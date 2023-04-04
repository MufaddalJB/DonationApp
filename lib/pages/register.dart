import 'package:flutter/material.dart';
import 'package:tiobu/pages/auth.dart';
import 'package:tiobu/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:tiobu/shared/loading.dart';
class Register extends StatefulWidget {
final Function toggleView;
Register({required this.toggleView});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        actions: <Widget>[
         TextButton.icon(onPressed: (){
           widget.toggleView();
         },
         icon:Icon(Icons.person,color: Colors.white,),
        label:  Text("Login",style: TextStyle(color: Colors.white),),
    )],
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
                      height: 50,
                      child: Image(image: AssetImage('assets/login.png'),)),
                  //SizedBox(height: 10,),
                  Text('Register Page',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  //SizedBox(height: 50,),
                  TextFormField(
                    validator: (val)=>val!.isEmpty? 'Enter a valid name':null,
                    onChanged: (val){
                      setState(() {
                        name=val;
                      });
                    },
                    decoration:InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        label: Text('Name',style: TextStyle(color: Colors.black,),)
                    ),
                  ),
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
                        label: Text('Password',style: TextStyle(color: Colors.black),)
                    ),
                  ),
                  //SizedBox(height: 12,),
                  TextButton(onPressed: ()async{
                    if(_formkey.currentState!.validate()) {
                      setState(() {
                        loading=true;
                      });
                      dynamic result= await _auth.registerwithemailandpassword(email, password);
                    if(result==null){
                     setState(() {
                       error='please enter a valid email';
                     loading=false;
                     });
                    }

                    }
                    // dynamic result=await _auth.SignIn();
                    // if(result==null) {
                    //   print('error');
                    // }
                    // else {
                    //   print('Signed in');
                    //   print(result.uid);
                    // }

                  }, style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),),child:Text('Register',style: TextStyle(color: Colors.white),)),
              Text(error,style: TextStyle(color: Colors.red,fontSize: 15),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
