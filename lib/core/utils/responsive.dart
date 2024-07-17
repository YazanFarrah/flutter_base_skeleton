import 'package:flutter_screenutil/flutter_screenutil.dart';

class Responsive {
  static bool get isTablet {
    return ScreenUtil().screenWidth >= 500 && ScreenUtil().screenWidth < 1100;
  }

    static bool get isLargeTablet {
    return ScreenUtil().screenWidth >= 1100;
  }
}
