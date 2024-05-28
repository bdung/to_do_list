import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/constant.dart';
import 'package:to_do_list/screens/add_task_screen/add_task_screen.dart';
import 'package:to_do_list/screens/begin_screen.dart';
import 'package:to_do_list/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.getFont(kDefaultFontFamily).fontFamily,
        scaffoldBackgroundColor: kBackgroundColor,
        useMaterial3: true,
      ),
      home: AddTaskScreen(),
    );
  }
}
