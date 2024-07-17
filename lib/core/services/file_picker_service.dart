import 'dart:io';

import 'package:anime_app/core/errors/exceptions.dart';
import 'package:anime_app/core/validators/file_validation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class FilesPickerService {
  static final ImagePicker _imagePicker = ImagePicker();
  static final FilePicker _filePicker = FilePicker.platform;

  static Future<String?>? pickImageFromGallery() async {
    try {
      final XFile? takenPhoto = await _imagePicker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 480,
          maxWidth: 640,
          imageQuality: 50);
      if (takenPhoto != null) {
        final File pickedFile = File(takenPhoto.path);
        if (pickedFile.lengthSync() <= FilesValidations.maxImageSize) {
          return takenPhoto.path;
        } else {
          throw FileMaxSizeExceededException();
        }
      }
    } on PlatformException {
      openAppSettings();
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<List<String?>?> pickMultiFiles() async {
    final List<String?> files = [];
    try {
      final result = await _filePicker.pickFiles(
        allowMultiple: true,
        type: FileType.media,
      );
      if (result == null) {
        return null;
      }
      for (PlatformFile file in result.files) {
        if (FilesValidations.isImage(file.extension) &&
            file.size <= FilesValidations.maxImageSize) {
          files.add(file.path);
        } else if (FilesValidations.isVideo(file.extension) &&
            file.size <= FilesValidations.maxVideoSize) {
          files.add(file.path);
        } else {
          throw FileMaxSizeExceededException();
        }
      }
      return files;
    } on PlatformException {
      openAppSettings();
    } on FileMaxSizeExceededException {
      rethrow;
    } catch (e) {
      return null;
    }
    return null;
  }
}
