import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart'
    show
        AssetEntity,
        DefaultAssetPickerProvider,
        DefaultAssetPickerBuilderDelegate;

import '../widgets/selected_assets_list_view.dart';
import 'picker_method.dart';

@optionalTypeArgs
mixin PageMixin<T extends StatefulWidget> on State<T> {
  final ValueNotifier<bool> isDisplayingDetail = ValueNotifier<bool>(true);

  @override
  void dispose() {
    isDisplayingDetail.dispose();
    super.dispose();
  }

  int get maxAssetsCount;

  List<AssetEntity> assets = <AssetEntity>[];

  int get assetsLength => assets.length;

  PickMethod get pickMethod;

  ValueNotifier<bool> get onPressSelectAssetsButton;

  late DefaultAssetPickerProvider keepScrollProvider =
      DefaultAssetPickerProvider();
  DefaultAssetPickerBuilderDelegate? keepScrollDelegate;

  Future<void> selectAssets(PickMethod model) async {
    final List<AssetEntity>? result = await model.method(context, assets);
    if (result != null) {
      assets = List<AssetEntity>.from(result);
      isDisplayingDetail.value = assets.isNotEmpty;
      if (mounted) {
        setState(() {});
      }
    }
  }

  void removeAsset(int index) {
    assets.removeAt(index);
    if (assets.isEmpty) {
      isDisplayingDetail.value = false;
    }
    setState(() {});
  }

  void onResult(List<AssetEntity>? result) {
    if (result != null && result != assets) {
      assets = List<AssetEntity>.from(result);
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  @mustCallSuper
  Widget build(BuildContext context) {
    super.build(context);

    final PickMethod model = pickMethod;

    return ValueListenableBuilder(
        valueListenable: onPressSelectAssetsButton,
        builder: (_, bool value, __) {
          if (value) {
            selectAssets(model);
            onPressSelectAssetsButton.value = false;
          }

          // 選択された写真を表示する ListView
          return SelectedAssetsListView(
            assets: assets,
            isDisplayingDetail: isDisplayingDetail,
            onResult: onResult,
            onRemoveAsset: removeAsset,
          );
        });
  }
}
