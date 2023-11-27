import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/colors.dart';

class NewHomeScreen extends StatefulWidget {
  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  List<Widget> homeCard(int count, List<String> imageList) {
    List<Widget> l = [];
    for (int i = 0; i < count; i++) {}
    return l;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Container(
            height: (currentHeight(context, 25)),
            width: (currentWidth(context, 45)),
            child: Card(
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: Color.fromARGB(255, 245, 245, 247),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.only(right: currentWidth(context, 1),left: currentWidth(context, 1)),
                      margin: EdgeInsets.only(top :currentHeight(context, 1)),
                      width: currentWidth(context, 45),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/8982/8982297.png"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        "Home Row",
                        style: GoogleFonts.eduSaBeginner(fontWeight: FontWeight.w400,fontSize: 30,fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
