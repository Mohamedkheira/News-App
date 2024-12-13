import 'package:flutter/material.dart';
import 'package:news/style/app_style.dart';
import 'package:news/ui/detils_screen/details_screen.dart';
import 'package:news/ui/home/main_layout.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
        builder: (BuildContext , Orientation , ScreenType ) {
          return MaterialApp(
            theme: AppStyle.lightTheme,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            routes: {
              MainLayoutScreen.routeName:(_) => MainLayoutScreen(),
              DetailsScreen.routeName:(_) => DetailsScreen(),
            },
            initialRoute: MainLayoutScreen.routeName,
          );
        }
    );
  }
}

