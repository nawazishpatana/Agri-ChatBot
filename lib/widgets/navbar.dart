// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last, unnecessary_new

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screens/ChatBot.dart';
import '../Screens/about_us.dart';
import '../Screens/soilpedia/soilpedia_Card_list.dart';
import '../Screens/tips.dart';
import '../Screens/weather.dart';
import 'custom_btn.dart';

class AgriChatBot extends StatefulWidget {
  const AgriChatBot({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AgriChatBotState();
  }
}

class AgriChatBotState extends State<AgriChatBot> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    Weather(),
    SoilList(),
    Helper(),
    Tips(),
    AboutUs(),
  ];
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: Stack(
        children: [
          Center(
            child: _pages[currentIndex],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                fit: StackFit.expand,
                // overflow: Overflow.visible,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Column(
                    children: [
                      Center(
                        heightFactor: 0.6,
                        child: FloatingActionButton(
                            backgroundColor: Colors.green,
                            child: Icon(FontAwesomeIcons.gitlab),
                            elevation: 0.1,
                            onPressed: () {
                              setBottomBarIndex(2);
                            }),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        'ChatBot',
                        style: GoogleFonts.getFont('Didact Gothic',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                            fontSize: 14),
                      )
                    ],
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.cloudSunRain,
                                color: currentIndex == 0
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              onPressed: () {
                                setBottomBarIndex(0);
                              },
                              splashColor: Colors.white,
                            ),
                            Text(
                              'Weather',
                              style: GoogleFonts.didactGothic(
                                  fontSize: 14,
                                  color: currentIndex == 0
                                      ? Colors.white
                                      : Colors.black),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.seedling,
                                  color: currentIndex == 1
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(1);
                                }),
                            Text(
                              'Soilpedia',
                              style: GoogleFonts.didactGothic(
                                  fontSize: 14,
                                  color: currentIndex == 1
                                      ? Colors.white
                                      : Colors.black),
                            )
                          ],
                        ),
                        Container(
                          width: size.width * 0.20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.list,
                                  color: currentIndex == 3
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(3);
                                }),
                            Text(
                              'Tips',
                              style: GoogleFonts.didactGothic(
                                  fontSize: 14,
                                  color: currentIndex == 3
                                      ? Colors.white
                                      : Colors.black),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.mobile,
                                  color: currentIndex == 4
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                onPressed: () {
                                  setBottomBarIndex(4);
                                }),
                            Text(
                              'Contact Us',
                              style: GoogleFonts.didactGothic(
                                  fontSize: 14,
                                  color: currentIndex == 4
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
