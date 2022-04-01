import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/article_model.dart';
import '../../data/repository/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;
  late List<Article> news;
  late List<Article> savedNews;

  NewsCubit(this.newsRepository) : super(NewsInitial());

  Future<List<Article>> getNews(
      {required String category, required String country}) async {
    await newsRepository.getNews(category, country).then((news) {
      emit(NewsLoaded(news));
      this.news = news;
    });
    return news;
  }

  getSavedNews() async {
    await newsRepository.getSavedNews().then((savedNews) {
      emit(SavedNewsLoaded(savedNews));
      this.savedNews = savedNews;
    });
    return savedNews;
  }
}
