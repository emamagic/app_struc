import 'package:app_struc/core/constants/assets.dart';
import 'package:app_struc/core/constants/colors/app_colors.dart';
import 'package:app_struc/core/constants/dimens/dimens.dart';
import 'package:app_struc/core/constants/strings/strings.dart';
import 'package:app_struc/widget/demo_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.AppBg), fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DemoLogo(title: Strings.completeSignup),
                Text(Strings.name),
                Container(
                  height: Dimens.btn_height_submit,
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: Dimens.size_40),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: Dimens.size_20),
                Text(Strings.family),
                Container(
                  height: Dimens.btn_height_submit,
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: Dimens.size_40),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: Dimens.size_20),
                Text(Strings.email),
                Container(
                  height: Dimens.btn_height_submit,
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: Dimens.size_40),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: Dimens.size_20),
                SizedBox(
                  height: Dimens.btn_height_submit,
                  width: Dimens.btn_width_submit,
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppColors.bgColorButton)),
                    onPressed: () => null,
                    child: Text(Strings.completeSignup),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}