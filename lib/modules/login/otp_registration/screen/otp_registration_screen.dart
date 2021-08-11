import 'dart:async';
import 'package:app_struc/core/constants/assets.dart';
import 'package:app_struc/core/constants/dimens/dimens.dart';
import 'package:app_struc/core/constants/strings/strings.dart';
import 'package:app_struc/core/router/app_router.dart';
import 'package:app_struc/data/network/dto/user/phone_number_dto.dart';
import 'package:app_struc/data/repositories/user_repository.dart';
import 'package:app_struc/modules/login/otp_registration/cubit/otp_registration_cubit.dart';
import 'package:app_struc/widget/demo_logo.dart';
import 'package:app_struc/widget/progress_button/progress_button.dart';
import 'package:app_struc/widget/view_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpRegistrationScreen extends StatefulWidget {
  final String phoneNumber;

  OtpRegistrationScreen({required this.phoneNumber});

  @override
  _OtpRegistrationScreenState createState() => _OtpRegistrationScreenState();
}

class _OtpRegistrationScreenState extends State<OtpRegistrationScreen> {
  TextEditingController textEditingController = TextEditingController();

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  AnimationController? _controller;
  bool hasError = false;
  String currentText = "";
  late Timer _timer;
  String txtVerifyButton = Strings.verifyCode;
  dynamic _start = 60;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => UserRepository(),
        child: BlocProvider<OtpRegistrationCubit>(
          create: (context) => OtpRegistrationCubit(
              RepositoryProvider.of<UserRepository>(context)),
          child: GestureDetector(
            onTap: () {},
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.AppBg), fit: BoxFit.cover),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: <Widget>[
                    DemoLogo(title: Strings.verifyEnter),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(Strings.sendingCode,
                        style:
                            TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 8),
                      child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "${widget.phoneNumber}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                        onTap: () => {
                          _timer.cancel(),
                          Navigator.pop(context)
                        },
                        child: Text(Strings.editPhone, textAlign: TextAlign.center, style: TextStyle(color: Colors.blue))),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 30),
                          child: PinCodeTextField(
                            appContext: context,
                            pastedTextStyle: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            length: 5,
                            obscureText: true,
                            obscuringCharacter: '*',
                            obscuringWidget: FlutterLogo(
                              size: 24,
                            ),
                            blinkWhenObscuring: true,
                            animationType: AnimationType.fade,
                            validator: (v) {
                              if (v!.length < 5) {
                                return "";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 40,
                              activeFillColor: Colors.white,
                            ),
                            cursorColor: Colors.black,
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: true,
                            errorAnimationController: errorController,
                            controller: textEditingController,
                            keyboardType: TextInputType.number,
                            boxShadows: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (v) {
                              print("Completed");
                            },
                            // onTap: () {
                            //   print("Pressed");
                            // },
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                currentText = value;
                              });
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        hasError ? Strings.invalidCode : "",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Text("$_start", textAlign: TextAlign.center,),
                    SizedBox(
                      height: 20,
                    ),
                    BlocListener<OtpRegistrationCubit, OtpRegistrationState>(
                      listener: (context, state) {
                        if (state is OtpRegistrationSuccess) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRouter.conversation, (route) => false);
                        } else if (state is PhoneVerificationSuccess) {
                          _controller!.reverse();
                          txtVerifyButton = Strings.verifyCode;
                          startTimer();
                        }  else if (state is OtpRegistrationLoading) {
                          _controller!.forward();
                        }  else if (state is PhoneVerificationLoading) {
                          _controller!.forward();
                        } else if (state is OtpRegistrationFailed) {
                          _controller!.reverse();
                          snackBar(context, state.error);
                        } else if (state is PhoneVerificationFailed) {
                          _controller!.reverse();
                          snackBar(context, state.error);
                        }
                      },
                      child: Container(),
                    ),
                    Builder(
                      builder: (context) => Container(
                        width: Dimens.btn_width_submit,
                        height: Dimens.btn_height_submit,
                        child: ProgressButton(
                            borderRadius: BorderRadius.all(Radius.circular(Dimens.btn_normal_border_radius)),
                            child: Text(txtVerifyButton, style: TextStyle(color: Colors.white)),
                            onPressed: (AnimationController controller) {
                              _controller = controller;
                              if(_start is int) {
                                formKey.currentState!.validate();
                                if (currentText.length != 5) {
                                  errorController!.add(ErrorAnimationType
                                      .shake); // Triggering error shake animation
                                  setState(() => hasError = true);
                                } else {
                                  hasError = false;
                                  context
                                      .read<OtpRegistrationCubit>()
                                      .otpRegistration(
                                      widget.phoneNumber, currentText);
                                }
                              } else {
                                  context.read<OtpRegistrationCubit>().resendCode(
                                    PhoneNumberDto(phoneNumber: widget.phoneNumber)
                                  );
                              }

                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _start = 60;
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            _start = Strings.deprecatedVerifyCode;
            txtVerifyButton = Strings.resend;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

}
