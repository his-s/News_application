import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';
import 'data/repository/news_repository.dart';
import 'data/web_services/news_web_service.dart';
import 'logic/cubit/news_cubit.dart';
import 'presentation/screens/bookmarks_screen/bookmarks_screen.dart';
import 'presentation/screens/details_screen/details_screen.dart';
import 'presentation/screens/home_screen/home_screen.dart';

class AppRouter {
  NewsRepository newsRepository = NewsRepository(NewsWebServices());

  Route? generateRoutting(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
              create: (BuildContext context) {
                return NewsCubit(newsRepository);
              },
              child: HomeScreen(),
            );
          },
        );
      case detailsScreen:
        final articalUrl = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
            articalUrl: articalUrl,
          ),
        );
      case bookmarksScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => NewsCubit(newsRepository),
            child: BookmarksScreen(),
          ),
        );
    }
  }
}
