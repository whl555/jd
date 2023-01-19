import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

              if(provider.isLoading){
                return const Center(child: CupertinoActivityIndicator());
              }

              if(provider.isError){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(provider.errorMessage),
                      OutlinedButton(
                          onPressed: () => provider.getHomePageData(),
                          child: const Text("刷新")
                      )
                    ],
                  ),
                );
              }

              return Center(
                child: Text(provider.model.name),
              );
            }),
          ),
        ));
  }
}
