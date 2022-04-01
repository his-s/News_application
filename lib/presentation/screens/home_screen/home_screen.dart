import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/data/models/article_model.dart';
import 'package:news_api/logic/cubit/news_cubit.dart';
import 'package:news_api/presentation/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String country = "eg";
  String category = "general";
  late ScrollController _scrollController;
  bool showScrolltoTopButton = false;
  List<Article> articles = [];
  List<Article> searchedArticles = [];
  bool isSearching = false;
  bool isFetching = false;
  int articlesItems = 4;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()

      // this listen to scrollcontroller to cheak if go to spcific location to show item based on condition
      ..addListener(() {
        if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent) {
          setState(() {
            isFetching = true;
          });
          incrementArticlesItems();
        }
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
    // beacuse blocprovider is lazy this line to call it to our data
    BlocProvider.of<NewsCubit>(context)
        .getNews(country: country, category: category);
  }

  incrementArticlesItems() async {
    await Future.delayed(Duration(milliseconds: 1000));
    setState(() {
      if (articlesItems < articles.length - 5) {
        articlesItems += 4;
      } else {
        setState(() {
          articlesItems = articles.length;
        });
      }
      isFetching = false;
    });
  }

// "go to first index of your listview
  scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(seconds: 1), curve: Curves.linear);
  }

// toggle between searched articles or article if you open search
  List<Article> getArticles() {
    return isSearching
        ? searchedArticles
        : articles.sublist(0, articlesItems).toList();
  }

// random reorder of articles if you call refresh indicator
  Future<Null> articlesShuffle() async {
    await Future.delayed(Duration(milliseconds: 500));
    getArticles().toList().shuffle();
    setState(() {});
    return null;
  }

  createSearchArticles(String value) {
    setState(() {
      searchedArticles = articles
          .where(
            (article) => article.title!.toLowerCase().contains(
                  value.toLowerCase(),
                ),
          )
          .toList();
    });
  }

  @override
  void dispose() {
    // to close our controller as it have some animation
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      floatingActionButton: ScrollToTopButton(
        scrollToTop: scrollToTop,
        showScrolltoTopButton: showScrolltoTopButton,
      ),
      drawer: const CustomDrawer(),
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        title: AppBarTitle(
          isSearching: isSearching,
          onChanged: (title) {
            createSearchArticles(title);
          },
        ),
        actions: [
          SearchButton(
            isSearching: isSearching,
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state is NewsLoaded) {
                articles = (state).news;
                return Column(
                  children: [
                    !isSearching ? const CategoryNavBar() : const SizedBox(),
                    Expanded(
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          RefreshIndicator(
                            onRefresh: articlesShuffle,
                            child: ListView.builder(
                                controller: _scrollController,
                                physics: BouncingScrollPhysics(),
                                itemCount: getArticles().length,
                                itemBuilder: (context, index) {
                                  return NewsCard(
                                      article: getArticles()[index]);
                                }),
                          ),
                          isFetching
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const CircularProgressIndicator(
                                    color: Colors.green,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const LoadingIndicator();
            },
          ),
        ),
      ),
    );
  }
}
