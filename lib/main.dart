import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:utpl_plus/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTPL+',
      
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomePage(),
          binding: HomeBinding()
        ),

        GetPage(
          name: '/news',
          page: () => const NewsPage(),
          binding: NewsBinding()
        ),

        GetPage(
          name: '/cinemaforum',
          page: () => const CinemaForumPage(),
          binding: CinemaForumBinding()
        ),
      ],

      initialRoute: '/home',
      theme: ThemeData(scaffoldBackgroundColor: Colors.blueGrey[50],),
    );
  }
}