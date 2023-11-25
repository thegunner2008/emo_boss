import 'package:emo_boss/common/config/config.dart';
import 'package:emo_boss/common/utils/extensions/platform.dart';


extension ScreenWidthExtension on ScreenWidth {
  bool get isTablet => ScreenWidth.tablet == this;

  bool get isMobile => ScreenWidth.mobile == this;

  bool get isDesktop => ScreenWidth.destop == this && isWeb;
}
