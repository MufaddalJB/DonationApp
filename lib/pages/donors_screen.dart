import 'package:flutter/material.dart';
class Donors extends StatefulWidget {
  const Donors({Key? key}) : super(key: key);

  @override
  State<Donors> createState() => _DonorsState();
}

class _DonorsState extends State<Donors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          // Card(
          //   child: Text,
          // )
        ],
      ),
    );
  }
}
