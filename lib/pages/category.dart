import 'package:flutter/material.dart';
import 'package:jd/app/theme/app_theme.dart';
import 'package:jd/providers/category_page_provider.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        var provider = CategoryPageProvider();
        return provider;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("分类"),
        ),
        body: Container(
          color: const Color(0xFFf4f4f4),
          child: Consumer<CategoryPageProvider>(
            builder: (_, provider, __) {
              return Row(
                children: [buildLeft(provider), buildLogos(provider)],
              );
            },
          ),
        ),
      ),
    );
  }

  Container buildLeft(CategoryPageProvider provider) {
    return Container(
      width: 90,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            child: Container(
              height: 50,
              color: provider.currentIdx == index
                  ? Colors.red
                  : const Color(0xFFeeeeeee),
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                provider.categories[index],
                style: AppTheme.headline4,
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              provider.updateCurrentIdx(index);
            },
          );
        },
        itemCount: provider.categories.length,
      ),
    );
  }

  Widget buildLogos(CategoryPageProvider provider) {
    List<Widget> children = [];
    print(provider.models[provider.currentIdx].items.length);

    for (int i = 0; i < provider.models[provider.currentIdx].items.length; i++) {
      children.add(SizedBox(
        width: 60,
        child: Column(
          children: [
            Image.asset(
              provider.models[provider.currentIdx].items[i].img,
              width: 50,
              height: 50,
            ),
            Text(
              provider.models[provider.currentIdx].items[i].text,
              style: AppTheme.headline5,
            )
          ],
        ),
      ));
    }

    return Expanded(
      child: Wrap(
          spacing: 7.0,
          runSpacing: 10.0,
          alignment: WrapAlignment.spaceBetween,
          children: children),
    );
  }
}
