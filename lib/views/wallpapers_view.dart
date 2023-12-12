import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/models/wallpapers_model.dart';
import 'package:wallpaper_app/view_models/wallpaper_view_model.dart';
import 'package:wallpaper_app/views/widgets/circular_full_custom_loader.dart';
import 'package:wallpaper_app/views/widgets/drawer_view.dart';
import 'package:wallpaper_app/views/widgets/wallpaper_custom_view.dart';

class WallpapersView extends StatefulWidget {
  const WallpapersView({super.key});

  static const String route = 'wallpaperView';

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
      appBar: AppBar(),
      drawer: DrawerView(),
      body: Consumer<WallpaperViewModel>(
        builder: (context, child, _) {
          

          return CircularFullCustomLoader(
            isEnabled: child.loading,
            child: StreamBuilder<List<Photos>>(
              stream: child.wallpaper$,
              builder: (context, sp) {

                if(sp.hasData) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 4, crossAxisSpacing: 10),
                    itemCount: sp.data!.length,
                    itemBuilder: (context, i) {

                      Photos res = sp.data![i];

                      return WallpaperCustomView(item: res);
                    },
                  );
                }
                return SizedBox.shrink();
              },
            ),
          );
        }
      ),
    );
  }
}
