import 'package:flutter/material.dart';
import 'package:tiobu/pages/all_creator_screen.dart';
import 'package:tiobu/pages/characters.dart';
import 'package:tiobu/pages/details_screen.dart';
class Donation_screen extends StatefulWidget {
  const Donation_screen({Key? key}) : super(key: key);

  @override
  State<Donation_screen> createState() => _Donation_screenState();
}

class _Donation_screenState extends State<Donation_screen> {

  _Donation_screenState(){
    selectedval= values[0];
  }
  String? selectedval='';
   List<String> values=["2000",'3000','4000','5000'];
   Map data={};
   TextEditingController _name= new TextEditingController();
   TextEditingController _optional =new TextEditingController();

  @override
  Widget build(BuildContext context) {
      data=ModalRoute.of(context)!.settings.arguments as Map;
      // setState(() {
      //   data={
      //     'cre'=
      //   }
      // });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:(){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios),color: Colors.black,),
        backgroundColor: Colors.white,
         title:
         Row(
           children: [
             CircleAvatar(

backgroundImage: AssetImage(data['url2']),
        //backgroundColor: Colors.yellow[700],
              ),
            SizedBox(width: 10.0,),
            Text(data['cre'],style: TextStyle(color: Colors.black),),
            SizedBox(width: 10.0,),
            Icon(Icons.offline_pin,color: Colors.blue,)
        ],
      ),

      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(18.0,22.0,18,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [


                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children:<Widget>[
                       Text('Send your Love To ', style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                           fontSize: 15),),
                       Text(data['cre'], style: TextStyle(color: Colors.black,
                           fontWeight: FontWeight.bold,
                           fontSize: 15),),
                       Text(' To ', style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold,
                           fontSize: 15),),

                     ]),


               // (child: Text('Send your love to $data['cre'] to Become A real fan',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)),
             SizedBox(height: 10.0,),
              Center(child: Text('''Become a real Fan ''',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)),
SizedBox(height: 20.0,),
              DropdownButtonFormField(
                decoration: InputDecoration(

                     prefix: Text('\$  ',style: TextStyle(fontWeight: FontWeight.bold),),
                  //   Column(
                   //     mainAxisAlignment: MainAxisAlignment.start,
                       // children: [
                    //  icon:  Icon(Icons.arrow_drop_up_sharp),
                     //     Icon(Icons.arrow_drop_down_sharp),
                     //   ],
                      // ],

                  border: OutlineInputBorder(),
                ),

                  value: selectedval,
                  items: values.map((e) => DropdownMenuItem(
                    child: Text(e,style:
                    TextStyle(color: Colors.grey),),
                    value: e)).toList(),
                  onChanged:(val){
                    setState(() {
                       selectedval=val;

                    });
              }
              ),
              SizedBox(height: 10,),
              TextField(
                controller: _name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Your name (optional)',style: TextStyle(color: Colors.grey,),)
                ),

              ),
              SizedBox(height: 10.0,),

              TextField(
                controller: _optional,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                    label: Text('Say something nice (optional)',style: TextStyle(color: Colors.grey),)
                ),
              ),
              SizedBox(height: 150.0,),
TextButton(onPressed:(){
Navigator.of(context).push(MaterialPageRoute(builder: (context)=> details(name:_name.text,optional:_optional.text,amount: selectedval.toString())));
},
  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),),
child: Text("Support",style:TextStyle(color: Colors.white),),
)

            ],
          ),
        ),
      ),
    );
  }
}
