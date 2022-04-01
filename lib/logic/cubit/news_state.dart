part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoaded extends NewsState {
  final List<Article> news;

  NewsLoaded(this.news);
}

class SavedNewsLoaded extends NewsState {
  final List<Article> savedNews;

  SavedNewsLoaded(this.savedNews);
}
