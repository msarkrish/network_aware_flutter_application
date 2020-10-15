import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:network_aware_flutter_application/widgets/internet_not_available.dart';
import 'package:provider/provider.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Visibility(
              visible: Provider.of<DataConnectionStatus>(context) ==
                  DataConnectionStatus.disconnected,
              child: InternetNotAvailable()),
          Text(
            'Page 1',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
