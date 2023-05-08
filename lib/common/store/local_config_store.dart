import 'dart:convert';

import 'package:emo_boss/common/di/injector.dart';
import 'package:emo_boss/common/local/prefs/prefs_sevice.dart';
import 'package:emo_boss/common/values/storage.dart';

import '../entities/entities.dart';

abstract class AppConfigureStore {
  static AppConfigureStore get to => AppInjector.injector<AppConfigureStore>();

  Map<String, dynamic> get configure;

  Settings get settings;

  Future<void> syncData();

  void setAttribute<T>(String key, T value);

  T? getAttribute<T>(String key);

  void clear();
}

class AppConfigureStoreImpl implements AppConfigureStore {
  var _configure = <String, dynamic>{};
  var _settings = Settings();

  @override
  Map<String, dynamic> get configure => _configure;

  @override
  Settings get settings => _settings;

  AppConfigureStoreImpl() {
    final value = PrefsService.to.getString(AppStorage.$prefLocalConfigStore);
    if (value.isNotEmpty) {
      _configure = {
        ...jsonDecode(value),
        ..._mapRemoteToLocal(_settings),
      };
    }
  }

  @override
  Future<void> syncData() async {

    _settings = settings;
    _configure = {
      ..._configure,
      ..._mapRemoteToLocal(settings),
    };
  }

  Map<String, dynamic> _mapRemoteToLocal(Settings settings) => {
        // Payment
        AppStorage.prefActiveQrCode: settings.qrCodeEnable,
        AppStorage.prefWithdrawMethod: settings.withdrawMethod,
        AppStorage.prefNameBank: settings.bankName,
        AppStorage.prefNumberAcc: settings.accountNumber,
        AppStorage.prefNameAcc: settings.accountName,
      };

  @override
  void setAttribute<T>(String key, T value) {
    _configure[key] = value;
    PrefsService.to.setString(AppStorage.$prefLocalConfigStore, jsonEncode(_configure));
  }

  @override
  T? getAttribute<T>(String key) {
    if (_configure.containsKey(key)) {
      return _configure[key] as T;
    }
    return null;
  }

  @override
  void clear() {
    _configure.clear();
    PrefsService.to.remove(AppStorage.$prefLocalConfigStore);
  }
}
