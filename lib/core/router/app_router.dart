import 'package:app_struc/core/constants/strings/strings.dart';
import 'package:app_struc/modules/conversation/screen/conversation_screen.dart';
import 'package:app_struc/modules/login/add_server_address/screen/add_server_address_screen.dart';
import 'package:app_struc/modules/login/choose_server/screen/choose_server_screen.dart';
import 'package:app_struc/modules/login/otp_registration/screen/otp_registration_screen.dart';
import 'package:app_struc/modules/login/phone_verification/screen/phone_verification_screen.dart';
import 'package:app_struc/modules/login/profile/screen/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case choose_server:
        return MaterialPageRoute(
          builder: (_) => ChooseServerScreen(),
        );
      case phone_verification:
        return MaterialPageRoute(builder: (_) => PhoneVerificationScreen());
      case otp_registration:
        return MaterialPageRoute(
            builder: (_) => OtpRegistrationScreen(phoneNumber: args as String));
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case conversation:
        return MaterialPageRoute(builder: (_) => ConversationScreen());
      case add_server_address:
        return MaterialPageRoute(builder: (_) => AddServerAddressScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(Strings.error),
          centerTitle: true,
        ),
        body: Center(
          child: Text(Strings.routNotFound),
        ),
      );
    });
  }

  static const String conversation = '/';
  static const String choose_server = '/choose_server';
  static const String phone_verification = '/phone_verification';
  static const String otp_registration = '/otp_registration';
  static const String profile = '/profile';
  static const String add_server_address = '/add_server_address';
}
