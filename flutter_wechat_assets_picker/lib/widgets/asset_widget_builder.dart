import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart'
    show AssetEntity, AssetEntityImageProvider, AssetType;

class AssetWidgetBuilder extends StatelessWidget {
  const AssetWidgetBuilder({
    Key? key,
    required this.entity,
  }) : super(key: key);

  final AssetEntity entity;

  Widget _imageAssetWidget(BuildContext context) {
    return Image(
      image: AssetEntityImageProvider(entity, isOriginal: false),
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _imageAssetWidget(context);
  }
}
