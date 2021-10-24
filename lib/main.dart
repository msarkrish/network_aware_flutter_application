import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:network_aware_flutter_application/screens/page_one.dart';
import 'package:network_aware_flutter_application/widgets/internet_not_available.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

///App's Parent Widget
class MyApp extends StatelessWidget {
  /// Initializes Key.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<InternetConnectionStatus>(
      initialData: InternetConnectionStatus.connected,
      create: (_) {
        return InternetConnectionChecker().onStatusChange;
      },
      child: MaterialApp(
        title: 'Network Aware Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(
          title: 'Network Aware Application',
        ),
      ),
    );
  }
}

///HomePage of the Application
class MyHomePage extends StatefulWidget {
  /// Initializes Key and Title for appbar.
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  ///Title for AppBar
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Visibility(
            visible: Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected,
            child: const InternetNotAvailable(),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Network Aware Application'),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) {
                          return const Page1();
                        },
                      ),
                    );
                  },
                  child: const Text('Go to Page 1'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
