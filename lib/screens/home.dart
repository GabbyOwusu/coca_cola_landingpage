import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titles = [
    'Home',
    'Product',
    'Whats New',
    'NewShelter',
    'Contact',
  ];

  final _images = [
    'images/pepsi001.png',
    'images/pepsi002.png',
    'images/pepsi003.png',
  ];

  final colors = [
    Colors.blue,
    Colors.red,
    Colors.black,
  ];

  final socials = [
    'images/instagram.png',
    'images/facebook.png',
    'images/twitter.png',
  ];

  int _currentIndex = 0;
  int hoverIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Padding(
          padding: EdgeInsets.only(left: 100),
          child: Image.asset(
            'images/logo.png',
            width: 50,
          ),
        ),
        actions: [
          ...List.generate(
            titles.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  titles[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(
              milliseconds: 200,
            ),
            color: colors[_currentIndex],
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'THAT\'S WHAT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 65,
                                color: Colors.white,
                              ),
                            ),
                            Text('I LIKE',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 150,
                                  color: Colors.white,
                                )),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit,' +
                                  'sed do eiusmod tempor incididunt.\n' +
                                  'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\nin reprehenderit in' +
                                  'voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                top: 30,
                              ),
                              height: 30,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text('VIEW ALL PRODUCTS'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 100),
                        child: Image.asset(_images[_currentIndex]),
                      ),
                      Column(
                        children: [
                          ...List.generate(3, (index) {
                            return Padding(
                              padding: EdgeInsets.all(20),
                              child: Image.asset(
                                socials[index],
                                width: 20,
                                color: Colors.white,
                              ),
                            );
                          })
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ...List.generate(3, (index) {
                      return InkWell(
                        onTap: () {
                          setState(() => _currentIndex = index);
                        },
                        onHover: (val) {
                          if (val) {
                            setState(() => hoverIndex = index);
                          }
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            bottom: hoverIndex == index ? 10 : 0,
                          ),
                          child: Image.asset(
                            _images[index],
                            width: 30,
                          ),
                        ),
                      );
                    }),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
