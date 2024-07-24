import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_practise/data/remote/api_helper.dart';
import 'package:wallpaper_app_practise/data/repository/wallpaper_repository.dart';
import 'package:wallpaper_app_practise/screens/home/cubit/home_cubit.dart';
import 'package:wallpaper_app_practise/screens/home/home_page.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => HomeCubit(
            wallpaperRepository: WallPaperRepository(apiHelper: ApiHelper())),
        child: HomePage(),
      ),
    );
  }
}
