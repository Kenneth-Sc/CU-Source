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
    'assets/images/a1.jpg',
    'assets/images/Furn2.jpg',
    'assets/images/Furn1.jpg',
    'assets/images/Front.JPG'
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
            //   border: Border.all(
            // width: 4,
            // ),
            // borderRadius: BorderRadius.circular(12),
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
    left: (MediaQuery.of(context).size.width < 1000) ? (MediaQuery.of(context).size.width / 6.90) : (MediaQuery.of(context).size.width / 6.00),
    top: (MediaQuery.of(context).size.height < 1000) ? (MediaQuery.of(context).size.height / 1.25) : (MediaQuery.of(context).size.height / 1.125),
    child: Container(
    // alignment: Alignment(0.0,-1.0),
    height: (MediaQuery.of(context).size.width < 1000) ? 300 : 1800,
    width: (MediaQuery.of(context).size.width < 1000) ? 300 : 1800,

    child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Cliffside Upholstery\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, fontSize: (MediaQuery.of(context).size.width < 1000) ? 30 : 60, color: Colors.white, fontFamily: "Century Gothic"),
            children: <TextSpan> [
            TextSpan(text: '40+ Years of Excellence', 
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "Century Gothic", fontSize: (MediaQuery.of(context).size.width < 1000) ? 24 : 50, fontStyle: FontStyle.italic)),
            ]),
            selectionColor: Colors.black,
          ),),),

          ],
        ),


  //       Align(
  //         alignment: Alignment.topLeft,
  //         child: RotationTransition(
  //           turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
  //           child: Container(
  //             decoration: const BoxDecoration (
  //               image: DecorationImage(
  //                 image: AssetImage('assets/images/dia5.png'),
  //                 //fit: BoxFit.cover,
  //               ),
  //           //   border: Border.all(
  //           // width: 4,
  //           // ),
  //           // borderRadius: BorderRadius.circular(12),
  //         ),
  //       width:300,
  //       height:300,
  //       child: Opacity(
  //         opacity: 0,
  //         child: ElevatedButton(
  //           style: ElevatedButton.styleFrom(fixedSize: const Size.fromWidth(4),),
  //         onHover: (hovered) async {
  //           if (!_controller.isAnimating) {
  //             _controller.reset();
  //             _controller.forward();
  //           }
  //         },
  //         onPressed: () async {
  //         },
  //         child: Text(''), 
  //       )
  //       ),
  //     ),),      
  //  ),

    // Align(
    // alignment: Alignment.topLeft,
    // child: 
    // Container(
    //       decoration: BoxDecoration (
    //       color: Colors.amber,
    //       image: const DecorationImage(
    //         image: AssetImage('assets/images/pexels-pixabay-276528.jpg'),
    //         fit: BoxFit.cover,
    //     ),
    //     border: Border.all(
    //       width: 4,
    //       color: Colors.black,
    //     ),
    //     borderRadius: BorderRadius.circular(12),
    //     ),
    //       width: MediaQuery.of(context).size.width,
    //       height: MediaQuery.of(context).size.height,

    //     ),
    
    // ),

        // CarouselSlider.builder(
        //   itemCount: 5, 
        //   itemBuilder: (context,index,realIndex) {
        //     final currImg = Imgs[index];
        //     return buildImage(currImg, index);
        //   }, 
        //   options: CarouselOptions(height: MediaQuery.of(context).size.width / 3)
        // ),

        // CarouselSlider(
        //           options: CarouselOptions(
        //             height: MediaQuery.of(context).size.height / 5,
        //             //enlargeCenterPage: true,
        //             enableInfiniteScroll: false,
        //             //aspectRatio: 5.0,
        //             autoPlay: true,
        //           ),
        //           items: imageList.map((e) => ClipRRect(
        //             borderRadius: BorderRadius.circular(8),
        //             child: Stack(
        //               fit: StackFit.expand,
        //               children: <Widget>[
        //                 Image.asset(e,
        //                   fit: BoxFit.cover,
        //                   scale: 20,
        //                   width: MediaQuery.of(context).size.width / 100,
        //                   height: MediaQuery.of(context).size.height / 100,
        //                   )
        //               ],
        //             ) ,
        //           )).toList(),
        //             ),
        //  Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     CarouselSlider(
        //   options: CarouselOptions(
        //             height: MediaQuery.of(context).size.height / 5,
        //             //enlargeCenterPage: true,
        //             enableInfiniteScroll: false,
        //             //aspectRatio: 5.0,
        //             autoPlay: true,
        //             initialPage: 0,
        //           onPageChanged: (index, reason) => (
        //             setState(() => activeIndex = index)
        //           ),
        //           ),
        //       items: imageList.map((imgUrl) {
        //         return Builder(
        //           builder: (BuildContext context) {
        //             return FittedBox(
        //               child: Container(
        //               width: MediaQuery.of(context).size.width,
        //               margin: EdgeInsets.symmetric(horizontal: 10.0),
        //               decoration: BoxDecoration(
        //                 color: Colors.green,
        //               ),
        //               child: Image.asset(
        //                 imgUrl,
        //                  //width: 2000,
        //                 // height: 1000000,
        //                 fit: BoxFit.fill,
        //               ),
        //             ),
        //             );
        //           },
        //         );
        //       }).toList(),
        //       carouselController: controller,
        //     ),
        //     const SizedBox(height: 32),
        //     buildIndicator(),
        //     //Invis widget
        //     Opacity(
        //       opacity: 0,
        //       child: Container (
        //         height: 10,
        //         width: 10,
        //         color: Colors.pink,
        //       )
        //     ),
        //     buildButtons()
        //   ]
        // ),

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
        //   image: const DecorationImage(
        //     image: AssetImage('assets/images/a1.jpg'),
        //     fit: BoxFit.cover,
        // ),
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
                    height: MediaQuery.of(context).size.height / 5,
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
        //   image: const DecorationImage(
        //     image: AssetImage('assets/images/a1.jpg'),
        //     fit: BoxFit.cover,
        // ),
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
        //   Container(
        //   decoration: BoxDecoration (
        //   color: Colors.amber,
        //   image: const DecorationImage(
        //     image: AssetImage('assets/images/Furn1.jpg'),
        //     fit: BoxFit.cover,
        // ),
        // border: Border.all(
        //   width: 4,
        //   color: Colors.black,
        // ),
        // borderRadius: BorderRadius.circular(12),
        // ),
        //   width: MediaQuery.of(context).size.width / 3,
        //   height: MediaQuery.of(context).size.width / 3,
        // ),

        //Align(
          //alignment: Alignment(0.0,-0.5),
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

