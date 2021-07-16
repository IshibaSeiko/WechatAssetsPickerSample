import 'package:flutter/material.dart';
import 'widgets/multiple_image_picker.dart';

const Color themeColor = Color(0xff00bc56);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    // ValueNotifier によってボタンタップを通知
    final ValueNotifier<bool> onPressSelectAssetsButton = ValueNotifier(false);

    // 選択された画像を表示する Widget
    final _selectedAssetsView = SelectedAssetsView(
      onPressSelectAssetsButton: onPressSelectAssetsButton,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                onPressSelectAssetsButton.value = true;
              },
              child: Icon(Icons.add_a_photo_outlined)),
          _selectedAssetsView,
        ],
      ),
    );
  }
}

