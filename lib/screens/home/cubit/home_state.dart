part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}
class HomeLoadingState extends HomeState {}
class HomeLoadedState extends HomeState {
  List<PhotoModel> listPhotos;
  HomeLoadedState({required this.listPhotos});
}
class HomeErrorState extends HomeState {
  String errorMsg;
  HomeErrorState({required this.errorMsg});
}
