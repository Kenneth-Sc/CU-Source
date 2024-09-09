import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        fontFamily: "Century Gothic",
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
  int rotate = 0;
  final controller = CarouselController();
  int activeIndex = 0;
  List imageList = [
    'assets/images/pexels-andrea-piacquadio-3757055.jpg',
    'assets/images/pexels-engin-akyurt-1647662.jpg',
    'assets/images/pexels-max-rahubovskiy-6980711.jpg',
    'assets/images/pexels-max-rahubovskiy-7535044.jpg'
  ];


Widget buildButtons({bool stretch = false}) => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        //padding:EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.orangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Icon(Icons.arrow_back, size: 16,color: Colors.white),
      onPressed: previous,
      ),
      stretch ? Spacer() : SizedBox(width: 32),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          //padding:EdgeInsets.symmetric(horizontal: 32, vertical: 32),
          backgroundColor: Colors.orangeAccent,
          foregroundColor: Colors.orangeAccent,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        ),
        onPressed: next,
        child: Icon(Icons.arrow_forward, size: 16, color: Colors.white,)
        )
  ],
);

Widget buildIndicator() => AnimatedSmoothIndicator(
  activeIndex: activeIndex,
  count: imageList.length,
  effect: const SlideEffect(activeDotColor: Colors.orangeAccent),
);

