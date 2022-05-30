import 'package:flutter/material.dart';
import 'package:kodepos_sample/result_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final txtKey = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    txtKey.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cari Kode Pos",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            )),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Silahkan ketik nama daerah : ",
                style: TextStyle(fontSize: 14, color: Colors.black)),
            TextField(
              controller: txtKey,
              decoration: InputDecoration(
                  suffix: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ResultView(searchKey: txtKey.text)));
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.blue,
                ),
              )),
              onSubmitted: (value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ResultView(searchKey: value)));
              },
            )
          ],
        ),
      ),
    );
  }
}
