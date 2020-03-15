import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:network_aware_flutter_application/services/data_connectivity_service.dart';
import 'package:network_aware_flutter_application/widgets/internet_not_available.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Network Aware Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamProvider<DataConnectionStatus>(
          create: (context) {
            return DataConnectivityService()
                .connectivityStreamController
                .stream;
          },
          child: MyHomePage(title: 'Network Aware Application'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Visibility(
              visible: Provider.of<DataConnectionStatus>(context) ==
                  DataConnectionStatus.disconnected,
              child: InternetNotAvailable()),
          Expanded(
              child: Center(
            child: Text('Network Aware Application'),
          ))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
