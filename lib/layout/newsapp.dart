
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/cubit/cubit.dart';
import 'package:shopapp/layout/cubit/states.dart';
import 'package:shopapp/modules/search/search_screen.dart';
import 'package:shopapp/shared/network/local/appcubit.dart';

class NewsAppLayout extends StatelessWidget {
  const NewsAppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context)=> SearchScreen(),) );
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    AppCubite.get(context).changeThemMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined))
            ],
          ),
          body: cubit.screen[cubit.curentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.curentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              cubit.changeNavigation(index);
            },
            items: cubit.bottomNav,
          ),
        );
      },
    );
  }
}
