import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/models/wallpapers_model.dart';
import 'package:wallpaper_app/view_models/wallpaper_view_model.dart';

class WallpapersView extends StatefulWidget {
  const WallpapersView({super.key});

  @override
  State<WallpapersView> createState() => _WallpapersViewState();
}

class _WallpapersViewState extends State<WallpapersView> {
  late WallpaperViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState

    viewModel = Provider.of<WallpaperViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getWallpapers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WallpaperViewModel>(
        builder: (context, child, _) {

          if(child.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return StreamBuilder<List<Photos>>(
            stream: child.wallpaper$,
            builder: (context, sp) {

              if(sp.hasData) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: sp.data!.length,
                  itemBuilder: (context, i) {

                    Photos res = sp.data![i];

                    return Image.network(res.src.original);
                  },
                );
              }
              return SizedBox.shrink();
            },
          );
        }
      ),
    );
  }
}
