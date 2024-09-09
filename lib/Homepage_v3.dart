import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cliffside Upholstery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        scaffoldBackgroundColor: Colors.grey,
        useMaterial3: true,
        

      ),
      home: const MyHomePage(
        title: ('Cliffside Upholstery'),
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
      bottomNavigationBar: BottomAppBar(
        height: 50.0,
        color: Color.fromRGBO(160, 160, 160, 1),
        child: Row(
          children: [
            TextButton(
            child: const Text(
              'CONTACT US',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0)
            ),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactMenu()),
            );
            },
          ),
          const VerticalDivider(
            width: 12.5,
            thickness: 1,
            indent: 1,
            endIndent: 4,
            color: Colors.black,
          ),
          Text('  - © 2024 Cliffside Upholstery - All Rights Reserved'),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(224, 224, 224, 1),
        title: Center(child: Text(widget.title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold))),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.menu),
            itemBuilder: (context) => [
        PopupMenuItem<String>(
            value: '1',
            child: Text('VIEW OUR GALLERY'),
            onTap: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const GalleryMenu();
                          },
                        ),
                      );
                    });
            }
        ),
        PopupMenuItem<String>(
            value: '2', 
            child: const Text('CONTACT US'),
            onTap: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ContactMenu();
                          },
                        ),
                      );
                    });
            }
        ),
        PopupMenuItem<String>(
            value: '3', 
            child: const Text('ABOUT US'),
            onTap: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AboutUsPage();
                          },
                        ),
                      );
                    });
            }
        ),   
        ],
      ),
          const VerticalDivider(
            width: 12.5,
            thickness: 1,
            indent: 15,
            endIndent: 15,
            color: Colors.black,
          ),
          TextButton(
            child: const Text(
              'CONTACT US',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
            ),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactMenu()),
            );
            },
          ),
        ],
      ),
    body: Stack(
      children: <Widget>[
        Container(
            decoration: const BoxDecoration (
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.red],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          ),
        Container( 
          decoration: const BoxDecoration (
          image: DecorationImage(
            image: AssetImage('assets/images/Maite_Christmas.jpg'),
            ),
          ),
        ),
        Align(
          alignment: Alignment(0.0,-0.9),
          child: Container(
          decoration: BoxDecoration (
          image: const DecorationImage(
            image: AssetImage('assets/images/a1.jpg'),
            fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 4,
        ),
      borderRadius: BorderRadius.circular(12),
        ),
          width:750,
          height:55,
          child: const Text(
            'Cliffside Upholstery has over 40 years of excellence, and we\'re continuing to create and provide the highest quality designs.',
            style: const TextStyle(fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
            selectionColor: Colors.black,
          ),
        ),
      ),
  ],
),
    );
  }
}


class ContactMenu extends StatelessWidget {
  const ContactMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 50.0,
        color: Color.fromRGBO(160, 160, 160, 1),
        child: Row(
          children: [
            TextButton(
            child: const Text(
              'CONTACT US',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0)
            ),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactMenu()),
            );
            },
          ),
          const VerticalDivider(
            width: 12.5,
            thickness: 1,
            indent: 1,
            endIndent: 4,
            color: Colors.black,
          ),
          Text('  - © 2024 Cliffside Upholstery - All Rights Reserved'),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(224, 224, 224, 1),
        title: Center(child: Text('Cliffside Upholstery', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold))),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Show Information',
            onPressed: () {
              showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),  //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            value: '1',
            child: Text('HOME PAGE'),
            onTap: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const MyHomePage(title: ('Cliffside Upholstery'),);
                          },
                        ),
                      );
                    });
            }
        ),
        PopupMenuItem<String>(
            value: '2', 
            child: const Text('VIEW OUR GALLERY'),
            onTap: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const GalleryMenu();
                          },
                        ),
                      );
                    });
            }
        ),
        PopupMenuItem<String>(
            value: '3', 
            child: const Text('ABOUT US'),
            onTap: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AboutUsPage();
                          },
                        ),
                      );
                    });
            }
        ),  
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
          TextButton(
            child: const Text(
              'HOME PAGE',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
            ),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage(title: ('Cliffside Upholstery'),),),
            );
            },
          ),
        ],
      ),
      body: Stack(
      children: <Widget>[
        Container(
            decoration: const BoxDecoration (
            gradient: LinearGradient(
              colors: [Colors.grey, Colors.white],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          ),
    ],
),
  );
  }
}

