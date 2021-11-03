// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/cubit/states.dart';
import 'package:shopapp/modules/business/business.dart';
import 'package:shopapp/modules/sciences/science.dart';
import 'package:shopapp/modules/search/search_screen.dart';
import 'package:shopapp/modules/sports/sports.dart';
import 'package:shopapp/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialStatess());

  static NewsCubit get(context) => BlocProvider.of(context);
  int curentIndex = 0;
  List<BottomNavigationBarItem> bottomNav = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.search,
      ),
      label: 'Search',
    ),
  ];



  List<Widget> screen = [
    BusinessScreen(),
    SportsScreen(),
    SciencesScreen(),
    SearchScreen()
  ];
  void changeNavigation(int index) {
    curentIndex = index;
    emit(BottomNavigationStates());
  }

  List <dynamic> business = [0];

  void getBusiness()
  {
    emit((BusinessLoadStates()));

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'us',
        'category':'business',
        'apiKey':'4c1974111c43488b936a04aca0d34073',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];
      print(business[0] ['title']);

      emit(BusinessSucsessStates());
    }).catchError((error){
      print(error.toString());
      emit(BusinessErorrStates(error.toString()));
    });
  }



  List<dynamic> sports = [];

  void getSports()
  {
    emit((SportsLoadStates()));

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'us',
        'category':'sports',
        'apiKey':'4c1974111c43488b936a04aca0d34073',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      sports = value.data['articles'];
      print(sports[0]['title']);

      emit(SportsSucsessStates());
    }).catchError((error){
      print(error.toString());
      emit(SportsErorrStates(error.toString()));
    });
  }
  List<dynamic> science = [];

  void getScience()

  {
    emit((SciencesLoadStates()));

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country':'us',
        'category':'science',
        'apiKey':'4c1974111c43488b936a04aca0d34073',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      science = value.data['articles'];
      print(science[0]['title']);

      emit(SciencesSucsessStates());
    }).catchError((error){
      print(error.toString());
      emit(SciencesErorrStates(error.toString()));
    });
  }

  List<dynamic>search = [];

  void getSearch(String value) {
    emit((SearchLoadStates()));
    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q': '{$value}',
        'apiKey': '4c1974111c43488b936a04aca0d34073',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);

      emit(SearchSucsessStates());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErorrStates(error.toString()));
    });
  }


}
