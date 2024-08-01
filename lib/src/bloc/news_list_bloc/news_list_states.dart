import 'package:news_app_manoj/src/models/news_list_model.dart';

abstract class NewsState  {
  List<Object?> get props => [];
}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> newsList;
  final bool hasMore;

   NewsLoaded(this.newsList, {this.hasMore = true});

  @override
  List<Object> get props => [newsList, hasMore];
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);

  @override
  List<Object?> get props => [message];
}
