// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/bottom_nav.dart';
import 'package:my_flutter/course_detail.dart';
import 'package:my_flutter/profile.dart';

class Homepage extends StatefulWidget {
  final List<BottomNav> itemsNav = <BottomNav>[
    BottomNav('Home', Icons.store, null),
    BottomNav('My Courses', Icons.book, null),
    BottomNav('Profile', Icons.account_circle, null)
  ];

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const buildCard(),
    ProfilePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_book),
          onPressed: () {
            // Add your onPressed logic here
          },
        ),
        elevation: 0,
        centerTitle: false,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 211, 131),
              Color.fromARGB(255, 255, 131, 193)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: const Text(
            "Memariya App",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: _widgetOptions.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[700],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: widget.itemsNav.map((BottomNav d) {
          return BottomNavigationBarItem(
            icon: Icon(d.icon),
            label: d.title,
          );
        }).toList(),
      ),
    );
  }
}

class buildCard extends StatelessWidget {
  const buildCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "assets/images/py.png",
      "assets/images/java.png",
      "assets/images/js.png",
      "assets/images/cpp.png",
      "assets/images/linux.png",
    ];
    List<String> title1 = [
      "Learn Python",
      "Learn Java",
      "Learn JavaScript",
      "Learn C++",
      "Learn Linux",
    ];
    List<String> des = [
      "Python is one of the most popular and fastest programming language since half a decade.\nIf You think you have learnt it.. \nJust test yourself !!",
      "Java has always been one of the best choices for Enterprise World. If you think you have learn the Language...\nJust Test Yourself !!",
      "Javascript is one of the most Popular programming language supporting the Web.\nIt has a wide range of Libraries making it Very Powerful !",
      "C++, being a statically typed programming language is very powerful and Fast.\nit's DMA feature makes it more useful. !",
      "Linux is a OPEN SOURCE Operating System which powers many Servers and Workstation.\nIt is also a top Priority in Developement Work !",
    ];
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Container(width: 5),
              Text("New Releases",
                  style: TextStyle(
                      color: Colors.grey[800], fontWeight: FontWeight.w500)),
              Expanded(
                child: Container(),
              ),
              ButtonTheme(
                minWidth: 10,
                child: TextButton(
                  style: TextButton.styleFrom(primary: Colors.transparent),
                  child: Text("MORE",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500)),
                  onPressed: () {},
                ),
              ),
            ]),
            Container(height: 5),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoursePage(
                            title: title1[index],
                            image: images[index],
                            description: des[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            images[index],
                            height: 140,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          Container(height: 15),
                          Row(
                            children: <Widget>[
                              Container(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      title1[index],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[900],
                                      ),
                                    ),
                                    Text(
                                      "1.2k views",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(width: 10),
                            ],
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
