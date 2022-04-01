import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../logic/cubit/news_cubit.dart';

class CategoryNavBar extends StatefulWidget {
  const CategoryNavBar({Key? key}) : super(key: key);

  @override
  _CategoryNavBarState createState() => _CategoryNavBarState();
}

class _CategoryNavBarState extends State<CategoryNavBar> {
  List<String> categories = const [
    "general",
    "sports",
    "entertainment",
    "technology",
    "science",
    "business",
    "health",
  ];
  String categoryName = "general";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  categoryName = categories[index];
                  BlocProvider.of<NewsCubit>(context)
                      .getNews(category: categoryName, country: "eg");
                });
              },
              child: Container(
                margin: const EdgeInsets.all(6),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: categories[index] == categoryName
                      ? Colors.green.shade600
                      : Colors.white,
                ),
                child: Text(
                  categories[index].toUpperCase(),
                  style: TextStyle(
                    color: categories[index] == categoryName
                        ? Colors.white
                        : Colors.grey,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
