import 'package:flutter/material.dart';
import 'package:flutter_wechat_assets_picker/constants/page_mixin.dart';
import 'package:flutter_wechat_assets_picker/constants/picker_method.dart';

class SelectedAssetsView extends StatefulWidget {

  final ValueNotifier<bool> onPressSelectAssetsButton;

  const SelectedAssetsView({Key? key, required this.onPressSelectAssetsButton}) : super(key: key);

  @override
  _SelectedAssetsViewState createState() => _SelectedAssetsViewState();
}

class _SelectedAssetsViewState extends State<SelectedAssetsView> with AutomaticKeepAliveClientMixin, PageMixin {

  @override
  int get maxAssetsCount => 9;

  @override
  PickMethod get pickMethod => PickMethod.image(maxAssetsCount);

  @override
  bool get wantKeepAlive => true;

  @override
  ValueNotifier<bool> get onPressSelectAssetsButton => widget.onPressSelectAssetsButton;
}
