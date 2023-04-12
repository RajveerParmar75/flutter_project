
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:typing_tutior/utils/colors.dart';
import 'function.dart';

// ignore: must_be_immutable
class Level1 extends StatefulWidget {
  List<Widget> list = [];
  String whichRow;

  Level1(this.whichRow, {super.key});

  @override
  State<Level1> createState() => _Level1State();
}

class _Level1State extends State<Level1> {
  var test = '';

  int divide = 1, wpm = 0, correct = 0, incorrect = 0, timeCount = 0, cpm = 0;
  double avg = 0;
  List<List<String>> keys = [
    ['TAB', 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', '[', ']', '|'],
    ['CAPS', 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', ';', "'", 'ENTER'],
    ['SHIFT', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', ',', '.', '?', 'SHIFT'],
    [' ']
  ];
  List<List<Color>> c = [
    [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ],
    [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ],
    [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ],
    [Colors.white]
  ];
  List<String> img = [
    'assets/images/index.png',
    'assets/images/middle.png',
    'assets/images/ring.png',
    'assets/images/pinkey.png'
  ];
  List<Color> colors = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];
  int count = 0;

  Widget getExpanded(String s, {colortext = Colors.white, symboles = ""}) {
    return Expanded(
      child: Text(
        s + symboles,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: colortext, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget getSpan({text, color}) {
    return Row(children: [
      Text(
        text.toString(),
        style: TextStyle(color: color ?? Colors.blue, fontSize: 50),
      ),
    ]);
  }

  void changeValue(String s, int count) {
    if (s == 'addColor') {
      if (keys[0].contains(test[count].toUpperCase())) {
        int index = keys[0].indexOf(test[count].toUpperCase());
        c[0][index] = Colors.blue.shade200;
        multipleWidget(keys[0], c[0]);
      } else if (keys[1].contains(test[count].toUpperCase())) {
        int index = keys[1].indexOf(test[count].toUpperCase());
        c[1][index] = Colors.blue.shade200;
        multipleWidget(keys[1], c[1]);
      } else if (keys[2].contains(test[count].toUpperCase())) {
        int index = keys[2].indexOf(test[count].toUpperCase());
        c[2][index] = Colors.blue.shade200;
        multipleWidget(keys[2], c[2]);
      } else if (keys[3].contains(test[count].toUpperCase())) {
        int index = keys[3].indexOf(test[count].toUpperCase());
        c[3][index] = Colors.blue.shade200;
        multipleWidget(keys[3], c[3]);
      }
    } else if (s == 'removeColor' && count != 0) {
      if (keys[0].contains(test[count - 1].toUpperCase())) {
        int index = keys[0].indexOf(test[count - 1].toUpperCase());
        c[0][index] = Colors.white;
        multipleWidget(keys[0], c[0]);
      } else if (keys[1].contains(test[count - 1].toUpperCase())) {
        int index = keys[1].indexOf(test[count - 1].toUpperCase());
        c[1][index] = Colors.white;
        multipleWidget(keys[1], c[1]);
      } else if (keys[2].contains(test[count - 1].toUpperCase())) {
        int index = keys[2].indexOf(test[count - 1].toUpperCase());
        c[2][index] = Colors.white;
        multipleWidget(keys[2], c[2]);
      } else if (keys[3].contains(test[count - 1].toUpperCase())) {
        int index = keys[3].indexOf(test[count - 1].toUpperCase());
        c[3][index] = Colors.white;
        multipleWidget(keys[3], c[3]);
      }
    }
  }

  demo() {

      setState(() {
        calculateTime(correct + incorrect);
        cpm = getCPM(correct + incorrect);
      });
  }

  whichImage(String c) {
    if (c == 'a' || c == 'A' || c == 'q' || c == 'Q' || c == 'z' || c == 'Z') {
      return 'assets/images/pinkey.png';
    } else if (c == 's' ||
        c == 'S' ||
        c == 'w' ||
        c == 'W' ||
        c == 'x' ||
        c == 'X') {
      return 'assets/images/ring.png';
    } else if (c == 'd' ||
        c == 'D' ||
        c == 'e' ||
        c == 'E' ||
        c == 'c' ||
        c == 'C') {
      return 'assets/images/middle.png';
    } else if (c == 'f' ||
        c == 'F' ||
        c == 'r' ||
        c == 'R' ||
        c == 'v' ||
        c == 'V') {
      return 'assets/images/index.png';
    } else if (c == ' ') {
      return 'assets/images/spaceLeft.png';
    } else if (c == 'L' ||
        c == 'K' ||
        c == 'J' ||
        c == ':' ||
        c == 'P' ||
        c == 'O' ||
        c == 'I' ||
        c == 'U' ||
        c == 'M' ||
        c == 'N' ||
        c == 'B' ||
        c == "<") {
      return 'assets/images/pinkey.png';
    } else {
      return 'assets/images/leftDefault.png';
    }
  }

  whichImageOnRight(String c) {
    if (c == ';' || c == 'p' || c == 'P' || c == ',') {
      return 'assets/images/rightPinkey.png';
    } else if (c == ' ') {
      return 'assets/images/space.png';
    } else if (c == 'l' || c == 'L' || c == 'o' || c == 'O' || c == 'm') {
      return 'assets/images/rightRing.png';
    } else if (c == 'k' || c == 'K' || c == 'i' || c == 'I' || c == 'n') {
      return 'assets/images/rightMiddle.png';
    } else if (c == 'j' || c == 'J' || c == 'u' || c == 'U' || c == 'b') {
      return 'assets/images/rightIndex.png';
    } else if (c == 'A' ||
        c == 'S' ||
        c == 'D' ||
        c == 'F' ||
        c == 'Q' ||
        c == 'W' ||
        c == 'E' ||
        c == 'R' ||
        c == 'Z' ||
        c == 'X' ||
        c == 'C' ||
        c == 'V') {
      return 'assets/images/rightPinkey.png';
    } else {
      return 'assets/images/rightDefault.png';
    }
  }

  whichString(String string) {
    if (string == 'Home Row') {
      setState(() {
        test = 'asdf ;lkj   ';
      });
    } else if (string == 'Home & Top Row') {
      setState(() {
        test = 'awer ;lkj   '; //
      });
    } else if (string == 'Home & Bottom Row') {
      setState(() {
        test = 'asdf zxcv   ';
      });
    } else if (string == 'Top & Bottom Row') {
      setState(() {
        test = 'awer zxcv   '; //
      });
    } else if (string == 'Home & Top Row & Bottom') {
      setState(() {
        test = 'asdf poiu   ';
      });
    } else if (string == 'Home Row & shift') {
      setState(() {
        test = 'AsDf ;LkJ   ';
      });
    } else if (string == 'Top Row & shift') {
      setState(() {
        test = 'IqeR PoIu   ';
      });
    } else if (string == "Top Row") {
      setState(() {
        test = 'qwer poiu   ';
      });
    } else if (string == 'Bottom Row') {
      setState(() {
        test = 'zxcv ,mnb   ';
      });
    }
  }

  Widget getCustom({text, color, flex}) {
    return Expanded(
      flex: flex ?? 1,
      child: Container(
        color: color,
        child: Text(
          text.toString(),
          style: const TextStyle(fontSize: 50),
        ),
      ),
    );
  }

  List<Widget> getKeybord(String s, List<Color> c) {
    List<Widget> l = [];
    for (int i = 0; i < s.length; i++) {
      getCustom(text: s[i], color: c[i]);
    }
    return l;
  }

  @override
  void initState() {
    // Timer.periodic(new Duration(minutes: 1), (timer) {
    //   setState(() {
    //     divide++;
    //     cpm=cpm~/divide;
    //   });
    // });
    whichString(widget.whichRow);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.initState();
  }
 @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Widget whichViwe(flag) {
    if (flag) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: kPrimaryBackgroundColor,
              // <-- SEE HERE
              statusBarIconBrightness: Brightness.dark,
              //<-- For Android SEE HERE (dark icons)
              statusBarBrightness:
                  Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
            backgroundColor: const Color(0xFFFD8469),
            title: Center(
              child: Text(widget.whichRow),
            ),
          ),
          body: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      color: Colors.black87,
                      child: Row(
                        children: [
                          getExpanded('Correct'),
                          getExpanded("Wrong"),
                          getExpanded("avg"),
                          getExpanded("Speed")
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        getExpanded(correct.toString(),
                            colortext: Colors.black87),
                        getExpanded(incorrect.toString(),
                            colortext: Colors.red),
                        getExpanded(avg.floor().toString(),
                            colortext: Colors.black87, symboles: '%'),
                        getExpanded(cpm.toString(),
                            colortext: Colors.black87, symboles: "WPM")
                      ],
                    ),
                    Container(
                      height: 2,
                      color: Colors.black87,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: getSplitValue(test, colors),
                      ),
                    ),

                    // Text(
                    //   style: const TextStyle(fontSize: 30),
                    //   test[count],
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              children: [
                                Row(children: multipleWidget(keys[0], c[0])),
                                Row(children: multipleWidget(keys[1], c[1])),
                                Row(children: multipleWidget(keys[2], c[2])),
                                Row(children: multipleWidget(keys[3], c[3])),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(50.0),
                                child: Image.asset(
                                  whichImage(
                                    test[count].toString(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(50.0),
                                child: Image.asset(
                                  whichImageOnRight(
                                    test[count].toString(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Row(children: getSplitValue(test, colors),),Column()],
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Color(0xCCFD8469)
            //color set to purple or set your own color
            ));
    avg = correct - incorrect > 0
        ? ((correct - incorrect) / (correct + incorrect)) * 100
        : 0;

    if (widget.list.isEmpty) {
      getSplitValue(test, colors);
      setState(() {
        demo();
        colors[count] = Colors.blue;
      });
    }
    if (test[count].codeUnitAt(0) >= 65 &&
        test[count].codeUnitAt(0) <= 90 &&
        count == 0) {
      if (test[count] == 'D' ||
          test[count] == 'A' ||
          test[count] == 'F' ||
          test[count] == 'S' ||
          test[count] == 'Q' ||
          test[count] == 'W' ||
          test[count] == 'E' ||
          test[count] == 'R' ||
          test[count] == 'Z' ||
          test[count] == 'X' ||
          test[count] == 'C' ||
          test[count] == 'V') {
        c[2][11] = Colors.blue.shade200;
      } else {
        c[2][0] = Colors.blue.shade200;
      }
    }
    changeValue('addColor', count);
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) => {
        if (event is RawKeyDownEvent)
          {
            demo(),
            if (test[count].codeUnitAt(0) >= 65 &&
                test[count].codeUnitAt(0) <= 90)
              {
                if (event.isShiftPressed &&
                    event.logicalKey.keyLabel.toString().toLowerCase() ==
                        test[count].toLowerCase())
                  {
                    setState(() {
                      colors[count] = Colors.green;
                      if (test[count + 1].codeUnitAt(0) >= 65 &&
                          test[count + 1].codeUnitAt(0) <= 90) {
                        // c[2][0] = Colors.blue.shade200;
                      } else {
                        c[2][11] = Colors.white;
                        c[2][0] = Colors.white;
                      }
                      if (test[count + 1] == test[count + 2]) {
                        correct++;
                        changeValue('addColor', count + 1);
                      } else {
                        correct++;
                        changeValue('addColor', count + 1);
                        changeValue('removeColor', count + 1);
                      }
                      changeValue('removeColor', count + 1);
                      changeValue('addColor', count + 1);
                      colors[count + 1] = Colors.blue;
                      getSplitValue(test, colors);
                      count++;
                      if (count == 10) {
                        changeValue('removeColor', count + 1);
                        changeValue('removeColor', count);
                        setState(() {
                          for (int i = 0; i < count; i++) {
                            colors[i] = Colors.grey;
                          }
                        });

                        count = 0;
                      }
                      // if (count == test.trim().length) {
                      //   ArtSweetAlert.show(
                      //       context: context,
                      //       artDialogArgs: ArtDialogArgs(
                      //           onConfirm: () {
                      //             Navigator.pop(context);
                      //             Navigator.pop(context);
                      //           },
                      //           type: ArtSweetAlertType.success,
                      //           title: "A success message!",
                      //           text: "Show a success message with an icon"));
                      // }
                    }),
                  }
                else if (!(event.logicalKey.keyLabel.toString() ==
                            "Shift Left" ||
                        event.logicalKey.keyLabel.toString() ==
                            "Shift Right") &&
                    event.logicalKey.keyLabel.toString().toLowerCase() !=
                        test[count].toLowerCase())
                  {
                    setState(() {
                      AudioCache().play('sound/sound_keyboard_wrong.ogg');
                      colors[count] = Colors.red;
                      incorrect++;
                      count++;
                      if (test[count].codeUnitAt(0) >= 97 &&
                              test[count].codeUnitAt(0) <= 122 ||
                          test[count] == ' ') {
                        c[2][11] = Colors.white;
                        c[2][0] = Colors.white;
                      }
                      if (count == 10) {
                        c[2][11] = Colors.white;
                        c[2][0] = Colors.white;
                        for (int i = 0; i < count; i++) {
                          colors[i] = Colors.grey;
                        }

                        changeValue('removeColor', count + 1);
                        changeValue('removeColor', count);
                        count = 0;
                      }
                      changeValue('removeColor', count);
                      // colors[count] = Colors.blue;
                      getSplitValue(test, colors);
                    }),
                    // setState(() {

                    //   colors[count] = Colors.red;
                    //   count++;
                    //   if(count==9){
                    //     for(int i=0;i<count;i++){
                    //       print('loop');
                    //       colors[i]=Colors.white;
                    //
                    //     }
                    //     changeValue('removeColor', count + 1);
                    //     changeValue('removeColor', count);
                    //     count=0;
                    //   }
                    //   changeValue('removeColor', count);
                    //   colors[count] = Colors.blue;
                    //   getSplitValue(test, colors);
                    //
                    // })
                  }
                else if (event.logicalKey.keyLabel.toLowerCase() ==
                    test[count].toLowerCase())
                  {
                    setState(() {
                      AudioCache().play('sound/sound_keyboard_wrong.ogg');
                      colors[count] = Colors.red;
                      incorrect++;
                      count++;
                      if (test[count].codeUnitAt(0) >= 97 &&
                              test[count].codeUnitAt(0) <= 122 ||
                          test[count] == ' ') {
                        c[2][11] = Colors.white;
                        c[2][0] = Colors.white;
                      }
                      if (count == 10) {
                        c[2][11] = Colors.white;
                        c[2][0] = Colors.white;
                        for (int i = 0; i < count; i++) {
                          colors[i] = Colors.grey;
                        }

                        changeValue('removeColor', count + 1);
                        changeValue('removeColor', count);
                        count = 0;
                      }
                      changeValue('removeColor', count);
                      // colors[count] = Colors.blue;
                      getSplitValue(test, colors);
                    }),
                  }
              }
            else
              {
                if (event.logicalKey.keyLabel.toString().toLowerCase() ==
                        test[count] &&
                    !event.isShiftPressed)
                  {
                    setState(() {
                      colors[count] = Colors.green;
                      if (test[count + 1].codeUnitAt(0) >= 65 &&
                          test[count + 1].codeUnitAt(0) <= 90) {
                        if (test[count + 1] == 'D' ||
                            test[count + 1] == 'A' ||
                            test[count + 1] == 'F' ||
                            test[count + 1] == 'S' ||
                            test[count + 1] == 'Q' ||
                            test[count + 1] == 'W' ||
                            test[count + 1] == 'E' ||
                            test[count + 1] == 'R' ||
                            test[count + 1] == 'Z' ||
                            test[count + 1] == 'X' ||
                            test[count + 1] == 'C' ||
                            test[count + 1] == 'V') {
                          correct++;
                          c[2][11] = Colors.blue.shade200;
                        } else {
                          correct++;
                          c[2][0] = Colors.blue.shade200;
                        }
                      } else {
                        correct++;
                        c[2][11] = Colors.white;
                        c[2][0] = Colors.white;
                      }
                      if (test[count + 1] == test[count + 2]) {
                        changeValue('addColor', count + 1);
                      } else {
                        changeValue('addColor', count + 1);
                        changeValue('removeColor', count + 1);
                      }
                      colors[count + 1] = Colors.blue;
                      getSplitValue(test, colors);
                      count++;
                      if (count == 10) {
                        cpm++;
                        for (int i = 0; i < count; i++) {
                          colors[i] = Colors.grey;
                        }
                        changeValue('removeColor', count + 1);
                        changeValue('removeColor', count);
                        count = 0;
                      }
                      changeValue('removeColor', count);
                      // if (count == test.trim().length) {
                      //   ArtSweetAlert.show(
                      //       context: context,
                      //       artDialogArgs: ArtDialogArgs(
                      //           onConfirm: () {
                      //             Navigator.pop(context);
                      //             Navigator.pop(context);
                      //           },
                      //           type: ArtSweetAlertType.success,
                      //           title: "A success message!",
                      //           text: "Show a success message with an icon"));
                      // }
                    }),
                  }
                else if (event.isShiftPressed)
                  {}
                else
                  {
                    setState(() {
                      if (test[count + 1].codeUnitAt(0) >= 65 &&
                          test[count + 1].codeUnitAt(0) <= 90) {
                        if (test[count + 1] == 'D' ||
                            test[count + 1] == 'A' ||
                            test[count + 1] == 'F' ||
                            test[count + 1] == 'S' ||
                            test[count + 1] == 'Q' ||
                            test[count + 1] == 'W' ||
                            test[count + 1] == 'E' ||
                            test[count + 1] == 'R' ||
                            test[count + 1] == 'Z' ||
                            test[count + 1] == 'X' ||
                            test[count + 1] == 'C' ||
                            test[count + 1] == 'V') {
                          c[2][11] = Colors.blue.shade200;
                        } else {
                          c[2][0] = Colors.blue.shade200;
                        }
                      }
                      AudioCache().play('sound/sound_keyboard_wrong.ogg');
                      colors[count] = Colors.red;
                      incorrect++;
                      count++;
                      if (count == 10) {
                        for (int i = 0; i < count; i++) {
                          colors[i] = Colors.grey;
                        }
                        changeValue('removeColor', count + 1);
                        changeValue('removeColor', count);
                        count = 0;
                      }
                      changeValue('removeColor', count);
                      // colors[count] = Colors.blue;
                      getSplitValue(test, colors);
                    })
                  }
              }
          }
      },
      child: whichViwe(true),
    );
  }
}
