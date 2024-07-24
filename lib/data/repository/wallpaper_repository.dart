import 'package:wallpaper_app_practise/data/remote/urls.dart';

import '../remote/api_helper.dart';

class WallPaperRepository{
  ApiHelper apiHelper;
  WallPaperRepository({required this.apiHelper});

  ///search
  Future<dynamic> getSearchWallPapers(String mQuery, {String mColor = "", int mPage = 1}) async{
    try {
      return await apiHelper.getAPI(url: "${AppUrls.SEARCH_WALL_URL}?query=$mQuery&color=$mColor&page=$mPage");
    } catch(e){
      throw(e);
    }
  }

  //trending
  Future<dynamic> getTrendingWallPapers() async{
    try {
      return await apiHelper.getAPI(url: AppUrls.TRENDING_WALL_URL);
    } catch(e){
      throw(e);
    }
  }

}