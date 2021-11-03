import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shopapp/layout/newsapp.dart';
import 'package:shopapp/modules/business/business.dart';
import 'package:shopapp/shared/bloc_observer.dart';
import 'package:shopapp/shared/network/local/appcubit.dart';
import 'package:shopapp/shared/network/local/appstates.dart';
import 'package:shopapp/shared/network/local/cache_helper.dart';
import 'package:shopapp/shared/network/remote/dio_helper.dart';

import 'layout/cubit/cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   Bloc.observer =MyBlocObserver();
   CacheHelper.initi();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getSports()
              ..getScience(),

        ),
        BlocProvider(
          create: (context) => AppCubite()..changeThemMode(),
        ),
      ],
      child: BlocConsumer<AppCubite, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  color: Colors.white,
                  elevation: 0.0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  elevation: 0.0,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                appBarTheme: AppBarTheme(
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  color: HexColor('333739'),
                  elevation: 0.0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarIconBrightness: Brightness.light,
                  ),
                  titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  elevation: 0.0,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                ),
                scaffoldBackgroundColor: HexColor('333739'),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              themeMode: AppCubite.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              //.get(context).isDark ? ThemeMode.dark:ThemeMode.light,
              home: const NewsAppLayout(),
            );
          }),
    );
  }
}

/*
* https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4c1974111c43488b936a04aca0d34073
https://newsapi.org/v2/everything?q=tesla&apiKey=4c1974111c43488b936a04aca0d34073
*/
