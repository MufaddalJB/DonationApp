import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tiobu/pages/donation_screen.dart';
import 'package:tiobu/pages/characters.dart';
import 'package:tiobu/main.dart';
import 'package:tiobu/pages/auth.dart';
class AllCreatorScreen extends StatefulWidget {
  const AllCreatorScreen({Key? key}) : super(key: key);

  @override
  State<AllCreatorScreen> createState() => _AllCreatorScreenState();
}

class _AllCreatorScreenState extends State<AllCreatorScreen> {
final AuthService _auth= AuthService();
  List<Character> C =[
Character(creators: "BB Ki Vines", url:   "assets/bb ki vines.jpg"),
    Character(creators: "Carryminati", url: "assets/carryminati.jpg"),
    Character(creators: "PewDiePie", url: "assets/pewdiepie.jpg")
  ];
  List<Character> A =[
    Character(creators: "Carryminati", url: "assets/carryminati.jpg"),
    Character(creators: "PewDiePie", url: "assets/pewdiepie.jpg"),
    Character(creators: "BB Ki Vines", url:   "assets/bb ki vines.jpg"),
  ];
  void updatetime(index) async{
    Character instance= C[index];
    Navigator.pushNamed(context,'//' , arguments:{
     'cre':instance.creators,
      'url2':instance.url,
  });
  }
  void updatetime2(index) async{
    Character instance= A[index];
    Navigator.pushNamed(context,'//' , arguments:{
      'cre':instance.creators,
      'url2':instance.url,
    }
    );
  }