class GalleryMenu extends StatelessWidget {
  const GalleryMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 50.0,
        color: Color.fromRGBO(160, 160, 160, 1),
        child: Row(
          children: [
            TextButton(
            child: const Text(
              'CONTACT US',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0)
            ),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactMenu()),
            );
            },
          ),
          const VerticalDivider(
            width: 12.5,
            thickness: 1,
            indent: 1,
            endIndent: 4,
            color: Colors.black,
          ),
          Text('  - © 2024 Cliffside Upholstery - All Rights Reserved'),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(224, 224, 224, 1),
        title: Center(child: Text('Cliffside Upholstery', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold))),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Show Information',
            onPressed: () {
              showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),  //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            value: '1',
            child: Text('HOME PAGE'),
            onTap: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const MyHomePage(title: ('Cliffside Upholstery'),);
                          },
                        ),
                      );
                    });
            }
        ),
        PopupMenuItem<String>(
            value: '2', 
            child: const Text('CONTACT US'),
            onTap: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ContactMenu();
                          },
                        ),
                      );
                    });
            }
        ),
        PopupMenuItem<String>(
            value: '3', 
            child: const Text('ABOUT US'),
            onTap: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AboutUsPage();
                          },
                        ),
                      );
                    });
            }
        ),  
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
          TextButton(
            child: const Text(
              'HOME PAGE',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
            ),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage(title: ('Cliffside Upholstery'),),),
            );
            },
          ),
        ],
      ),
      body: Stack(
      children: <Widget>[
        Container(
            decoration: const BoxDecoration (
            gradient: LinearGradient(
              colors: [Colors.grey, Colors.white],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          ),
        Align(
          alignment: Alignment(0.0,-0.9),
          child: Container(
          decoration: BoxDecoration (
          image: const DecorationImage(
            image: AssetImage('assets/images/a1.jpg'),
            fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 4,
        ),
      borderRadius: BorderRadius.circular(12),
        ),
          width:750,
          height:55,
          child: const Text(
            'Here is some of our best works.',
            style: const TextStyle(fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
            selectionColor: Colors.black,
          ),
        ),
      )

    ],
),
  );
  }
}

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 50.0,
        color: Color.fromRGBO(160, 160, 160, 1),
        child: Row(
          children: [
            TextButton(
            child: const Text(
              'CONTACT US',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0)
            ),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactMenu()),
            );
            },
          ),
          const VerticalDivider(
            width: 12.5,
            thickness: 1,
            indent: 1,
            endIndent: 4,
            color: Colors.black,
          ),
          Text('  - © 2024 Cliffside Upholstery - All Rights Reserved'),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(224, 224, 224, 1),
        title: Center(child: Text('Cliffside Upholstery', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold))),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Show Information',
            onPressed: () {
              showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),  //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            value: '1',
            child: Text('HOME PAGE'),
            onTap: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const MyHomePage(title: ('Cliffside Upholstery'),);
                          },
                        ),
                      );
                    });
            }
        ),
        PopupMenuItem<String>(
            value: '2', 
            child: const Text('CONTACT US'),
            onTap: () {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ContactMenu();
                          },
                        ),
                      );
                    });
            }
        ),
        const PopupMenuItem<String>(
            value: '3', child: Text('VIEW OUR GALLERY')),  
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
          TextButton(
            child: const Text(
              'HOME PAGE',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
            ),
            onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage(title: ('Cliffside Upholstery'),),),
            );
            },
          ),
        ],
      ),
      body: Stack(
      children: <Widget>[
        Container(
            decoration: const BoxDecoration (
            gradient: LinearGradient(
              colors: [Colors.grey, Colors.white],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
          ),
        Align(
          alignment: Alignment(0.0,-0.9),
          child: Container(
          decoration: BoxDecoration (
          image: const DecorationImage(
            image: AssetImage('assets/images/a1.jpg'),
            fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 4,
        ),
      borderRadius: BorderRadius.circular(12),
        ),
          width:750,
          height:85,
          child: const Text(
            'We\'re a company dedicated to quality, and it all started here:\n INSERT EDGEWATER NJ GOOGLE MAPS WIDGET.\n\n We\'ve been in the Edgewater NJ area since 1980 where we began our dream: make high-quality upholstery.',
            style: const TextStyle(fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
            selectionColor: Colors.black,
          ),
        ),
      )

    ],
),
  );
  }
}

