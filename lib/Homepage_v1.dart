import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rodezno Apolstery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        scaffoldBackgroundColor: Colors.grey,
        useMaterial3: true,
        

      ),
      home: const MyHomePage(
        title: ('Rodezno Apolstery'),
        ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration (
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.red],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          ),
        title: Center(child: Text(widget.title, textAlign: TextAlign.center, style: const TextStyle(fontStyle: FontStyle.italic))),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Show Information',
            onPressed: () {
              showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),  //position where you want to show the menu on screen
      items: [
        const PopupMenuItem<String>(
            value: '1',
            child: Text('VIEW OUR GALLERY')),
        const PopupMenuItem<String>(
            value: '2', child: Text('CONTACT US')),
        const PopupMenuItem<String>(
            value: '3', child: Text('ABOUT US')),  
      ],
      elevation: 8.0,
    );
            },
          ),
          const VerticalDivider(
            width: 12.5,
            thickness: 1,
            indent: 15,
            endIndent: 15,
            color: Colors.black,
          ),
          // TextButton(
          //   child: const Text(
          //     'VIEW OUR GALLERY',
          //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
          //   ),
          //   onPressed: () {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //         const SnackBar(content: Text('Contact Menu')));
          //   },
          // ),
          // const VerticalDivider(
          //   width: 12.5,
          //   thickness: 1,
          //   indent: 15,
          //   endIndent: 15,
          //   color: Colors.black,
          // ),
          TextButton(
            child: const Text(
              'CONTACT US',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Contact Menu')));
            },
          ),
        ],
      ),
      body: Container ( 
        decoration: const BoxDecoration (
          image: DecorationImage(
            image: AssetImage('assets/images/Maite_Christmas.jpg'),
        ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text("Welcome to rodezno apolstery"),
            )
          ],
        ),
    ),
    );
  }
}
