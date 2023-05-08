import 'package:emo_boss/common/generated/l10n.dart';

extension DurationExtension on Duration {
  String get timeStr {
    final hours = inHours > 0 ? "$inHours ${S.current.gio} " : "";
    final minutes = inMinutes > 0 ? "${inMinutes % 60} ${S.current.phut}" : "";

    return "$hours$minutes";
  }
}
