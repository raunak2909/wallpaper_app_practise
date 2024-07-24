import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_app_practise/data/repository/wallpaper_repository.dart';

import '../../../models/wallpaper_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  WallPaperRepository wallpaperRepository;
  SearchCubit({required this.wallpaperRepository}) : super(SearchInitialState());

  void getSearchWallpaper({required String query, String color = "", int page = 1}) async{
    emit(SearchLoadingState());

    try{

      var mData = await wallpaperRepository.getSearchWallPapers(query, mColor: color, mPage: page);
      WallpaperDataModel wallpaperDataModel = WallpaperDataModel.fromJson(mData);
      emit(SearchLoadedState(listPhotos: wallpaperDataModel.photos!, totalWallpapers: wallpaperDataModel.total_results!));

    }catch(e){
      emit(SearchErrorState(errorMsg: e.toString()));
    }

  }

}
