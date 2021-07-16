import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class PickMethod {
  const PickMethod({
    required this.method,
  });

  factory PickMethod.image(int maxAssetsCount) {
    return PickMethod(
      method: (BuildContext context, List<AssetEntity> assets) {
        return AssetPicker.pickAssets(
          context,
          maxAssets: maxAssetsCount,
          selectedAssets: assets,
          requestType: RequestType.image,
          textDelegate: JapaneseTextDelegate()
        );
      },
    );
  }

  final Future<List<AssetEntity>?> Function(
    BuildContext context,
    List<AssetEntity> selectedAssets,
  ) method;
}

