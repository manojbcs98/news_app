import 'package:news_app_manoj/src/models/news_list_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> newsList;

  NewsLoaded(this.newsList);

  @override
  List<Object?> get props => [newsList];
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);

  @override
  List<Object?> get props => [message];
}
