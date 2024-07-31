import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:news_app_manoj/src/repo_service/news_list_repo_service.dart';
import 'package:news_app_manoj/src/models/news_list_model.dart';
import 'news_list_states.dart';

// class NewsCubit extends Cubit<NewsState> {
//
//   NewsCubit() : super(NewsLoading());
//
//   Future<void> fetchNews() async {
//     emit(NewsLoading());
//     try {
//       final newsList = await NewsListRepoService().getNewsList(page: 1,limit: 3);
//       emit(NewsLoaded(newsList));
//     } catch (e) {
//       emit(NewsError(e.toString()));
//     }
//   }
// }

/// use the below one to pagination
class NewsCubit extends Cubit<NewsState> {
  final NewsListRepoService _repoService = NewsListRepoService();

  int _currentPage = 1;
  final int _limit = 3;
  bool _hasMore = true;
  bool _isLoading = false;
  List<News> _newsList = [];
  Timer? _timer;

  NewsCubit() : super(NewsLoading()) {
    _startPeriodicFetching();
  }

  Future<void> fetchNews() async {
    if (_isLoading || !_hasMore) return;

    _isLoading = true;
    print("Fetching news: page $_currentPage");
    try {
      final newsData = await _repoService.getNewsList(page: _currentPage, limit: _limit);

      if (newsData.isNotEmpty) {
        _newsList.addAll(newsData);
        _currentPage++;
        _hasMore = newsData.length == _limit;

        emit(NewsLoaded(_newsList, hasMore: _hasMore));
      } else {
        _hasMore = false;
        emit(NewsLoaded(_newsList, hasMore: _hasMore));
      }
    } catch (e) {
      print("Fetch news error: ${e.toString()}");
      emit(NewsError(e.toString()));
    } finally {
      _isLoading = false;
    }
  }

  void _startPeriodicFetching() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      fetchNews();
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
