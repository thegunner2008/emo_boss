import 'dart:convert';
import 'dart:ui';

import 'package:crclib/catalog.dart';
import 'package:emo_boss/common/di/injector.dart';
import 'package:emo_boss/common/entities/entities.dart';
import 'package:emo_boss/common/remote/remote.dart';
import 'package:emo_boss/common/utils/extensions/int.dart';
import 'package:qr_flutter/qr_flutter.dart';

abstract class WithdrawStore {
  static WithdrawStore get to => AppInjector.injector<WithdrawStore>();

  List<String> get withdrawMethods;

  List<String> get bankNames;

  Future<ResponseList<Withdraw>> getWithdraws({
    int pageSize,
    int page,
    String sort,
    String order,
  });

  Future postWithdraws(Map<String, dynamic> request);

  Future<Image?> convertBankAccountToQrImage({required Withdraw withdraw, required double size});

  Future payWithdraw({required int id, required String reply, required int userId});

  String getReply(Withdraw withdraw);
}

class WithdrawStoreImpl implements WithdrawStore {
  @override
  List<String> get withdrawMethods => const ['Ngân hàng', 'MOMO', 'ZaloPay', 'USDT'];

  @override
  List<String> get bankNames => const [
        'Vietcombank',
        'Vietinbank',
        'Techcombank',
        'BIDV',
        'ACB',
        'Agribank',
        'Sacombank',
        'MBBank',
        'VPBank',
        'Eximbank',
        'Oceanbank',
        'TPBank',
        'SHB',
        'SeABank',
        'Bac A Bank',
        'HDBank',
        'LienVietPostBank',
        'VIB',
        'PVcomBank',
      ];

  @override
  Future<ResponseList<Withdraw>> getWithdraws({
    int pageSize = 20,
    int page = 1,
    String sort = "id",
    String order = "desc",
  }) =>
      ApiService.create().getWithdraws(
        pageSize: pageSize,
        page: page,
        sort: sort,
        order: order,
      );

  @override
  Future postWithdraws(Map<String, dynamic> request) => ApiService.create().postWithdraw(request);

  @override
  Future payWithdraw({required int id, required String reply, required int userId}) {
    final request = {
      "id": id,
      "reply": reply,
      "user_id": userId,
    };
    return ApiService.create().payWithdraw(request);
  }

  @override
  Future<Image?> convertBankAccountToQrImage({
    required Withdraw withdraw,
    required double size,
  }) async {
    final bankKey = withdraw.bankKey;
    final bankAccount = withdraw.numberAccount;
    if (bankKey != 0 && bankAccount.isNotEmpty) {
      int x = 14 + bankAccount.length;
      int y = 30 + x;
      String codeInput =
          "00020101021238${y}0010A00000072701${x}0006${bankKey}01${bankAccount.length.toDigit(2)}${bankAccount}0208QRIBFTTA530370454${withdraw.money.toString().length.toDigit(2)}${withdraw.money}5802VN62${(withdraw.reply.length + 4).toDigit(2)}08${withdraw.reply.length.toDigit(2)}${withdraw.reply}6304";
      final crc = Crc16CcittFalse().convert(utf8.encode(codeInput));
      final crcString = crc.toRadixString(16).padLeft(4, '0');
      codeInput += crcString.toUpperCase();
      return await _toQrImageData(codeInput, bankKey, bankAccount, size);
    }
    return null;
  }

  Future<Image> _toQrImageData(
    String text,
    int bankCode,
    String bankAccount,
    double size,
  ) async {
    try {
      return await QrPainter(
        data: text,
        version: QrVersions.auto,
        gapless: false,
      ).toImage(size);
    } catch (e) {
      rethrow;
    }
  }

  @override
  String getReply(Withdraw withdraw) => "EMO pay for ${withdraw.code}";
}
