import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:jd/app/theme/app_theme.dart';
import 'package:jd/providers/home_page_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) {
          var provider = HomePageProvider();
          provider.getHomePageData();
          return provider;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("首页"),
          ),
          body: Container(
            color: const Color(0xFFf4f4f4),
            child: Consumer<HomePageProvider>(builder: (_, provider, __) {
              if (provider.isLoading) {
                return const Center(child: CupertinoActivityIndicator());
              }

              if (provider.isError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(provider.errorMessage),
                      OutlinedButton(
                          // onPressed: () => provider.getHomePageData(),
                          onPressed: () {
                            provider.resume();
                          },
                          child: const Text("刷新"))
                    ],
                  ),
                );
              }

              return ListView(
                children: [
                  buildAspectRatio(),
                  buildLogos(),
                  buildSecondBuy(),
                  buildQuicks(),
                  buildAds()
                ],
              );
            }),
          ),
        ));
  }

  SizedBox buildQuicks() {
    return SizedBox(
                  height: 104,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.white),
                    child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Image.asset(
                                "assets/image/quick${index + 1}.jpg",
                                width: 85,
                                height: 85,
                              ),
                              const Text(
                                "hello",
                                style: AppTheme.headline5,
                              )
                            ],
                          );
                        }),
                  ),
                );
  }

  Widget buildSecondBuy() {
    return Container(
        height: 50,
        color: Colors.white,
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(
              "assets/image/bej.png",
              width: 90,
              height: 20,
            ),
            const Spacer(),
            const Text(
              "更多秒杀",
              style: AppTheme.headline7,
            ),
            const Icon(
              CupertinoIcons.right_chevron,
              size: 15,
            )
          ],
        ));
  }

  Widget buildLogos() {
    List<Widget> children = [];

    for (int i = 0; i < 10; i++) {
      children.add(SizedBox(
        width: 60,
        child: Column(
          children: [
            Image.asset(
              "assets/image/logo${i + 1}.png",
              width: 50,
              height: 50,
            ),
            const Text(
              "hello",
              style: AppTheme.headline5,
            )
          ],
        ),
      ));
    }

    return Container(
      height: 170,
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Wrap(
          spacing: 7.0,
          runSpacing: 10.0,
          alignment: WrapAlignment.spaceBetween,
          children: children),
    );
  }

  AspectRatio buildAspectRatio() {
    return AspectRatio(
      aspectRatio: 44 / 21,
      child: Swiper(
        itemBuilder: (context, index) {
          return Image.asset("assets/image/jd${index + 1}.jpg");
        },
        itemCount: 5,
        autoplay: true,
        loop: true,
        pagination: const SwiperPagination(),
      ),
    );
  }

  Widget buildAds() {
    List<Widget> children = [];

    for (int i = 0; i < 2; i++) {
      children.add(Expanded(
        child: Image.asset(
          "assets/image/ad-$i.jpg",
        ),
      ));
    }

    return Row(
      children: children,
    );
  }
}