  // List<String>   creators = ["BB Ki Vines", "Carryminati", "PewDiePie"];
  // List<String> character=["Carryminati","PewDiePie","BB Ki Vines"];
  // List<tiobu> imagesLinks = [
  // "assets/bb ki vines.jpg",
  // "assets/carryminati.jpg",
  // "assets/pewdiepie.jpg"];
  // List img =[
  //   "assets/carryminati.jpg",
  //   "assets/pewdiepie.jpg",
  //   "assets/bb ki vines.jpg"
  // ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.adjust_rounded),
            Center(
              child: Text("TIOBU",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10.0,

                ),
              ),
            ),
            Spacer(),
            Icon(Icons.person_pin,
              color: Colors.orangeAccent,
            ),
          ],
        ),

      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.cyan),
                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Menu", style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.black, size: 26.0,),
              title: Text("HomePage",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),

            ),
            ListTile(
              leading: Icon(Icons.search, color: Colors.black, size: 26.0,),
              title: Text("Search",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),

            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.black, size: 26.0,),
              title: Text("Settings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),

            ),
            Divider(thickness: 2.0,),
            ListTile(
              leading: Icon(Icons.help, color: Colors.black, size: 26.0,),
              title: Text("Help",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),

            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.black, size: 26.0,),
              title: Text("Logout",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
onTap: ()async{
      return await _auth.SignOut();
},
            )
          ],
        ),

      ),
      body:SingleChildScrollView(

        child:Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0),
            child:
                Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recommendated Creators",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  SizedBox(
                      height: 500,
                      child:

                  new ListView.builder(
    scrollDirection: Axis.vertical,

    itemCount: C.length,
    itemBuilder: (BuildContext ctxt, int index) {
      return new

      SizedBox(
        height: 180.0,
        child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start
            ,
            children: <Widget>[

              GestureDetector(
                onTap: () {
                  // Navigator.pushReplacement(context,
                      // MaterialPageRoute(
                      // builder: (BuildContext context) =>
                      updatetime(index);
                },

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      height: 130,
                      width: 170,
                      // color: Colors.brown,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(
                              '${C[index].url}'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(20.0)),


                    ),
                    // SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Text("${C[index].creators}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),),
                        SizedBox(width: 45,),

                        Icon(Icons.favorite_border),
                      ],
                    ),
                    Text('YOUTUBER', style: TextStyle(
                        color: Colors.grey, fontSize: 12.0),),
                  ],
                ),


              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //     builder: (BuildContext context) =>
                  //         Donation_screen()));
                  updatetime2(index);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      height: 130,
                      width: 170,
                      // color: Colors.brown,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(
                              '${A[index].url}'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(20.0)),


                    ),
                    // SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        Text("${A[index].creators}", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),),
                        SizedBox(width: 45,),

                        Icon(Icons.favorite_border),
                      ],
                    ),
                    Text('YOUTUBER', style: TextStyle(
                        color: Colors.grey, fontSize: 12.0),),
                  ],
                ),


              ),

            ]
        ),
      );
      // SizedBox(
      //   height: 180.0,
      //   child: Row(
      //
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       crossAxisAlignment: CrossAxisAlignment.start
      //       ,
      //       children: <Widget>[
      //
      //         GestureDetector(
      //           onTap: () {
      //             Navigator.push(context, MaterialPageRoute(
      //                 builder: (BuildContext context) =>
      //                     Donation_screen()));
      //           },
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //
      //             children: [
      //               Container(
      //                 height: 130,
      //                 width: 170,
      //                 // color: Colors.brown,
      //                 decoration: BoxDecoration(
      //                     image: DecorationImage(image: AssetImage(
      //                         'assets/pewdiepie.jpg'),
      //                         fit: BoxFit.fill),
      //                     borderRadius: BorderRadius.circular(20.0)),
      //
      //
      //               ),
      //               // SizedBox(height: 10.0),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //
      //                   Text("PewDiePie", style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18.0),),
      //                   SizedBox(width: 45,),
      //
      //                   Icon(Icons.favorite_border),
      //                 ],
      //               ),
      //               Text('YOUTUBER', style: TextStyle(
      //                   color: Colors.grey, fontSize: 12.0),),
      //             ],
      //           ),
      //
      //
      //         ),
      //         GestureDetector(
      //           onTap: () {
      //             Navigator.push(context, MaterialPageRoute(
      //                 builder: (BuildContext context) =>
      //                     Donation_screen()));
      //           },
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //
      //             children: [
      //               Container(
      //                 height: 130,
      //                 width: 170,
      //                 // color: Colors.brown,
      //                 decoration: BoxDecoration(
      //                     image: DecorationImage(image: AssetImage(
      //                         'assets/bb ki vines.jpg'),
      //                         fit: BoxFit.fill),
      //                     borderRadius: BorderRadius.circular(20.0)),
      //
      //
      //               ),
      //               // SizedBox(height: 10.0),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //
      //                   Text("BB Ki Vines", style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18.0),),
      //                   SizedBox(width: 45,),
      //
      //                   Icon(Icons.favorite_border),
      //                 ],
      //               ),
      //               Text('YOUTUBER', style: TextStyle(
      //                   color: Colors.grey, fontSize: 12.0),),
      //             ],
      //           ),
      //
      //
      //         ),
      //
      //       ]
      //   ),
      // ),
      // SizedBox(
      //   height: 180.0,
      //   child: Row(
      //
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       crossAxisAlignment: CrossAxisAlignment.start
      //       ,
      //       children: <Widget>[
      //
      //         GestureDetector(
      //           onTap: () {
      //             Navigator.push(context, MaterialPageRoute(
      //                 builder: (BuildContext context) =>
      //                     Donation_screen()));
      //           },
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //
      //             children: [
      //               Container(
      //                 height: 130,
      //                 width: 170,
      //                 // color: Colors.brown,
      //                 decoration: BoxDecoration(
      //                     image: DecorationImage(image: AssetImage(
      //                         'assets/carryminati.jpg'),
      //                         fit: BoxFit.fill),
      //                     borderRadius: BorderRadius.circular(20.0)),
      //
      //
      //               ),
      //               // SizedBox(height: 10.0),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //
      //                   Text("Carryminati", style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18.0),),
      //                   SizedBox(width: 45,),
      //
      //                   Icon(Icons.favorite_border),
      //                 ],
      //               ),
      //               Text('YOUTUBER', style: TextStyle(
      //                   color: Colors.grey, fontSize: 12.0),),
      //             ],
      //           ),
      //
      //
      //         ),
      //         GestureDetector(
      //           onTap: () {
      //             Navigator.push(context, MaterialPageRoute(
      //                 builder: (BuildContext context) =>
      //                     Donation_screen()));
      //           },
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //
      //             children: [
      //               Container(
      //                 height: 130,
      //                 width: 170,
      //                 // color: Colors.brown,
      //                 decoration: BoxDecoration(
      //                     image: DecorationImage(image: AssetImage(
      //                         'assets/pewdiepie.jpg'),
      //                         fit: BoxFit.fill),
      //                     borderRadius: BorderRadius.circular(20.0)),
      //
      //
      //               ),
      //               // SizedBox(height: 10.0),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //
      //                   Text("PewDiePie", style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18.0),),
      //                   SizedBox(width: 45,),
      //
      //                   Icon(Icons.favorite_border),
      //                 ],
      //               ),
      //               Text('YOUTUBER', style: TextStyle(
      //                   color: Colors.grey, fontSize: 12.0),),
      //             ],
      //           ),
      //
      //
      //         ),
      //
      //       ]
      //   ),
      // ),
      // SizedBox(
      //   height: 180.0,
      //   child: Row(
      //
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       crossAxisAlignment: CrossAxisAlignment.start
      //       ,
      //       children: <Widget>[
      //
      //         GestureDetector(
      //           onTap: () {
      //             Navigator.push(context, MaterialPageRoute(
      //                 builder: (BuildContext context) =>
      //                     Donation_screen()));
      //           },
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //
      //             children: [
      //               Container(
      //                 height: 130,
      //                 width: 170,
      //                 // color: Colors.brown,
      //                 decoration: BoxDecoration(
      //                     image: DecorationImage(image: AssetImage(
      //                         'assets/carryminati.jpg'),
      //                         fit: BoxFit.fill),
      //                     borderRadius: BorderRadius.circular(20.0)),
      //
      //
      //               ),
      //               // SizedBox(height: 10.0),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //
      //                   Text("Carryminati", style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18.0),),
      //                   SizedBox(width: 45,),
      //
      //                   Icon(Icons.favorite_border),
      //                 ],
      //               ),
      //               Text('YOUTUBER', style: TextStyle(
      //                   color: Colors.grey, fontSize: 12.0),),
      //             ],
      //           ),
      //
      //
      //         ),
      //         GestureDetector(
      //           onTap: () {
      //             Navigator.push(context, MaterialPageRoute(
      //                 builder: (BuildContext context) =>
      //                     Donation_screen()));
      //           },
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //
      //             children: [
      //               Container(
      //                 height: 130,
      //                 width: 170,
      //                 // color: Colors.brown,
      //                 decoration: BoxDecoration(
      //                     image: DecorationImage(image: AssetImage(
      //                         'assets/bb ki vines.jpg'),
      //                         fit: BoxFit.fill),
      //                     borderRadius: BorderRadius.circular(20.0)),
      //
      //
      //               ),
      //               // SizedBox(height: 10.0),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //
      //                   Text("BB Ki Vines", style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18.0),),
      //                   SizedBox(width: 45,),
      //
      //                   Icon(Icons.favorite_border),
      //                 ],
      //               ),
      //               Text('YOUTUBER', style: TextStyle(
      //                   color: Colors.grey, fontSize: 12.0),),
      //
      //
      //             ],
      //           ),
      //
      //
      //         ),
      //
      //       ]
      //   ),
      // ),
    }
    )
            )
                ],
              ),




      )
    )
    );
  }
}