import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

Future<void> goToWebPage(String urlString) async {
   final Uri _url = Uri.parse(urlString);
  launch("https://www.google.com/maps/dir//14A+Dempsey+Ave,+Edgewater,+NJ+07020/@40.827137,-73.9766369,17z/data=!4m9!4m8!1m0!1m5!1m1!1s0x89c2f650d85bb59b:0x4c9f4ba2082706dd!2m2!1d-73.974062!2d40.827133!3e0?entry=ttu");
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

class _MyHomePageState extends State<MyHomePage>  with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(vsync: this);
  bool rotate = false;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: 50.0,
        color: Color.fromRGBO(198, 198, 198, 1),
        child: Row(
          children: [
            TextButton(
            child: const Text(
              'CONTACT US',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.0, height: 1.0)
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
          Text('  - © 2024 Cliffside Upholstery -', style: const TextStyle(fontSize: 12.0)),
          ],
        ),
      ),
      appBar: AppBar(
        leading: Container(
          decoration: const BoxDecoration (
          image:  DecorationImage(
            image: AssetImage('assets/images/Diamond.png'),
            fit: BoxFit.cover,
        ),
        ),
        ),
        backgroundColor: Color.fromRGBO(198, 198, 198, 1),
        title: Center(child: new InkWell(child: Text(widget.title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0)), onTap: () => launch('https://google.com'),)),
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
              colors: [Colors.black38, Colors.grey],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          ),


        Align(
          alignment: Alignment(-1.0,-1.0),
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: Container(
              decoration: const BoxDecoration (
                image: DecorationImage(
                  image: AssetImage('assets/images/Diamond.png'),
                  //fit: BoxFit.cover,
                ),
            //   border: Border.all(
            // width: 4,
            // ),
            // borderRadius: BorderRadius.circular(12),
          ),
        width:250,
        height:250,
        child: Opacity(
          opacity: 0,
          child: ElevatedButton(
          onHover: (hovered) async {
            _controller.reset();
            _controller.forward();
          },
          onPressed: () async {
          },
          child: Text(''), 
        )
        ),
      ),),      
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
            style: const TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
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
        centerTitle: false,
        title: Center(child: new InkWell(child: Text('Cliffside Upholstery', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0)), onTap: () => launch('https://google.com'),)),
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
              colors: [Colors.black38, Colors.grey],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
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
        title: Center(child: new InkWell(child: Text('Cliffside Upholstery', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0)), onTap: () => launch('https://google.com'),)),
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
              colors: [Colors.black38, Colors.grey],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
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
        title: Center(child: new InkWell(child: Text('Cliffside Upholstery', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0)), onTap: () => launch('https://google.com'),)),
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
            }),  
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
              colors: [Colors.black38, Colors.grey],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
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
          height:25,
          child: const Text(
            'We\'re dedicated to quality, and it all started here:',
            style: const TextStyle(fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
            selectionColor: Colors.black,
          ),
        ),
      ),


      Align(
          alignment: Alignment(0.0,-0.5),
          child: Container(
          decoration: BoxDecoration (
          color: Colors.amber,
          image: const DecorationImage(
            image: AssetImage('assets/images/Addy2.JPG'),
            fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 4,
          color: Colors.indigo,
        ),
      borderRadius: BorderRadius.circular(12),
        ),
          width:375,
          height:375,
        ),
      ),

       Align(
        alignment:  Alignment(0.020,-0.365),
        child: Link(
          target: LinkTarget.blank,
          uri: Uri.parse("https://www.google.com/maps/dir//14A+Dempsey+Ave,+Edgewater,+NJ+07020/@40.827137,-73.9766369,17z/data=!4m9!4m8!1m0!1m5!1m1!1s0x89c2f650d85bb59b:0x4c9f4ba2082706dd!2m2!1d-73.974062!2d40.827133!3e0?entry=ttu"),
          builder: (context, followLink) => IconButton(
            tooltip: 'Located here',
            color: Colors.red,
            iconSize: 35.0,
            icon:  Icon(Icons.pin_drop),
            onPressed: () async {
            await  goToWebPage("https://www.google.com/maps/dir//14A+Dempsey+Ave,+Edgewater,+NJ+07020/@40.827137,-73.9766369,17z/data=!4m9!4m8!1m0!1m5!1m1!1s0x89c2f650d85bb59b:0x4c9f4ba2082706dd!2m2!1d-73.974062!2d40.827133!3e0?entry=ttu");
          },
        ),
        ),  
      ),

      //\n INSERT EDGEWATER NJ GOOGLE MAPS WIDGET.\n\n We\'ve been in the Edgewater NJ area since 1980 where we began our dream: make high-quality upholstery.

    ],
),
  );
  }
}

