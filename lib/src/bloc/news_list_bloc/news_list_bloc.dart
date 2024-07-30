import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_manoj/src/repo_service/news_list_repo_service.dart';

import 'news_list_states.dart';


class NewsCubit extends Cubit<NewsState> {
  final NewsListRepoService _newsRepoService;

  NewsCubit(this._newsRepoService) : super(NewsLoading());

  Future<void> fetchNews() async {
    emit(NewsLoading());
    try {
      final newsList = await _newsRepoService.getNewsList();
      emit(NewsLoaded(newsList));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
