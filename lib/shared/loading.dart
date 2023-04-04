import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,),
      body: Container(
        color: Colors.greenAccent,
        child: Center(
          child: SpinKitCircle(
            color: Colors.green,
            size: 70.0,
          ),
        ),
      ),
    );
  }
}
