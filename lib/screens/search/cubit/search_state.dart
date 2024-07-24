part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitialState extends SearchState {}
class SearchLoadingState extends SearchState {}
class SearchLoadedState extends SearchState {
  List<PhotoModel> listPhotos;
  num totalWallpapers;
  SearchLoadedState({required this.listPhotos, required this.totalWallpapers});
}
class SearchErrorState extends SearchState {
  String errorMsg;
  SearchErrorState({required this.errorMsg});
}
