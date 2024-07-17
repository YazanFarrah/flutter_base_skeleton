import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void clearAndNavigate(String path, BuildContext context) {
  log('here');
  while (context.canPop() == true) {
    context.pop();
  }
  Future.delayed(Duration.zero, () {
    context.pushReplacement('/$path');
  });
}