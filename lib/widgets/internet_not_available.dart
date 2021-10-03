import 'package:flutter/material.dart';

class InternetNotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      padding: EdgeInsets.all(16.0),
      child: Text('Check your Internet Connection',
          style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}
