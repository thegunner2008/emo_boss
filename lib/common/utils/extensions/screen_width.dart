import 'package:emo_boss/common/config/config.dart';
import 'package:emo_boss/common/utils/extensions/platform.dart';


extension ScreenWidthExtension on ScreenWidth {
  bool get isTablet => ScreenWidth.TABLET == this;

  bool get isMobile => ScreenWidth.MOBILE == this;

  bool get isDesktop => ScreenWidth.DESKTOP == this && isWeb;
}
