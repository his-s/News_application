import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/article_model.dart';
import '../../../logic/cubit/news_cubit.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/news_card/news_card.dart';
import '../../widgets/scroll_to_top_button.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  _BookmarksScreenState createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  late ScrollController _scrollController;
  bool showScrolltoTopButton = false;
  List<Article> articles = [];
  List<Article> searchedArticles = [];
  bool isSearching = false;

  @override
  void initState() {
    _scrollController = ScrollController()
      // this listen to scrollcontroller to cheak if go to spcific location to show item based on condition
      ..addListener(() {
        if (_scrollController.offset > 400) {
          setState(() {
            showScrolltoTopButton = true;
          });
        } else {
          setState(() {
            showScrolltoTopButton = false;
          });
        }
      });
    super.initState();
  }

  // "go to first index of your listview
  scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  void dispose() {
    // to close our controller as it have some animation
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    BlocProvider.of<NewsCubit>(context).getSavedNews();
    return Scaffold(
      floatingActionButton: ScrollToTopButton(
        scrollToTop: scrollToTop,
        showScrolltoTopButton: showScrolltoTopButton,
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Bookmarks",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is SavedNewsLoaded) {
            articles = (state).savedNews;
            return Container(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: articles.length,
                      physics: BouncingScrollPhysics(),
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        return NewsCard(
                          article: articles[index],
                          isBookmarks: true,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}
