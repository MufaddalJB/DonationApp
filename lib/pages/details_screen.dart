import 'package:tiobu/pages/donation_screen.dart';
import 'package:tiobu/main.dart';
import 'package:tiobu/pages/all_creator_screen.dart';
import 'package:flutter/material.dart';
class details extends StatelessWidget {

  String name,optional,amount;

  details({required this.name,required this.optional,required this.amount});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,),
      body:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name: $name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
              SizedBox(height: 12,),
              Text("Message $optional",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
              SizedBox(height: 12,),
              Text("Donation amount: $amount",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
              SizedBox(height: 12,),
              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AllCreatorScreen()));
              },
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),),
              child: Text("Done",style:TextStyle(color: Colors.white),),),
            ],
          ),
        )
    );
  }
}

// class details extends StatefulWidget {
//
//   String name,optional,amount;
//
//   details({required this.name,required this.optional,required this.amount});
//   @override
//   State<details> createState() => _detailsState();
// }
//
// class _detailsState extends State<details> {
//
//   // String name,optional,amount;
//   //
//   // _detailsState({required this.name,required this.optional,required this.amount});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//         Column(
//           children: [
//             Text("$name"),
//             Text("$optional"),
//             Text("$amount")
//           ],
//         )
//     );
//   }
// }
