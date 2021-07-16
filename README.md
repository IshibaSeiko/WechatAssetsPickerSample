# WechatAssetsPickerSample
Flutter WeChat Assets Picker を使用するサンプル

## Usage
```dart
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
```

### 見た目の変更
- 選択済みの画像を表示しているView : `SelectedAssetsListView`
- 画像ピッカー : `AssetPicker`内 の `AssetPicker.pickAssets()` に渡す引数で設定