void next() => controller.nextPage();
void previous() => controller.previousPage();

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
            child:  Text(
              'CONTACT US',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width < 1000 ? 10 : 13, height: 1.0)
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
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,)
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
    body:
    ListView(
      children: <Widget>[
        Container(
            decoration: const BoxDecoration (
            gradient: LinearGradient(
              colors: [Colors.white, Color.fromRGBO(228, 214, 192, 1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Maite's color
          // color: Color.fromRGBO(228, 214, 192, 1),
      child:Column(
      children: <Widget>[
        Stack(
          children: [
            Align(
    alignment: Alignment.topLeft,
    child: 
    Container(
          decoration: BoxDecoration (
          color: Colors.amber,
          image: const DecorationImage(
            image: AssetImage('assets/images/pexels-pixabay-276528.jpg'),
            fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 1.05,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(12),
        ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
    
    ),

Align(
          alignment: Alignment.topLeft,
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: Container(
              decoration: const BoxDecoration (
                image: DecorationImage(
                  image: AssetImage('assets/images/dia5.png'),
                  //fit: BoxFit.cover,
                ),
          ),
        width: (MediaQuery.of(context).size.width < 1000) ? 120 : 300,
        height: (MediaQuery.of(context).size.height < 1000) ? 120 : 300,
        child: Opacity(
          opacity: 0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: const Size.fromWidth(4),),
          onHover: (hovered) async {
            if (!_controller.isAnimating) {
              _controller.reset();
              _controller.forward();
            }
          },
          onPressed: () async {
          },
          child: Text(''), 
        )
        ),
      ),),      
   ),
   Positioned(
    // left: (MediaQuery.of(context).size.width < 1000) ? (MediaQuery.of(context).size.width / 6.90) : (MediaQuery.of(context).size.width / 6.00),
    // top: (MediaQuery.of(context).size.height < 1000) ? (MediaQuery.of(context).size.height / 1.25) : (MediaQuery.of(context).size.height / 1.125),
    left: (MediaQuery.of(context).size.width < 1000) ? (MediaQuery.of(context).size.width / 6.90) : (MediaQuery.of(context).size.width / 6.50),
    top: (MediaQuery.of(context).size.height < 1000) ? (MediaQuery.of(context).size.height / 3.25) : (MediaQuery.of(context).size.height / 3.125),
    child: Container(
    // alignment: Alignment(0.0,-1.0),
    height: (MediaQuery.of(context).size.width < 1000) ? 300 : 1800,
    width: (MediaQuery.of(context).size.width < 1000) ? 300 : 1800,

    child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Cliffside Upholstery\n',
              style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: (MediaQuery.of(context).size.width < 1000) ? 50 : 110, color: Colors.white, fontFamily: "Century Gothic"),
            children: <TextSpan> [
            TextSpan(text: '40+ Years of Excellence', 
            style: TextStyle(decoration: TextDecoration.none, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "Century Gothic", fontSize: (MediaQuery.of(context).size.width < 1000) ? 30 : 90, fontStyle: FontStyle.italic)),
            ]),
            selectionColor: Colors.black,
          ),),),

          ],
        ),

      //Invis widget
      Opacity(
        opacity: 0,
        child: Container (
            height: 62.5,
            width: 62.5,
            color: Colors.pink,
        )
      ),

        Align(
          alignment: Alignment(0.0,-2),
          child: Container(
          decoration: BoxDecoration (
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        color: Color.fromARGB(255, 248, 247, 247),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          ),
        ),
          // width:750,
          // height:55,
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: '\nCliffside Upholstery will transform your space, a trusted name in the business for over four decades.',
              style: const TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 25.0, color: Colors.black, fontFamily: "Century Gothic"),
            children: <TextSpan> [
            TextSpan(text: ' Serving South Florida and New Jersey, we bring unparalled craftmanship to every piece. From timeless classics that need a refurbish or repair, or creating something new to breathe life into your living space, experience fantastic designs made by expert upholsterers and everything else we have to offer.\n\n', 
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Century Gothic", fontSize: 25.0)),
            ]),
            selectionColor: Colors.black,
          ),
        ),
      ),

      //Invis widget
      Opacity(
        opacity: 0,
        child: Container (
            height: 62.5,
            width: 62.5,
            color: Colors.pink,
        )
      ),

      Align(
        alignment: Alignment(0,0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ContactMenu()));
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.orangeAccent,
            backgroundColor: Colors.orangeAccent,
            foregroundColor: Colors.orangeAccent,
            fixedSize: Size.fromHeight(40),
            elevation: 5,
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
          ),
          child: const Text('Find Out More',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 25.0,) 
          ),
        )
      ),

      //Invis widget
      Opacity(
        opacity: 0,
        child: Container (
            height: 62.5,
            width: 62.5,
            color: Colors.pink,
        )
      ),

      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
          options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 1.75,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    //aspectRatio: 5.0,
                    autoPlay: true,
                    //reverse: true,
                    initialPage: 0,
                  onPageChanged: (index, reason) => (
                    setState(() => activeIndex = index)
                  ),
                  ),
              items: imageList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return FittedBox(
                      child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                      ),
                      child: Image.asset(
                        imgUrl,
                         //width: 2000,
                        // height: 1000000,
                        fit: BoxFit.fill,
                      ),
                    ),
                    );
                  },
                );
              }).toList(),
              carouselController: controller,
            ),
            const SizedBox(height: 32),
            buildIndicator(),
            //Invis widget
            Opacity(
              opacity: 0,
              child: Container (
                height: 10,
                width: 10,
                color: Colors.pink,
              )
            ),
            buildButtons()
          ]
        ),

      //Invis widget
      Opacity(
        opacity: 0,
        child: Container (
            height: 62.5,
            width: 62.5,
            color: Colors.pink,
        )
      ),

      Container(
          decoration: BoxDecoration (
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        color: Color.fromARGB(255, 248, 247, 247),
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
        ),
        ),
          // width:750,
          // height:55,
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: '\nCraftsmanship is our expertise. Our New Jersey office is located just across from NYC, overlooking the Hudson River. We\'re excited about repairing your sentimental pieces or creating something anew, contact us for any consoltations, pricing and more.\n',
              style: const TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 25.0, color: Colors.black, fontFamily: "Century Gothic"),
            children: <TextSpan> [
            ]),
            selectionColor: Colors.black,
          ),
        ),

      //Invis widget
      Opacity(
        opacity: 0,
        child: Container (
            height: 62.5,
            width: 62.5,
            color: Colors.pink,
        )
      ),
      
      Row(
        children: [
        InkWell(
          child: Container(
          decoration: BoxDecoration (
          color: Colors.amber,
          image: const DecorationImage(
            image: AssetImage('assets/images/Addy1.JPG'),
            fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 4,
          color: Colors.black,
        ),
      borderRadius: BorderRadius.circular(12),
        ),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
        // child: 
        ),
        onTap: () => launch("https://www.google.com/maps/dir//14A+Dempsey+Ave,+Edgewater,+NJ+07020/@40.827137,-73.9766369,17z/data=!4m9!4m8!1m0!1m5!1m1!1s0x89c2f650d85bb59b:0x4c9f4ba2082706dd!2m2!1d-73.974062!2d40.827133!3e0?entry=ttu"),
        ),
      //),

      Container(
          decoration: BoxDecoration (
          color: Colors.white,
        border: Border.all(
          width: 4,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(12),
        ),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          child:
            Column(
              children: [
                Text('Contact Information\n', style: TextStyle(fontSize: (MediaQuery.of(context).size.width < 1000) ? 24 : 50, fontWeight: FontWeight.bold, decoration: TextDecoration.underline), textAlign: TextAlign.center),
                Text('14A Dempsey Avenue, Edgewater, NJ, 07020\n', style: TextStyle(fontSize: (MediaQuery.of(context).size.width < 1000) ? 16 : 38, fontWeight: FontWeight.normal), textAlign: TextAlign.left,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.phone_rounded, size: (MediaQuery.of(context).size.width < 1000) ? 38 : 55 , color: Colors.green),
                  TextButton(onPressed: () => launch("tel://5617796438"), child: Text('561-779-6438', style: TextStyle(fontSize: (MediaQuery.of(context).size.width < 1000) ? 16 : 38, fontWeight: FontWeight.normal), textAlign: TextAlign.center)),
                ],),
                TextButton(
                onPressed: () {
                   final email = Uri(
                      scheme: 'mailto',
                      path: 'Marai.Rodezno@aol.com',
                      query: 'subject=&body=',
                    );
                  launch(email.toString());}, 
                child: Text('\nMaria.Rodezno@aol.com\n', 
                  style: TextStyle(fontSize: (MediaQuery.of(context).size.width < 1000) ? 16 : 38, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center))
              ],),
        ),
    ],
    ),
      
  ],
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
        color: Color.fromRGBO(198, 198, 198, 1),
        child: Row(
          children: [
            TextButton(
            child:  Text(
              'CONTACT US',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width < 1000 ? 10 : 13, height: 1.0)
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
      body:
          ListView(
      children: <Widget>[
        Container(
            decoration: const BoxDecoration (
            gradient: LinearGradient(
              colors: [Colors.white, Color.fromRGBO(228, 214, 192, 1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Maite's color
          // color: Color.fromRGBO(228, 214, 192, 1),
      child:Column(
      children: <Widget>[
        Stack(
          children: [
            Align(
    alignment: Alignment.topLeft,
    child: 
    Container(
          decoration: BoxDecoration (
          color: Colors.amber,
          image: const DecorationImage(
            image: AssetImage('assets/images/pexels-max-rahubovskiy-6980665.jpg'),
            fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 1.05,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(12),
        ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
    
    ),

   Positioned(
    left: (MediaQuery.of(context).size.width < 1000) ? (MediaQuery.of(context).size.width / 6.90) : (MediaQuery.of(context).size.width / 6.50),
    top: (MediaQuery.of(context).size.height < 1000) ? (MediaQuery.of(context).size.height / 3.25) : (MediaQuery.of(context).size.height / 3.125),
    child: Container(
    // alignment: Alignment(0.0,-1.0),
    height: (MediaQuery.of(context).size.width < 1000) ? 300 : 1800,
    width: (MediaQuery.of(context).size.width < 1000) ? 300 : 1800,

    child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'CONTACT US\n',
              style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: (MediaQuery.of(context).size.width < 1000) ? 50 : 110, color: Colors.white, fontFamily: "Century Gothic"),
            
          ),),),),

          ],
        ),

      //Invis widget
      Opacity(
        opacity: 0,
        child: Container (
            height: 62.5,
            width: 62.5,
            color: Colors.pink,
        )
      ),

        Align(
          alignment: Alignment(0.0,-2),
          child: Container(
          decoration: BoxDecoration (
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        color: Color.fromARGB(255, 248, 247, 247),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          ),
        ),
          // width:750,
          // height:55,
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: '\nCliffside Upholstery will transform your space, a trusted name in the business for over four decades.',
              style: const TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: 25.0, color: Colors.black, fontFamily: "Century Gothic"),
            children: <TextSpan> [
            TextSpan(text: 'Our New Jersey workshop is located just across from NYC, overlooking the Hudson River. We\'re commited to excellence and making something you\'ll love. To make a consultation with us, or reach out for questions on what we can provide, or even our pricing, reach out via our phone number or email for any information:', 
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Century Gothic", fontSize: 25.0)),
            ]),
            selectionColor: Colors.black,
          ),
        ),
      ),

      //Invis widget
      Opacity(
        opacity: 0,
        child: Container (
            height: 62.5,
            width: 62.5,
            color: Colors.pink,
        )
      ),
      
      Row(
        children: [
        InkWell(
          child: Container(
          decoration: BoxDecoration (
          color: Colors.amber,
          image: const DecorationImage(
            image: AssetImage('assets/images/Addy1.JPG'),
            fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 4,
          color: Colors.black,
        ),
      borderRadius: BorderRadius.circular(12),
        ),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
        // child: 
        ),
        onTap: () => launch("https://www.google.com/maps/dir//14A+Dempsey+Ave,+Edgewater,+NJ+07020/@40.827137,-73.9766369,17z/data=!4m9!4m8!1m0!1m5!1m1!1s0x89c2f650d85bb59b:0x4c9f4ba2082706dd!2m2!1d-73.974062!2d40.827133!3e0?entry=ttu"),
        ),
      //),

      Container(
          decoration: BoxDecoration (
          color: Colors.white,
        border: Border.all(
          width: 4,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(12),
        ),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          child:
            Column(
              children: [
                Text('Contact Information\n', style: TextStyle(fontSize: (MediaQuery.of(context).size.width < 1000) ? 24 : 50, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),textAlign: TextAlign.center),
                Text('14A Dempsey Avenue, Edgewater, NJ, 07020\n\n', style: TextStyle(fontSize: (MediaQuery.of(context).size.width < 1000) ? 16 : 38, fontWeight: FontWeight.normal), textAlign: TextAlign.left,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.phone_rounded, size: (MediaQuery.of(context).size.width < 1000) ? 38 : 55 , color: Colors.green),
                  TextButton(onPressed: () => launch("tel://5617796438"), child: Text('561-779-6438', style: TextStyle(fontSize: (MediaQuery.of(context).size.width < 1000) ? 16 : 38, fontWeight: FontWeight.normal), textAlign: TextAlign.center)),
                ],),
                TextButton(
                onPressed: () {
                   final email = Uri(
                      scheme: 'mailto',
                      path: 'Marai.Rodezno@aol.com',
                      query: 'subject=&body=',
                    );
                  launch(email.toString());}, 
                child: Text('\nMaria.Rodezno@aol.com\n', 
                  style: TextStyle(fontSize: (MediaQuery.of(context).size.width < 1000) ? 16 : 38, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center))
              ],),
        ),
    ],
    ),
     //Invis widget
      Opacity(
        opacity: 0,
        child: Container (
            height: 62.5,
            width: 62.5,
            color: Colors.pink,
        )
      ),

        Align(
          alignment: Alignment(0.0,-2),
          child: Container(
          decoration: BoxDecoration (
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        color: Color.fromARGB(255, 248, 247, 247),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          ),
        ),
          // width:750,
          // height:55,
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: '\n*Please use the 14A Dempsey Ave Address for any P.O shipments to our store.\n\n *Please note that it may take up to 72 hours for a response from us as we work on existing pieces.\n',
              style: const TextStyle(fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, fontSize: 25.0, color: Colors.black, fontFamily: "Century Gothic"),),
            selectionColor: Colors.black,
          ),
        ),
      ),
      
  ],
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
            child: Text(
              'CONTACT US',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width < 1000 ? 10 : 13)
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
          Text('  - © 2024 Cliffside Upholstery -'),
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
        color: Color.fromRGBO(198, 198, 198, 1),
        child: Row(
          children: [
            TextButton(
            child: Text(
              'CONTACT US',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width < 1000 ? 10 : 13, height: 1.0)
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
      body:
          ListView(
      children: <Widget>[
        Container(
            decoration: const BoxDecoration (
            gradient: LinearGradient(
              colors: [Colors.white, Color.fromRGBO(228, 214, 192, 1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // Maite's color
          // color: Color.fromRGBO(228, 214, 192, 1),
      child:Column(
      children: <Widget>[
        Stack(
          children: [
            Align(
    alignment: Alignment.topLeft,
    child: 
    Container(
          decoration: BoxDecoration (
          color: Colors.amber,
          image: const DecorationImage(
            image: AssetImage('assets/images/pexels-max-rahubovskiy-8135266.jpg'),
            fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 1.05,
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(12),
        ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
    
    ),

   Positioned(
    left: (MediaQuery.of(context).size.width < 1000) ? (MediaQuery.of(context).size.width / 6.90) : (MediaQuery.of(context).size.width / 6.50),
    top: (MediaQuery.of(context).size.height < 1000) ? (MediaQuery.of(context).size.height / 3.25) : (MediaQuery.of(context).size.height / 3.125),
    child: Container(
    // alignment: Alignment(0.0,-1.0),
    height: (MediaQuery.of(context).size.width < 1000) ? 300 : 1800,
    width: (MediaQuery.of(context).size.width < 1000) ? 300 : 1800,

    child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'ABOUT US\n',
              style: TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: (MediaQuery.of(context).size.width < 1000) ? 50 : 110, color: Colors.white, fontFamily: "Century Gothic"),
            
          ),),),),

          ],
        ),

      //Invis widget
      Opacity(
        opacity: 0,
        child: Container (
            height: 62.5,
            width: 62.5,
            color: Colors.pink,
        )
      ),

        Align(
          alignment: Alignment(0.0,-2),
          child: Container(
          decoration: BoxDecoration (
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        color: Color.fromARGB(255, 248, 247, 247),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          ),
        ),
          // width:750,
          // height:55,
          child: RichText(
            textAlign: TextAlign.center,
            text:  TextSpan(
              text: '\nCliffside Upholstery first began in',
              style:  TextStyle(fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, fontSize: (MediaQuery.of(context).size.width < 1000) ? 24 : 24, color: Colors.black, fontFamily: "Century Gothic"),
            children: <TextSpan> [
            TextSpan(text: ' 1984 ', 
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Century Gothic", fontSize: (MediaQuery.of(context).size.width < 1000) ? 24 : 24)),
            TextSpan(text: 'when began our endeavour to bring European fabric techniques and designs to America. We began our family owned store-front that year, and began to steadily serve the community of Hoboken and Fort Lee, NJ.\n\n Cliffside Upholstery was founded and is still operated by a family of 1st generation Americans, having been in the industry of both Spain and Honduras. We\'ve taken inspiration from our ties to Europe and Latin America and diversified it with contemporary American home\'s design. We\'ve manufactured, completed and installed pieces in many countries all around the globe.\n\nIn the standard work we complete, it will usually take between 3-5 days work from the 1st meeting establishing the details of the design. In other cases where pieces are either very large or require input from multiple upholsterers/designers, we\'re very experienced with coordinating with many different designers to create pieces for our clients. Extensive or multi-designer pieces can take anywhere from a month to multiple months. We\'re also quite experienced with pieces which use electrical components and can work on or create them with no issues. To make an appointment, or to inquire about about a piece or the price of work, please reach out via our phone-number or email address. ',
            style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontFamily: "Century Gothic", fontSize: (MediaQuery.of(context).size.width < 1000) ? 24 : 24) ),
            TextSpan(text: 'Thank You!', 
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontFamily: "Century Gothic", fontSize: (MediaQuery.of(context).size.width < 1000) ? 24 : 24, fontStyle: FontStyle.italic), ),
            ]),
            selectionColor: Colors.black,
          ),
        ),
      ),

      //Invis widget
      Opacity(
        opacity: 0,
        child: Container (
            height: 62.5,
            width: 62.5,
            color: Colors.pink,
        )
      ),
      
      Row(
        children: [
        InkWell(
          child: Container(
          decoration: BoxDecoration (
          color: Colors.amber,
          image: const DecorationImage(
            image: AssetImage('assets/images/Addy1.JPG'),
            fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 4,
          color: Colors.black,
        ),
      borderRadius: BorderRadius.circular(12),
        ),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
        // child: 
        ),
        onTap: () => launch("https://www.google.com/maps/dir//14A+Dempsey+Ave,+Edgewater,+NJ+07020/@40.827137,-73.9766369,17z/data=!4m9!4m8!1m0!1m5!1m1!1s0x89c2f650d85bb59b:0x4c9f4ba2082706dd!2m2!1d-73.974062!2d40.827133!3e0?entry=ttu"),
        ),
      //),

      Container(
          decoration: BoxDecoration (
          color: Colors.white,
        border: Border.all(
          width: 4,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(12),
        ),
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          child:
            Column(
              children: [
                Text('Contact Information\n', style: TextStyle(fontSize: (MediaQuery.of(context).size.width < 1000) ? 24 : 50, fontWeight: FontWeight.bold, decoration: TextDecoration.underline), textAlign: TextAlign.center,),
                Text('14A Dempsey Avenue, Edgewater, NJ, 07020\n\n', style: TextStyle(fontSize: (MediaQuery.of(context).size.width < 1000) ? 16 : 38, fontWeight: FontWeight.normal), textAlign: TextAlign.left,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.phone_rounded, size: (MediaQuery.of(context).size.width < 1000) ? 38 : 55 , color: Colors.green),
                  TextButton(onPressed: () => launch("tel://5617796438"), child: Text('561-779-6438', style: TextStyle(fontSize: (MediaQuery.of(context).size.width < 1000) ? 16 : 38, fontWeight: FontWeight.normal), textAlign: TextAlign.center)),
                ],),
                TextButton(
                onPressed: () {
                   final email = Uri(
                      scheme: 'mailto',
                      path: 'Marai.Rodezno@aol.com',
                      query: 'subject=&body=',
                    );
                  launch(email.toString());}, 
                child: Text('\nMaria.Rodezno@aol.com\n', 
                  style: TextStyle(fontSize: (MediaQuery.of(context).size.width < 1000) ? 16 : 38, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center))
              ],),
        ),
    ],
    ),
     //Invis widget
      Opacity(
        opacity: 0,
        child: Container (
            height: 62.5,
            width: 62.5,
            color: Colors.pink,
        )
      ),

      //   Align(
      //     alignment: Alignment(0.0,-2),
      //     child: Container(
      //     decoration: BoxDecoration (
      //   border: Border.all(
      //     width: 2,
      //     color: Colors.black,
      //   ),
      //   color: Color.fromARGB(255, 248, 247, 247),
      //   borderRadius: const BorderRadius.only(
      //     topRight: Radius.circular(25),
      //     topLeft: Radius.circular(25),
      //     bottomRight: Radius.circular(25),
      //     bottomLeft: Radius.circular(25),
      //     ),
      //   ),
      //     // width:750,
      //     // height:55,
      //     child: RichText(
      //       textAlign: TextAlign.center,
      //       text: const TextSpan(
      //         text: '\n*Please use the 14A Dempsey Ave Address for any P.O shipments to our store.\n\n *Please note that it may take up to 72 hours for a response from us as we work on existing pieces.\n',
      //         style: const TextStyle(fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, fontSize: 25.0, color: Colors.black, fontFamily: "Century Gothic"),),
      //       selectionColor: Colors.black,
      //     ),
      //   ),
      // ),
      
  ],
),
          ),
    
      ],
    ),
  );
  }
}

