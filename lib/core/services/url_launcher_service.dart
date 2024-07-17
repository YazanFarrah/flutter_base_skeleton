
import 'package:anime_app/core/errors/strings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class LaunchUrlService {
  static void openWeb(BuildContext context, url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (!await launchUrl(uri)) {
        throw unexpectedFailureMessage;
      }
    } catch (error) {
      rethrow;
    }
  }

  static void makeAPhoneCall(BuildContext context, phoneNumber) async {
    try {
      final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
      if (!await launchUrl(phoneUri)) {
        throw unexpectedFailureMessage;
      }
    } catch (error) {
      rethrow;
    }
  }
}