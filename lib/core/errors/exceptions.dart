import 'package:anime_app/core/errors/strings.dart';

class FileMaxSizeExceededException implements Exception {
  @override
  String toString() {
    return maxSizeExceededFailureMessage;
  }
}