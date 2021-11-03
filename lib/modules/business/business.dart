import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/cubit/cubit.dart';
import 'package:shopapp/layout/cubit/states.dart';
import 'package:shopapp/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list =NewsCubit.get(context).business;
        return ConditionalBuilder(

          condition: state is! BusinessLoadStates,
          builder: (context) =>ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index)=>buildArticleItem(list[index],context),
              separatorBuilder: (context,index)=>line(),
              itemCount: 5),
          fallback: (BuildContext context) =>const CircleAvatar(),
        );
      },
    );
  }
}
