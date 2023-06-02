// ignore_for_file: deprecated_member_use, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamInfo extends StatefulWidget {
  const TeamInfo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TeamInfoState();
  }
}

class TeamInfoState extends State<TeamInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFFFEFBEA),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: GradientColors.februaryInk,
        )),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 10, 0, 0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Meet The Team',
                          style: GoogleFonts.poppins(
                              fontSize: 24, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () => launch(
                      'https://www.facebook.com/sishrat.hussainsherazi?mibextid=ZbWKwL'),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.green,
                          backgroundImage: AssetImage("assets/team/ahmad.jpg"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Sayed Ahmad',
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Group Leader',
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Know More >',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () => launch(
                      'https://www.facebook.com/profile.php?id=100009293911393&mibextid=ZbWKwL'),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFf8b470),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ijaz Hussain',
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Software Developer',
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Know More >',
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          backgroundColor: const Color(0xFFf8b470),
                          radius: 45,
                          backgroundImage: AssetImage("assets/team/ijaz.jpg"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () => launch(
                      'https://www.facebook.com/profile.php?id=100009182847193&mibextid=ZbWKwL'),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.green,
                          backgroundImage: AssetImage("assets/team/th.jpg"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Tahir Hassan ',
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Software Developer',
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              'Know More >',
                              style: GoogleFonts.poppins(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
