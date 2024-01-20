// ignore_for_file: file_names
import 'package:commerce/view/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:introduction/homeScreen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class WelcomeScreen extends StatefulWidget {
const WelcomeScreen({Key? key}) : super(key: key);

@override
_WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
bool firstOpen = true;

_onIntroEnd(context) async {
Navigator.of(context)
.push(MaterialPageRoute(builder: (context) => LoginScreen()));
}

_buildFullScreenImage() {
return Container(
  padding: EdgeInsets.only(bottom:250 ,),
margin: const EdgeInsets.all(22),
child: Image.asset(
'assets/images/b.jpg',
fit: BoxFit.contain,
height: double.infinity,
width: double.infinity,
//alignment: Alignment.,
),
);
}

_buildImage(String assetName, [double width = 350]) {
return Image.asset('assets/images/$assetName', width: width);
}

@override
void initState() {
super.initState();
Future.delayed(const Duration(seconds: 3), () {
if (!firstOpen) {
_onIntroEnd(context);
}
});
}

@override
Widget build(BuildContext context) {
Size size = MediaQuery.of(context).size;
var pageDecoration = const PageDecoration(
titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
bodyTextStyle: TextStyle(fontSize: 19.0),
//Padding: EdgeInsets.all(16),
pageColor: Color.fromARGB(255, 249, 252, 252),
imagePadding: EdgeInsets.zero,
);


return firstOpen
? IntroductionScreen(
globalBackgroundColor: Color.fromARGB(223, 252, 252, 253),
globalHeader: Align(
alignment: Alignment.topRight,
child: SafeArea(
child: Padding(
padding: const EdgeInsets.only(top: 16, right: 16),
child: _buildImage('a.jpg', 50),
),
),
),
pages: [
PageViewModel(
title:'Welcome To Commerce',
body:
'Lorem Ipsum is simply dummy text of the printing and typesetting industry, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
image: _buildFullScreenImage(),
decoration: pageDecoration.copyWith(
contentMargin: const EdgeInsets.symmetric(horizontal: 16),
fullScreen: true,
//bodyFlex: 2,
//imageFlex: 3,

),
),
PageViewModel(
title: 'Save your money',
body:
'by using this app you will be updated about coins prices',
image: _buildImage('d.jpg'),
decoration: pageDecoration,

),
PageViewModel(
title: 'Save Your time',
body:
'don\t lose the time to now when you have to buy or sell coins',
image: _buildImage('f.jpg'),
decoration: pageDecoration,
),
],
onDone: () => _onIntroEnd(context),
onSkip: () =>
_onIntroEnd(context), // You can override onSkip callback
showSkipButton: true,
dotsFlex: 0,
nextFlex: 0,
skip: Text(
'Skip',
style: TextStyle(color: Colors.white),
),
next: const Icon(
Icons.arrow_forward,
color: Colors.white,
),
done: Text('Done',
style: TextStyle(
fontWeight: FontWeight.w600, color: Colors.white)),
controlsMargin: const EdgeInsets.all(16),
controlsPadding: const EdgeInsets.all(4),
dotsDecorator: const DotsDecorator(
size: Size(10.0, 10.0),
color: Colors.white,
activeSize: Size(22.0, 10.0),
activeColor: Color.fromARGB(255, 14, 243, 6),
activeShape: RoundedRectangleBorder(
borderRadius: BorderRadius.all(Radius.circular(25.0)),
),
),
dotsContainerDecorator: const ShapeDecoration(
color: Colors.black54,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.all(Radius.circular(8.0)),
),
),
)
: WillPopScope(
onWillPop: () async => false,
child: Scaffold(
body: SizedBox(
height: size.height,
width: double.infinity,
child: Stack(
children: [
Positioned(
top: 0,
left: 0,
child: Image.asset(
'assets/images/te.jpg',
width: size.width * 0.3,
),
),
Positioned(
bottom: 0,
left: 0,
child: Image.asset(
'assets/images/tr.jpg',
width: size.width * 0.2,
),
),
Center(
child: Image.asset(
'assets/images/jj.jpg',
width: size.width * 0.4,
),
),
],
),
),
),
);
}
}