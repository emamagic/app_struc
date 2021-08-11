import 'dart:ui';

import 'package:app_struc/core/base/state_wrapper.dart';
import 'package:app_struc/core/constants/assets.dart';
import 'package:app_struc/core/constants/dimens/dimens.dart';
import 'package:app_struc/core/constants/general.dart';
import 'package:app_struc/core/constants/strings/strings.dart';
import 'package:app_struc/core/exceptions/network_exceptions.dart';
import 'package:app_struc/core/router/app_router.dart';
import 'package:app_struc/data/network/dto/config/config_dto.dart';
import 'package:app_struc/data/repositories/config_repository.dart';
import 'package:app_struc/modules/login/choose_server/cubit/choose_server_cubit.dart';
import 'package:app_struc/widget/demo_logo.dart';
import 'package:app_struc/widget/progress_button/progress_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseServerScreen extends StatelessWidget {
  late AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => ConfigRepository(),
        child: BlocProvider<ChooseServerCubit>(
          create: (context) =>
              ChooseServerCubit(configRepository: RepositoryProvider.of<ConfigRepository>(context)),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.AppBg), fit: BoxFit.cover),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DemoLogo(),
                  Builder(
                    builder: (BuildContext context) =>
                        SizedBox(
                          width: Dimens.btn_width_submit,
                          height: Dimens.btn_height_submit,
                          child: ProgressButton(
                              borderRadius: BorderRadius.all(Radius.circular(Dimens.btn_normal_border_radius)),
                              onPressed: (AnimationController controller) {
                                _controller = controller;
                                BlocProvider.of<ChooseServerCubit>(context)
                                    .config(BASE_URL);
                              },
                              child: Text(Strings.continueWithSaaSServer, style: TextStyle(color: Colors.white),)),
                        ),
                  ),
                  // SizedBox(height: Dimens.size_20),
                  // SizedBox(
                  //   width: Dimens.btn_width_choose_server,
                  //   height: Dimens.btn_height_choose_server,
                  //   child: ElevatedButton(
                  //       style: ButtonStyle(
                  //         backgroundColor: MaterialStateProperty.all<Color>(AppColors.bgColorButton),
                  //       ),
                  //       onPressed: () =>
                  //           Navigator.of(context).pushNamed(AppRouter.add_server_address),
                  //       child: Text(Strings.continueWithOnPremisesServer)),
                  // ),
                  BlocConsumer<ChooseServerCubit, StateWrapper<ConfigDto>>(
                    listener: (context, state) {
                      state.when(
                          idle: () {},
                          loading: () { _controller.forward(); },
                          data: (ConfigDto data) {
                            _controller.reverse();
                            Navigator.of(context).pushNamed(
                                AppRouter.phone_verification);
                          },
                          error: (NetworkExceptions error) {}
                      );
                    },
                    builder: (context, state) {
                      return state.when(
                          idle: () {
                            return Container();
                          },
                          loading: () {
                            return Container();
                          }, data: (ConfigDto data) {
                        return Container();
                      }, error: (NetworkExceptions error) {
                        return Text(NetworkExceptions.getErrorMessage(error));
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
