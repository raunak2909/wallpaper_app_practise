import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app_practise/data/repository/wallpaper_repository.dart';
import 'package:wallpaper_app_practise/models/wallpaper_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  WallPaperRepository wallpaperRepository;
  HomeCubit({required this.wallpaperRepository}) : super(HomeInitialState());

  void getTrendingWallPapers() async{
    emit(HomeLoadingState());

    try{
      var data = await wallpaperRepository.getTrendingWallPapers();
      var wallpaperModel = WallpaperDataModel.fromJson(data);
      emit(HomeLoadedState(listPhotos: wallpaperModel.photos!));
    } catch(e){
      emit(HomeErrorState(errorMsg: e.toString()));
    }

  }


}
