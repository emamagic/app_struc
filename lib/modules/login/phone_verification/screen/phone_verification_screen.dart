import 'package:app_struc/core/constants/assets.dart';
import 'package:app_struc/core/constants/dimens/dimens.dart';
import 'package:app_struc/core/constants/strings/strings.dart';
import 'package:app_struc/core/router/app_router.dart';
import 'package:app_struc/data/network/dto/user/phone_number_dto.dart';
import 'package:app_struc/data/repositories/user_repository.dart';
import 'package:app_struc/modules/login/phone_verification/cubit/phone_verification_cubit.dart';
import 'package:app_struc/widget/demo_logo.dart';
import 'package:app_struc/widget/progress_button/progress_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PhoneVerificationCubit>(
        create: (context) => PhoneVerificationCubit(UserRepository()),
        child: PhoneInput(),
      ),
    );
  }
}

class PhoneInput extends StatefulWidget {
  @override
  _PhoneInputState createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String phoneNumber;
  late AnimationController _controller;

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'IR';
  PhoneNumber number = PhoneNumber(isoCode: 'IR');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.AppBg), fit: BoxFit.cover),
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DemoLogo(),
            Container(
              height: Dimens.size_80,
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.symmetric(horizontal: Dimens.size_40),
              child: InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {},
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.DIALOG,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: controller,
                formatInput: false,
                maxLength: 10,
                spaceBetweenSelectorAndTextField: 0,
                hintText: Strings.phone,
                errorMessage: Strings.wrongPhoneNumber,
                keyboardType:
                    TextInputType.numberWithOptions(signed: true, decimal: true),
                onSaved: (PhoneNumber number) {
                  phoneNumber = '$number';
                  context
                      .read<PhoneVerificationCubit>()
                      .phoneVerification(PhoneNumberDto(phoneNumber: '$number'));
                },
              ),
            ),
            Container(
              width: Dimens.btn_width_submit,
              height: Dimens.btn_height_submit,
              child: ProgressButton(
                borderRadius: BorderRadius.all(Radius.circular(Dimens.btn_normal_border_radius)),
                onPressed: (AnimationController controller) {
                  _controller = controller;
                  if (formKey.currentState!.validate()) {
                    _controller.forward();
                    formKey.currentState!.save();
                  }
                },
                child: Text(Strings.getToken, style: TextStyle(color: Colors.white)),
              ),
            ),
            BlocConsumer<PhoneVerificationCubit, PhoneVerificationState>(
                listener: (context, state) {
                  if(state is PhoneVerificationSuccess) {
                    _controller.reverse();
                    Navigator.of(context).pushNamed(AppRouter.otp_registration,
                        arguments: phoneNumber);
                  }
                },
              builder: (context, state) {
                  if(state is PhoneVerificationFailed) {
                    _controller.reverse();
                    return Text(state.error);
                  } else if(state is PhoneVerificationLoading){
                    return Container();
                  } else {
                    return Text('');
                  }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
