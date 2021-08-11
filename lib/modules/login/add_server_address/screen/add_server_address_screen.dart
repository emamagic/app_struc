import 'package:app_struc/core/constants/assets.dart';
import 'package:app_struc/core/constants/dimens/dimens.dart';
import 'package:app_struc/core/constants/strings/strings.dart';
import 'package:app_struc/widget/demo_logo.dart';
import 'package:app_struc/widget/progress_button/progress_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddServerAddressScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.AppBg), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DemoLogo(),
                Container(
                  height: Dimens.btn_height_submit,
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: Dimens.size_40),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: Strings.hostHint
                    ),
                  ),
                ),
                SizedBox(height: Dimens.size_20),
                Container(
                  height: Dimens.btn_height_submit,
                  width: Dimens.btn_width_submit,
                  child: ProgressButton(
                    borderRadius: BorderRadius.all(Radius.circular(Dimens.btn_normal_border_radius)),
                    strokeWidth: 2,
                    child: Text(Strings.continueWithOnPremisesServer, style: TextStyle(color: Colors.white)),
                    onPressed: (AnimationController controller) {
                      if (controller.isCompleted) {
                        controller.reverse();
                      } else {
                        controller.forward();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}