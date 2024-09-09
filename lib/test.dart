// class CarouselDemo extends StatefulWidget {
//   CarouselDemo() : super();

//   final String title = "Carousel Demo";

//   @override
//   CarouselDemoState createState() => CarouselDemoState();
// }

// class CarouselDemoState extends State<CarouselDemo> {
//   CarouselSlider carouselSlider;
//   int _current = 0;
//   List imgList = [
//     'images/main-slider/1.jpg',
//     'images/main-slider/2.jpg',
//     'images/main-slider/3.jpg',
//     'images/main-slider/4.jpg'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             carouselSlider = CarouselSlider(
//               height: 400.0,
//               initialPage: 0,
//               onPageChanged: (index) {
//                 setState(() {
//                   _current = index;
//                 });
//               },
//               items: imgList.map((imgUrl) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Container(
//                       width: MediaQuery.of(context).size.width,
//                       margin: EdgeInsets.symmetric(horizontal: 10.0),
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                       ),
//                       child: Image.asset(
//                         imgUrl,
//                         fit: BoxFit.fill,
//                       ),
//                     );
//                   },
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }