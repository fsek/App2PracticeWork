import 'package:flutter/material.dart';

class IntroductionSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE1C9),
      appBar: AppBar(
        title: Text("Schema"),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Image(
          image: AssetImage("assets/img/Schema.png"),
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
