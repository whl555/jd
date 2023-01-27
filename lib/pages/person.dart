import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  List<AssetEntity> picks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我的"),
      ),
      body: buildBody(context),
    );
  }

  Widget buildPhotoList(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      double width = (cons.maxWidth - 3 * 10) / 4;
      return Wrap(spacing: 10, runSpacing: 10, children: [
        for (final asset in picks)
          AssetEntityImage(
            asset,
            width: width,
            height: width,
            fit: BoxFit.cover,
          ),

        GestureDetector(
          onTap: () async {
            final results = await AssetPicker.pickAssets(context, pickerConfig: AssetPickerConfig(selectedAssets: picks));
            setState(() {
              picks.clear();
              picks.addAll(results!);
            });
          },
          child: Container(
            width: width,
            height: width,
            color: Colors.black12,
            child: const Icon(
              Icons.add,
              size: 48,
              color: Colors.grey,
            ),
          ),
        )
      ]);
    });
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () async {
              final results = await AssetPicker.pickAssets(context);
              setState(() {
                picks.clear();
                picks.addAll(results!);
              });
            },
            child: const Text("选取图片")),
        Column(children: [
          buildPhotoList(context),
        ]),
      ],
    );
  }
}
