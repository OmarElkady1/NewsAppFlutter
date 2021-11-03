import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/modules/web_view/web_screen.dart';

Widget defaultTextForm({
  required TextEditingController controller,
  required TextInputType type,
  required Function() ontap,
  required String lable,
  required IconData prefix,
  required Function onChange,
  required Function validate,
  IconData? soFix,
}) =>
    TextFormField(
      controller: controller,
      onChanged: onChange(),
      onTap: ontap,
      validator: validate(),
      keyboardType: type,
      onFieldSubmitted: (a) {
        print(a);
      },
      // onChanged: (s) {
      //   print(s);
      // },
      // validator: (value) {
      //   if (value != null && value.isEmpty) {
      //     return 'email must not be empty';
      //   }
      //   return null;
      // },
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        labelText: '$lable',
        border: OutlineInputBorder(),
      ),
    );

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebScreen(article['url'],));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget articleBuilder(list, context,{isSearch=false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>
      ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => line(),
        itemCount: 10,),
  fallback: (context) =>isSearch?Container(): Center(child: const CircularProgressIndicator()),
);

Widget line() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey,
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget(),
    ));
