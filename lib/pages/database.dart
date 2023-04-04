import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService{
  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference dataCollection= FirebaseFirestore.instance.collection('data');
Future updateUsersData(int amount,String name,String feedback)async{
  return await dataCollection.doc(uid).set({
  "Amount": amount,
    'Name': name,
    'Feedback':feedback,

  });
}
}