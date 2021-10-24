import 'package:flutter/material.dart';

///Widget to display the text of Check your Internet Connection to User
class InternetNotAvailable extends StatelessWidget {
  ///Initializes Key
  const InternetNotAvailable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      padding: const EdgeInsets.all(16),
      child: const Text(
        'Check your Internet Connection',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
