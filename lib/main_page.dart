import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:typing_tutior/devloper_screen.dart';
import 'package:typing_tutior/splitValue.dart';

class Index_page extends StatefulWidget {
  const Index_page({super.key});

  @override
  State<Index_page> createState() => _Index_pageState();
}

class _Index_pageState extends State<Index_page> {
  List<String> imageList = [
    'assets/keybord_image/homeRow.png',
    'assets/keybord_image/hometop.png',
    'assets/keybord_image/homeRowbottomRow.png',
    'assets/keybord_image/BOTTOMtop.png',
    'assets/keybord_image/homeRowtop.png',
    'assets/keybord_image/homeRowSHIFT.png',
    'assets/keybord_image/toprowshift.png',
    'assets/keybord_image/toprow.png',
    'assets/keybord_image/bottomRow.png'
  ];
  List<String> lang = [
    'Home Row',
    'Home & Top Row',
    'Home & Bottom Row',
    'Top & Bottom Row',
    'Home & Top Row & Bottom',
    'Home Row & shift',
    'Top Row & shift',
    'Top Row',
    'Bottom Row'
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xCCFD8469)
            //color set to purple or set your own color
            ));

    return SafeArea(
      child: Scaffold(
        appBar: (AppBar(
          actions: [
            PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AboutUs();
                            },
                          ),
                        ).then((value) => Navigator.pop(context));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                              color: Colors.grey,
                              Icons.person_pin_circle_outlined),
                          Text('devloper'),
                        ],
                      )),
                ),
              ],
            ),
          ],
          // systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:Color(0x66FC6C4A) ),
          backgroundColor: const Color(0xFFFD8469),
          title: const Center(
            child: Text("Select Row"),
          ),
        )),
        backgroundColor: Colors.white,
        body: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(lang.length, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  (context),
                  MaterialPageRoute(
                    builder: (context) {
                      return Level1(lang[index]);
                    },
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Color(0xFF41586c),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(imageList[index]),
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.only(top: 10),
                          height:50,
                          width: double.infinity,
                          color:Color.fromRGBO(0, 0, 0, 0.65),
                          child: Text(
                            lang[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
        // SingleChildScrollView(
        //   child: Center(
        //     child: Column(
        //       children: getCard(lang, imageList),),
        //   ),
        // ),
      ),
    );
  }

  Widget card(String st, String img) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              (context),
              MaterialPageRoute(builder: (context) => Level1(st)),
            );
          },
          child: Card(
            color: const Color(0xFF465C6E),
            margin: const EdgeInsets.all(5),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      st,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(child: Image.asset(img))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  List<Widget> getCard(List<String> list, List<String> img) {
    List<Widget> l = [];
    for (int i = 0; i < list.length; i++) {
      l.add(card(list[i], img[i]));
    }
    return l;
  }
}
