import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/cubit/cubit.dart';
import 'package:shopapp/shared/network/local/appstates.dart';
import 'package:shopapp/shared/network/local/cache_helper.dart';
import 'package:shopapp/shared/network/remote/dio_helper.dart';

class AppCubite extends Cubit<AppStates>{
  AppCubite() : super(IntitailAppStates());
    static AppCubite get(context)=>BlocProvider.of(context);
 bool isDark =true;
void changeThemMode(){
  isDark =!isDark;
  CacheHelper.putData(key: "isDark", value: isDark).then((value) {emit(ChangeAppTheme());});

}

  List<dynamic>search = [0];

  void getSearch(String value) {
    //emit((SearchLoadStates()));
    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q': '$value',
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