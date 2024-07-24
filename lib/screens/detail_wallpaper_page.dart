import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wallpaper/wallpaper.dart';
import 'package:wallpaper_app_practise/models/wallpaper_model.dart';
import 'package:wallpaper_app_practise/utils/util_helper.dart';

class DetailWallPaperPage extends StatelessWidget {
  SrcModel imgModel;

  DetailWallPaperPage({required this.imgModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.network(
                imgModel.portrait!,
                fit: BoxFit.cover,
              )),
          Positioned(
            bottom: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getActionBtn(
                      onTap: () {},
                      title: "Info",
                      icon: Icons.info_outline,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    getActionBtn(
                      onTap: () {
                        saveWallpaper(context);
                      },
                      title: "Save",
                      icon: Icons.download,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    getActionBtn(
                        onTap: () {
                          applyWallpaper(context);
                        },
                        title: "Apply",
                        icon: Icons.format_paint,
                        bgColor: Colors.blueAccent)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getActionBtn(
      {required VoidCallback onTap,
      required String title,
      required IconData icon,
      Color? bgColor}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: bgColor != null
                  ? Colors.blueAccent
                  : Colors.white.withOpacity(0.4),
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          title,
          style: mTextStyle12(mColor: Colors.white),
        )
      ],
    );
  }

  void saveWallpaper(BuildContext context) {
    GallerySaver.saveImage(imgModel.portrait!).then((value) =>
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Wallpaper saved onto gallery!!"))));
  }

  void applyWallpaper(BuildContext context) {

    Wallpaper.imageDownloadProgress(imgModel.portrait!).listen((event) {
      print(event);
    }, onDone: (){
      Wallpaper.homeScreen(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        options: RequestSizeOptions.RESIZE_FIT
      ).then((value){
        print(value);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Wallpaper set on HOME screen!!")));
      });
    }, onError: (e){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Download ERROR: $e, Error while setting the wallpaper!!")));
    });

  }
}
