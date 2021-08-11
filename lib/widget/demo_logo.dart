import 'package:app_struc/core/constants/assets.dart';
import 'package:app_struc/core/constants/dimens/dimens.dart';
import 'package:app_struc/core/constants/strings/strings.dart';
import 'package:flutter/cupertino.dart';

class DemoLogo extends StatelessWidget{
  final String title;
  DemoLogo({this.title = Strings.enterToApp});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(Assets.AppLogo, width: Dimens.size_120, height: Dimens.size_120),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimens.size_20)),
        SizedBox(height: Dimens.size_20)
      ],
    );
  }

}